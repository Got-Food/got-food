import json
import phonenumbers
from phonenumbers import NumberParseException

import validators
from datetime import datetime
from email_validator import validate_email, EmailNotValidError
from flask import Blueprint, request, abort, jsonify
from sqlalchemy import or_
from werkzeug.exceptions import HTTPException
from zoneinfo import ZoneInfo
from sqlalchemy.exc import IntegrityError, DataError
from psycopg2 import errors

from .auth import admin_required
from .cache import cache
from .database import database as db
from .models import (
    UserPantries,
    UserPantryHours,
    SupportedDiet,
    Weekday,
    UserEvents,
    HourlyRangeStatus,
)
from .utils import get_coordinates

community = Blueprint("community", __name__)


@community.errorhandler(HTTPException)
def handle_exception(e):
    """
    Default generic error handler from the Flask docs.
    Returns JSON instead of HTML for HTTP errors.
    Automatically converts Aborts to JSON.
    """
    response = e.get_response()
    response.data = json.dumps(
        {
            "code": e.code,
            "name": e.name,
            "description": e.description,
        }
    )
    response.content_type = "application/json"
    return response


@cache.memoize()
def get_user_pantries_memoized(
    zip_code, city, supported_diets, eligibility, open_now, varied_only, show_unknown
):
    """Memoized helper function for the GET /pantries endpoint.

    By memoizing the URL query parameters passed to /pantries, we are able to
    cache the responses for each unique combination of URL query parameters.
    This makes API responses both accurate and fast.
    """
    query = db.select(UserPantries).order_by(UserPantries.id)
    if zip_code:
        query = query.filter_by(zip=zip_code)

    if city:
        query = query.filter_by(city=city)

    if supported_diets:
        try:
            supported_diets = [
                SupportedDiet(d.upper()) for d in supported_diets.split(",")
            ]
        except ValueError as e:
            abort(
                404,
                f"Given diet(s) {e.args[0]} do not match available choices: {", ".join(SupportedDiet._member_names_)}",
            )

        condition = UserPantries.supported_diets.overlap(["ANY"] + supported_diets)
        if show_unknown:
            condition = or_(condition, UserPantries.supported_diets == None)
        query = query.where(condition)

    if eligibility:
        condition = UserPantries.eligibility.overlap(["ANY", "ANY (VA)", eligibility])
        if show_unknown:
            condition = or_(condition, UserPantries.eligibility == None)
        query = query.where(condition)

    if open_now:
        # Use the current EST time for current time and day of week, in case
        # this application is being run from another time zone.
        current_est_time = datetime.now(ZoneInfo("America/New_York"))
        current_weekday = list(Weekday)[(current_est_time.weekday() + 1) % 7].value

        # Match current time in EST time zone to the format of the database
        # (e.g. "6:00:00 PM", not "18:00:00")
        formatted_est_time = current_est_time.strftime("%-I:%M:%S %p")
        query = query.join(
            UserPantryHours, UserPantries.id == UserPantryHours.pantry_id
        ).where(
            UserPantryHours.day_of_week == current_weekday,
            (
                or_(
                    UserPantryHours.status == "OPEN",
                    UserPantryHours.status == "UNKNOWN",
                )
                if show_unknown
                else UserPantryHours.status == "OPEN"
            ),
            UserPantryHours.open_time < formatted_est_time,
            or_(
                UserPantryHours.close_time == None,
                UserPantryHours.close_time > formatted_est_time,
            ),
        )

    if varied_only:
        query = query.where(UserPantries.has_variable_hours == True)

    results = db.session.execute(query).scalars().all()
    results = [x.serialize() for x in results]
    return jsonify(results)


@community.route("/pantries", methods=["GET"])
def get_user_pantries():
    """API endpoint server that wraps the memoized helper function."""
    return get_user_pantries_memoized(
        request.args.get("zip"),
        request.args.get("city"),
        request.args.get("supported_diets"),
        request.args.get("eligibility"),
        request.args.get("open_now", type=bool),
        request.args.get("varied_only", type=bool),
        request.args.get("show_unknown", type=bool),
    )


