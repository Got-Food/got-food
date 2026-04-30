import json
import os
import requests
from flask import Blueprint, request, jsonify, abort
from sqlalchemy.exc import IntegrityError, DataError
from werkzeug.exceptions import HTTPException
from psycopg2 import errors
from sqlalchemy import or_
from datetime import datetime
from zoneinfo import ZoneInfo

from .models import Weekday, SupportedDiet, HourlyRangeStatus, Pantries, PantryHours
from .cache import cache
from .database import database as db

api = Blueprint("api", __name__)


@api.errorhandler(HTTPException)
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
def get_pantries_memoized(
    zip_code, city, supported_diets, eligibility, open_now, varied_only, show_unknown
):
    """Memoized helper function for the GET /pantries endpoint.

    By memoizing the URL query parameters passed to /pantries, we are able to
    cache the responses for each unique combination of URL query parameters.
    This makes API responses both accurate and fast.
    """
    query = db.select(Pantries).order_by(Pantries.id)
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

        condition = Pantries.supported_diets.overlap(["ANY"] + supported_diets)
        if show_unknown:
            condition = or_(condition, Pantries.supported_diets == None)
        query = query.where(condition)

    if eligibility:
        condition = Pantries.eligibility.overlap(["ANY", "ANY (VA)", eligibility])
        if show_unknown:
            condition = or_(condition, Pantries.eligibility == None)
        query = query.where(condition)

    if open_now:
        # Use the current EST time for current time and day of week, in case
        # this application is being run from another time zone.
        current_est_time = datetime.now(ZoneInfo("America/New_York"))
        current_weekday = list(Weekday)[(current_est_time.weekday() + 1) % 7].value

        # Match current time in EST time zone to the format of the database
        # (e.g. "6:00:00 PM", not "18:00:00")
        formatted_est_time = current_est_time.strftime("%-I:%M:%S %p")
        query = query.join(PantryHours, Pantries.id == PantryHours.pantry_id).where(
            PantryHours.day_of_week == current_weekday,
            (
                or_(PantryHours.status == "OPEN", PantryHours.status == "UNKNOWN")
                if show_unknown
                else PantryHours.status == "OPEN"
            ),
            PantryHours.open_time < formatted_est_time,
            or_(
                PantryHours.close_time == None,
                PantryHours.close_time > formatted_est_time,
            ),
        )

    if varied_only:
        query = query.where(Pantries.has_variable_hours == True)

    results = db.session.execute(query).scalars().all()
    results = [x.serialize() for x in results]
    return jsonify(results)


@api.route("/pantries", methods=["GET"])
def get_pantries():
    """API endpoint server that wraps the memoized helper function get_pantries_memoized()."""
    return get_pantries_memoized(
        request.args.get("zip"),
        request.args.get("city"),
        request.args.get("supported_diets"),
        request.args.get("eligibility"),
        request.args.get("open_now", type=bool),
        request.args.get("varied_only", type=bool),
        request.args.get("show_unknown", type=bool),
    )


@api.route("/pantries", methods=["POST"])
def post_pantries():
    """Inserts a new row into the pantries table based on the given form data."""
    pantry = Pantries(
        url=request.form.get("url"),
        name=request.form.get("name"),
        address=request.form.get("address"),
        city=request.form.get("city"),
        state=request.form.get("state"),
        zip=request.form.get("zip"),
        latitude=request.form.get("latitude", type=float),
        longitude=request.form.get("longitude", type=float),
        phone=request.form.get("phone"),
        email=request.form.get("email"),
        eligibility=request.form.getlist("eligibility"),
        supported_diets=request.form.getlist("supported_diets"),
        comments=request.form.get("comments"),
        has_variable_hours=request.form.get("has_variable_hours"),
    )

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
    cache.delete_memoized(get_pantries_memoized)
    cache.delete_memoized(get_pantry_by_id, pantry.id)
    cache.delete_memoized(get_pantry_hours, pantry.id)
    return jsonify(pantry.serialize()), 201


