from sqlalchemy.exc import IntegrityError, DataError
from werkzeug.exceptions import HTTPException
from psycopg2 import errors
from sqlalchemy import or_, and_
from datetime import datetime
from zoneinfo import ZoneInfo
from .models import Weekday, SupportedDiet, HourlyRangeStatus, Pantries, PantryHours

import json
from flask import Blueprint, request, jsonify, abort
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
    # Actual query construction
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


# =========================
# Routes
# =========================


# -------------------------
# GET /api/pantries
# Gets all pantry information. Supports URL query parameters
# for filtering.
# -------------------------
@api.route("/pantries", methods=["GET"])
def get_pantries():
    return get_pantries_memoized(
        request.args.get("zip"),
        request.args.get("city"),
        request.args.get("supported_diets"),
        request.args.get("eligibility"),
        request.args.get("open_now", type=bool),
        request.args.get("varied_only", type=bool),
        request.args.get("show_unknown", type=bool),
    )


# -------------------------
# POST /api/pantries
# Creates a new pantry entry in the Pantries table.
# -------------------------
@api.route("/pantries", methods=["POST"])
def post_pantries():
    # Construct model object
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


# -------------------------
# GET /api/pantries/<id>
# Gets all information associated with a specific pantry ID.
# -------------------------
@api.route("/pantries/<int:pantry_id>", methods=["GET"])
@cache.memoize()
def get_pantry_by_id(pantry_id):
    pantry = db.get_or_404(Pantries, pantry_id)
    pantry = pantry.serialize()
    return jsonify(pantry)


# -------------------------
# PUT /api/pantries/<id>
# Updates fields on an existing pantry entry.
# -------------------------
@api.route("/pantries/<int:pantry_id>", methods=["PUT"])
def put_pantry_by_id(pantry_id):
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


# -------------------------
# DELETE /api/pantries/<id>
# Deletes the pantry entry associated with the given unique ID.
# -------------------------
@api.route("/pantries/<int:pantry_id>", methods=["DELETE"])
def delete_pantry_by_id(pantry_id):
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


# -------------------------
# GET /api/pantries/<id>/hours
# Gets only a specific pantry's hours by ID.
# -------------------------
@api.route("/pantries/<int:pantry_id>/hours", methods=["GET"])
@cache.memoize()
def get_pantry_hours(pantry_id):
    query = db.select(PantryHours).filter_by(pantry_id=pantry_id)
    hours = db.session.execute(query).scalars().all()
    hours = [h.serialize() for h in hours]
    return jsonify(hours)


# -------------------------
# POST /api/pantries/<id>/hours
# Creates an entry into table pantry_hours.
# -------------------------
@api.route("/pantries/<int:uri_pantry_id>/hours", methods=["POST"])
def post_pantry_hours(uri_pantry_id):

    # Construct model object
    hours = PantryHours(
        pantry_id=request.form.get("pantry_id", type=int),
        day_of_week=request.form.get("day_of_week", type=Weekday),
        status=request.form.get("status", type=HourlyRangeStatus),
        open_time=request.form.get("open_time"),
        close_time=request.form.get("close_time"),
    )

    # Ensure URI pantry ID and form data pantry ID are in alignment
    if hours.pantry_id is not None and hours.pantry_id != uri_pantry_id:
        abort(
            400,
            f"The pantry_id {{{hours.pantry_id}}} provided in the submitted form does not patch that of the URI, {{{uri_pantry_id}}}. Please ensure that they are equivalent.",
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
    cache.delete_memoized(get_pantry_by_id, uri_pantry_id)
    cache.delete_memoized(get_pantry_hours, uri_pantry_id)
    return jsonify(hours.serialize()), 201


# -------------------------
# PUT /api/pantries/<pantry_id>/hours/<hours_id>
# Updates fields on an existing hourly range entry.
# -------------------------
@api.route(
    "/pantries/<int:uri_pantry_id>/hours/<int:uri_hours_id>", methods=["PUT"]
)
def put_pantry_hours(uri_pantry_id, uri_hours_id):
    hours = db.session.execute(
        db.select(PantryHours).filter_by(id=uri_hours_id, pantry_id=uri_pantry_id)
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
    cache.delete_memoized(get_pantry_by_id, uri_pantry_id)
    cache.delete_memoized(get_pantry_hours, uri_pantry_id)
    return jsonify(hours.serialize()), 200


# -------------------------
# DELETE /api/pantries/<pantry_id>/hours/<hours_id>
# Deletes a specific hourly range entry by ID for some given pantry ID.
# -------------------------
@api.route(
    "/pantries/<int:uri_pantry_id>/hours/<int:uri_hours_id>", methods=["DELETE"]
)
def delete_hourly_range_by_id(uri_pantry_id, uri_hours_id):
    res = PantryHours.query.filter(
        PantryHours.pantry_id == uri_pantry_id, PantryHours.id == uri_hours_id
    ).delete()

    # If more than 1 row was deleted, this indicates a critical DB error,
    # since the combination of (id, pantry_id) should be unique
    if res > 1:
        db.session.rollback()
        abort(500, "The server encountered a multiple deletion error.")
    elif res == 0:
        abort(404, f"The targeted resource of pantry ID {uri_pantry_id} was not found.")
    db.session.commit()
    cache.delete_memoized(get_pantries_memoized)
    cache.delete_memoized(get_pantry_by_id, uri_pantry_id)
    cache.delete_memoized(get_pantry_hours, uri_pantry_id)
    return {}, 200