@community.route("/pantries", methods=["POST"])
def post_user_pantries():
    """Inserts a new row into the user_pantries table based on the given form data.

    Dynamically calculates the latitude and longitude from the given address.
    """
    pantry = UserPantries(
        name=request.form.get("name"),
        address=request.form.get("address"),
        city=request.form.get("city"),
        state=request.form.get("state"),
        zip=request.form.get("zip"),
        has_variable_hours=request.form.get("has_variable_hours"),
        latitude=None,
        longitude=None,
        url=request.form.get("url"),
        phone=request.form.get("phone"),
        email=request.form.get("email"),
        eligibility=request.form.getlist("eligibility"),
        supported_diets=request.form.getlist("supported_diets"),
        comments=request.form.get("comments"),
    )

    # Validate optional parameters
    if pantry.url is not None and not validators.url(pantry.url):
        abort(
            400,
            f"User submitted invalid URL '{pantry.url}'. URL needs to be of proper format.",
        )

    if pantry.phone:
        try:
            num = phonenumbers.parse(pantry.phone)
        except NumberParseException:
            abort(
                400,
                f"If submitting a phone number, the user must submit a valid format. Given phone number {pantry.phone} is of incorrect format.",
            )
        else:
            if not phonenumbers.is_valid_number(num):
                abort(
                    400,
                    f"If submitting a phone number, the user must submit a valid number. Given phone number {pantry.phone} is invalid.",
                )

    if pantry.email:
        try:
            validate_email(pantry.email)
        except EmailNotValidError:
            abort(400, f"User email '{pantry.email}' is of an invalid format.")

    # Convert supported_diets to enum equivalent
    if pantry.supported_diets is not None:
        try:
            pantry.supported_diets = [
                SupportedDiet(d.upper()) for d in pantry.supported_diets
            ]
        except ValueError as e:
            abort(
                400,
                f"Given diet(s) {e.args[0]} do not match available choices: {", ".join(SupportedDiet._member_names_)}",
            )

    # Convert has_variable_hours to bool equivalent
    if pantry.has_variable_hours is not None:
        match pantry.has_variable_hours.casefold():
            case "true":
                pantry.has_variable_hours = True
            case "false":
                pantry.has_variable_hours = False
            case _:
                abort(
                    400,
                    f"has_variable_hours must be boolean (true/false), not {{{pantry.has_variable_hours}}}.",
                )

    coords = get_coordinates(pantry.address, pantry.city, pantry.state, pantry.zip)
    if coords:
        pantry.latitude, pantry.longitude = coords
    else:
        abort(
            500,
            f"Coordinates were not able to be obtained from the given address.",
        )

    # Insert into DB
    try:
        db.session.add(pantry)
        db.session.commit()
    except (IntegrityError, DataError) as e:
        db.session.rollback()
        match e.orig:
            case errors.UniqueViolation():
                abort(
                    409,
                    "Given pantry data conflicts with an entry already in the database.",
                )
            case errors.NotNullViolation():
                abort(400, "A mandatory field was passed in as null.")
            case _:
                abort(
                    400,
                    "Malformed pantry fields. Ensure that all fields are of the correct format.",
                )

    # Clear stale cached values on success
    cache.delete_memoized(get_user_pantries_memoized)
    cache.delete_memoized(get_user_pantry, pantry.id)
    cache.delete_memoized(get_user_pantry_hours, pantry.id)
    return jsonify(pantry.serialize()), 201


@community.route("/pantries/<int:pantry_id>", methods=["GET"])
@cache.memoize()
def get_user_pantry(pantry_id):
    """Grabs a specific pantry from the user_pantries table by unique ID.

    Caches the response based on the ID of the pantry.
    """
    pantry = db.get_or_404(UserPantries, pantry_id)
    pantry = pantry.serialize()
    return jsonify(pantry)


@community.route("/pantries/<int:pantry_id>/hours", methods=["GET"])
@cache.memoize()
def get_user_pantry_hours(pantry_id):
    """Gets a user pantry's hourly listings based on a given pantry_id."""
    query = db.select(UserPantryHours).filter_by(pantry_id=pantry_id)
    hours = db.session.execute(query).scalars().all()
    hours = [h.serialize() for h in hours]
    return jsonify(hours)