@api.route("/pantries/<int:pantry_id>", methods=["GET"])
@cache.memoize()
def get_pantry_by_id(pantry_id):
    """Grabs a specific pantry from the pantries table by unique ID.

    Caches the response based on the ID of the pantry.
    """
    pantry = db.get_or_404(Pantries, pantry_id)
    pantry = pantry.serialize()
    return jsonify(pantry)


@api.route("/pantries/<int:pantry_id>", methods=["PUT"])
def put_pantry_by_id(pantry_id):
    """Updates the fields of a specific pantry with id pantry_id, based on given
    form data.

    Note that this function uses getlist() for eligibility and supported_diets,
    while the GET functions use get() and split(..., ','). This is because
    the fields are passed as form data here, which lends itself well to the getlist()
    format (eligibility=22000 && eligibility=22001 && eligibility=22002 ...) rather
    than the CSV approach we take in the GET functions (...?eligibility=22000,22001,22002...).
    """
    pantry = db.get_or_404(Pantries, pantry_id)

    # Update only fields that were provided
    fields = [
        "url",
        "name",
        "address",
        "city",
        "state",
        "zip",
        "phone",
        "email",
        "comments",
    ]
    for field in fields:
        value = request.form.get(field)
        if value is not None:
            setattr(pantry, field, value)

    latitude = request.form.get("latitude", type=float)
    if latitude is not None:
        pantry.latitude = latitude

    longitude = request.form.get("longitude", type=float)
    if longitude is not None:
        pantry.longitude = longitude

    eligibility = request.form.getlist("eligibility")
    if eligibility:
        pantry.eligibility = eligibility

    # Convert supported_diets to enum equivalent
    supported_diets = request.form.getlist("supported_diets")
    if supported_diets:
        try:
            pantry.supported_diets = [SupportedDiet(d.upper()) for d in supported_diets]
        except (KeyError, ValueError) as e:
            abort(
                400,
                f"Given diet(s) {e.args[0]} do not match available choices: {", ".join(SupportedDiet._member_names_)}",
            )

    # Convert has_variable_hours to bool equivalent
    has_variable_hours = request.form.get("has_variable_hours")
    if has_variable_hours is not None:
        match has_variable_hours.casefold():
            case "true":
                pantry.has_variable_hours = True
            case "false":
                pantry.has_variable_hours = False
            case _:
                abort(
                    400,
                    f"has_variable_hours must be boolean, not {{{has_variable_hours}}}.",
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
    cache.delete_memoized(get_pantries_memoized)
    cache.delete_memoized(get_pantry_by_id, pantry_id)
    cache.delete_memoized(get_pantry_hours, pantry_id)
    return jsonify(pantry.serialize()), 200


@api.route("/pantries/<int:pantry_id>", methods=["DELETE"])
def delete_pantry_by_id(pantry_id):
    """Deletes a row from the pantries table based on given pantry_id.

    Clears the cache after deletion to prevent stale values.
    """
    res = Pantries.query.filter(Pantries.id == pantry_id).delete()

    # If more than 1 row was deleted, this indicates a critical DB error,
    # since the combination of (id, pantry_id) should be unique
    if res > 1:
        db.session.rollback()
        abort(500, "The server encountered a multiple deletion error.")
    elif res == 0:
        abort(404, f"The targeted resource of pantry ID {pantry_id} was not found.")
    db.session.commit()
    cache.delete_memoized(get_pantries_memoized)
    cache.delete_memoized(get_pantry_by_id, pantry_id)
    cache.delete_memoized(get_pantry_hours, pantry_id)
    return {}, 200


@api.route("/pantries/<int:pantry_id>/hours", methods=["GET"])
@cache.memoize()
def get_pantry_hours(pantry_id):
    """Gets a pantry's hourly listings based on a given pantry_id."""
    query = db.select(PantryHours).filter_by(pantry_id=pantry_id)
    hours = db.session.execute(query).scalars().all()
    hours = [h.serialize() for h in hours]
    return jsonify(hours)


@api.route("/pantries/<int:pantry_id>/hours", methods=["POST"])
def post_pantry_hours(pantry_id):
    """Inserts an hourly listing for pantry with ID pantry_id.

    Note that for submitted data, a submitted pantry ID in the form must align
    with the pantry ID given in the URI. Otherwise, we throw 400 BAD REQUEST.
    """

    hours = PantryHours(
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

    cache.delete_memoized(get_pantries_memoized)
    cache.delete_memoized(get_pantry_by_id, pantry_id)
    cache.delete_memoized(get_pantry_hours, pantry_id)
    return jsonify(hours.serialize()), 201


@api.route("/pantries/<int:pantry_id>/hours/<int:hours_id>", methods=["PUT"])
def put_pantry_hours(pantry_id, hours_id):
    """Updates the fields of an hourly entry with ID hours_id for some pantry with
    ID pantry_id.
    """
    hours = db.session.execute(
        db.select(PantryHours).filter_by(id=hours_id, pantry_id=pantry_id)
    ).scalar_one_or_none()

    if hours is None:
        abort(
            404,
            "The hours entry associated with the given pantry and hours IDs was not found.",
        )

    day_of_week = request.form.get("day_of_week", type=Weekday)
    if day_of_week is not None:
        hours.day_of_week = day_of_week

    status = request.form.get("status", type=HourlyRangeStatus)
    if status is not None:
        hours.status = status

    open_time = request.form.get("open_time")
    close_time = request.form.get("close_time")
    try:
        if open_time is not None:
            hours.open_time = datetime.strptime(open_time, "%I:%M %p")
        if close_time is not None:
            hours.close_time = datetime.strptime(close_time, "%I:%M %p")
    except ValueError as e:
        abort(
            400,
            f"Open and closing times need to be of the form HH:MM <AM/PM>, not '{e.args[0]}'.",
        )

    try:
        db.session.commit()
    except Exception as e:
        db.session.rollback()
        match e.orig:
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

    cache.delete_memoized(get_pantries_memoized)
    cache.delete_memoized(get_pantry_by_id, pantry_id)
    cache.delete_memoized(get_pantry_hours, pantry_id)
    return jsonify(hours.serialize()), 200


@api.route("/pantries/<int:pantry_id>/hours/<int:hours_id>", methods=["DELETE"])
def delete_hourly_range_by_id(pantry_id, hours_id):
    """Deletes some hourly range with ID hours_id from the entries of a pantry
    with ID pantry_id.
    """
    res = PantryHours.query.filter(
        PantryHours.pantry_id == pantry_id, PantryHours.id == hours_id
    ).delete()

    # If more than 1 row was deleted, this indicates a critical DB error,
    # since the combination of (id, pantry_id) should be unique
    if res > 1:
        db.session.rollback()
        abort(500, "The server encountered a multiple deletion error.")
    elif res == 0:
        abort(404, f"The targeted resource of pantry ID {pantry_id} was not found.")
    db.session.commit()
    cache.delete_memoized(get_pantries_memoized)
    cache.delete_memoized(get_pantry_by_id, pantry_id)
    cache.delete_memoized(get_pantry_hours, pantry_id)
    return {}, 200


#For Geo Code
@api.route("/geocode")
def geocode():
    address = request.args.get("address")

    if not address:
        return jsonify({"error": "Address is required"}), 400
    
    #I am grabbing the GEOCODE_API_KEY from a local .env in got-food right now, not sure if this will still work after deployment
    API_KEY = os.getenv("GEOCODE_API_KEY")
    if not API_KEY:
        return jsonify({"error": "Missing GEOCODE_API_KEY"}), 500

    url = "https://api.geocode.farm/forward/"
    params = {
        "addr": address,
        "key": API_KEY
    }

    try:
        response = requests.get(url, params=params)
        data = response.json()

        result = data.get("RESULTS", {}).get("result", {})
        coords = result.get("coordinates", {})

        if coords:
            return jsonify({
                "lat": coords.get("lat"),
                "lon": coords.get("lon"),
                "formatted_address": result.get("address", {}).get("full_address")
            })
        else:
            return jsonify({"error": "No results found"}), 404

    except Exception as e:
        return jsonify({"error": str(e)}), 500
