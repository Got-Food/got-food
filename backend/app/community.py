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
from .models import UserPantries, UserPantryHours, SupportedDiet, Weekday, UserEvents
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
    # cache.delete_memoized(get_pantry_by_id, pantry.id)
    # cache.delete_memoized(get_pantry_hours, pantry.id)
    return jsonify(pantry.serialize()), 201


@community.route("/events", methods=["GET"])
@cache.cached()
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
        address=request.form.get("address"),
        city=request.form.get("city"),
        state=request.form.get("state"),
        zip=request.form.get("zip"),
        is_students_only=request.form.get("is_students_only"),
        date_and_time=request.form.get("date_and_time"),
        latitude=None,
        longitude=None,
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

    coords = get_coordinates(event.address, event.city, event.state, event.zip)
    if coords:
        event.latitude, event.longitude = coords
    else:
        abort(
            500,
            f"Coordinates were not able to be obtained from the given address.",
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
    # cache.delete_memoized(get_user_events_memoized)
    # cache.delete_memoized(get_pantry_by_id, pantry.id)
    # cache.delete_memoized(get_pantry_hours, pantry.id)
    cache.delete(get_events)
    return jsonify(event.serialize()), 201

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
    cache.delete(get_events)
    return {}, 200