@community.route("/pantries/<int:pantry_id>/hours", methods=["POST"])
@admin_required
def add_user_pantry_hours(pantry_id):
    """Inserts an hourly listing for user pantry with ID pantry_id.

    Note that for submitted data, a submitted pantry ID in the form must align
    with the pantry ID given in the URI. Otherwise, we throw 400 BAD REQUEST.
    """

    hours = UserPantryHours(
        pantry_id=request.form.get("pantry_id", type=int),
        day_of_week=request.form.get("day_of_week", type=Weekday),
        status=request.form.get("status", type=HourlyRangeStatus),
        open_time=request.form.get("open_time"),
        close_time=request.form.get("close_time"),
    )

    # Ensure URI pantry ID and form data pantry ID are in alignment
    if hours.pantry_id is not None and hours.pantry_id != pantry_id:
        abort(
            400,
            f"The pantry_id {{{hours.pantry_id}}} provided in the submitted form does not patch that of the URI, {{{pantry_id}}}. Please ensure that they are equivalent.",
        )

    # Parse datetimes, if there are any. Ensure that they are of the form
    # HH:MM <AM/PM>.
    try:
        if hours.open_time is not None:
            hours.open_time = datetime.strptime(hours.open_time, "%I:%M %p")
        if hours.close_time is not None:
            hours.close_time = datetime.strptime(hours.close_time, "%I:%M %p")
    except ValueError as e:
        abort(
            400,
            f"Open and closing times need to be of the form HH:MM <AM/PM>, not '{e.args[0]}'.",
        )

    # Insert into DB and handle specific errors
    try:
        db.session.add(hours)
        db.session.commit()
    except Exception as e:
        db.session.rollback()
        match e.orig:
            case errors.ForeignKeyViolation():
                abort(
                    404, f"Given foreign key pantry ID {hours.pantry_id} was not found."
                )
            case errors.UniqueViolation():
                abort(
                    409,
                    "The given hours entry's unique values conflict with another entry in the database.",
                )
            case _:
                abort(
                    400,
                    "Malformed pantry hours fields. Ensure that all fields are of the correct format.",
                )

    cache.delete_memoized(get_user_pantries)
    cache.delete_memoized(get_user_pantry, pantry_id)
    cache.delete_memoized(get_user_pantry_hours, pantry_id)
    return jsonify(hours.serialize()), 201


@community.route("/events", methods=["GET"])
@cache.memoize()
def get_events():
    """Obtains all user-entered events that have not occurred yet."""
    query = db.select(UserEvents).order_by(UserEvents.id)
    # Use the current EST time for current time, in case this application is
    # being run from another time zone.
    current_est_time = datetime.now(ZoneInfo("America/New_York"))
    formatted_est_time = current_est_time.strftime("%Y-%m-%d %H:%M:%S")
    query = query.where(UserEvents.date_and_time >= formatted_est_time)
    results = db.session.execute(query).scalars().all()
    results = [x.serialize() for x in results]
    return jsonify(results)


@community.route("/events", methods=["POST"])
def post_user_events():
    """Inserts a new row into the user_events table based on the given form data.

    Dynamically calculates the latitude and longitude from the given address.
    """
    event = UserEvents(
        name=request.form.get("name"),
        full_address=request.form.get("full_address"),
        is_students_only=request.form.get("is_students_only"),
        date_and_time=request.form.get("date_and_time"),
        url=request.form.get("url"),
        phone=request.form.get("phone"),
        email=request.form.get("email"),
        supported_diets=request.form.getlist("supported_diets"),
        comments=request.form.get("comments"),
    )

    # Validate mandatory datetime
    event.date_and_time = datetime.strptime(event.date_and_time, "%Y-%m-%d %H:%M:%S")

    # Validate optional parameters
    if event.url is not None and not validators.url(event.url):
        abort(
            400,
            f"User submitted invalid URL '{event.url}'. URL needs to be of proper format.",
        )

    if event.phone:
        try:
            num = phonenumbers.parse(event.phone)
        except NumberParseException:
            abort(
                400,
                f"If submitting a phone number, the user must submit a valid format. Given phone number {pantry.phone} is of incorrect format.",
            )
        else:
            if not phonenumbers.is_valid_number(num):
                abort(
                    400,
                    f"If submitting a phone number, the user must submit a valid number. Given phone number {pantry.phone} is invalid.",
                )

    if event.email:
        try:
            validate_email(event.email)
        except EmailNotValidError:
            abort(400, f"User email '{event.email}' is of an invalid format.")

    # Convert supported_diets to enum equivalent
    if event.supported_diets is not None:
        try:
            event.supported_diets = [
                SupportedDiet(d.upper()) for d in event.supported_diets
            ]
        except ValueError as e:
            abort(
                400,
                f"Given diet(s) {e.args[0]} do not match available choices: {", ".join(SupportedDiet._member_names_)}",
            )

    # Convert has_variable_hours to bool equivalent
    if event.is_students_only is not None:
        match event.is_students_only.casefold():
            case "true":
                event.is_students_only = True
            case "false":
                event.is_students_only = False
            case _:
                abort(
                    400,
                    f"is_students_only must be boolean (true/false), not {{{event.is_students_only}}}.",
                )

    # Insert into DB
    try:
        db.session.add(event)
        db.session.commit()
    except (IntegrityError, DataError) as e:
        db.session.rollback()
        match e.orig:
            case errors.UniqueViolation():
                abort(
                    409,
                    "Given event data conflicts with an entry already in the database.",
                )
            case errors.NotNullViolation():
                abort(400, "A mandatory field was passed in as null.")
            case _:
                abort(
                    400,
                    "Malformed pantry fields. Ensure that all fields are of the correct format.",
                )

    # Clear stale cached values on success
    cache.delete_memoized(get_events)
    return jsonify(event.serialize()), 201


@community.route("/events/<int:event_id>", methods=["PUT"])
@admin_required
def update_event(event_id):
    """Updates the fields of a specific event with id event_id, based on given
    form data.

    Note that this function uses getlist() for supported_diets,
    while the GET functions use get() and split(..., ','). This is because
    the fields are passed as form data here, which lends itself well to the getlist()
    format rather than the CSV approach we take in the GET functions.
    See the api.py docstrings for more detail.
    """
    event = db.get_or_404(UserEvents, event_id)
    old_datetime = event.date_and_time

    # Update only fields that were provided
    fields = [
        "name",
        "full_address",
        "is_students_only",
        "date_and_time",
        "url",
        "phone",
        "email",
        "supported_diets",
        "comments",
    ]
    for field in fields:
        value = request.form.get(field)
        if value is not None:
            setattr(event, field, value)

    # Validate mandatory datetime
    if event.date_and_time != old_datetime:
        event.date_and_time = datetime.strptime(
            event.date_and_time, "%Y-%m-%d %H:%M:%S"
        )

    # Validate optional parameters
    if event.url is not None and not validators.url(event.url):
        abort(
            400,
            f"User submitted invalid URL '{event.url}'. URL needs to be of proper format.",
        )

    if event.phone:
        try:
            num = phonenumbers.parse(event.phone)
        except NumberParseException:
            abort(
                400,
                f"If submitting a phone number, the user must submit a valid format. Given phone number {pantry.phone} is of incorrect format.",
            )
        else:
            if not phonenumbers.is_valid_number(num):
                abort(
                    400,
                    f"If submitting a phone number, the user must submit a valid number. Given phone number {pantry.phone} is invalid.",
                )

    if event.email:
        try:
            validate_email(event.email)
        except EmailNotValidError:
            abort(400, f"User email '{event.email}' is of an invalid format.")

    # Convert supported_diets to enum equivalent
    supported_diets = request.form.getlist("supported_diets")
    if supported_diets:
        try:
            event.supported_diets = [SupportedDiet(d.upper()) for d in supported_diets]
        except (KeyError, ValueError) as e:
            abort(
                400,
                f"Given diet(s) {e.args[0]} do not match available choices: {", ".join(SupportedDiet._member_names_)}",
            )

    # Convert is_students_only to bool equivalent
    is_students_only = request.form.get("is_students_only")
    if is_students_only is not None:
        match is_students_only.casefold():
            case "true":
                event.is_students_only = True
            case "false":
                event.is_students_only = False
            case _:
                abort(
                    400,
                    f"is_students_only must be boolean, not {{{is_students_only}}}.",
                )

    # Insert into DB
    try:
        db.session.commit()
    except (IntegrityError, DataError) as e:
        db.session.rollback()
        match e.orig:
            case errors.UniqueViolation():
                abort(
                    409,
                    "Given event data conflicts with an entry already in the database.",
                )
            case errors.NotNullViolation():
                abort(400, "A mandatory field was passed in as null.")
            case _:
                abort(
                    400,
                    "Malformed event fields. Ensure that all fields are of the correct format.",
                )

    # Clear stale cached values on success
    cache.delete_memoized(get_events)
    return jsonify(event.serialize()), 200


@community.route("/events/<int:event_id>", methods=["DELETE"])
@admin_required
def delete_event(event_id):
    """Deletes a row from the user_events table based on given id.

    Clears the cache after deletion to prevent stale values.
    """
    res = UserEvents.query.filter(UserEvents.id == event_id).delete()

    # If more than 1 row was deleted, this indicates a critical DB error,
    # since the combination of (id, event_id) should be unique
    if res > 1:
        db.session.rollback()
        abort(500, "The server encountered a multiple deletion error.")
    elif res == 0:
        abort(404, f"The targeted resource of event ID {event_id} was not found.")
    db.session.commit()
    cache.delete_memoized(get_events)
    return {}, 200
