import os

from flask import Flask, request, jsonify, abort
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.dialects import postgresql
from sqlalchemy.orm import relationship
from sqlalchemy.exc import IntegrityError, DataError
from psycopg2 import errors
from sqlalchemy import or_
from datetime import datetime
from zoneinfo import ZoneInfo
from enum import Enum

app = Flask(__name__)

# =========================
# Connect to PostgreSQL using DATABASE_URL from docker-compose
# =========================
app.config["SQLALCHEMY_DATABASE_URI"] = os.environ.get("DATABASE_URL")
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

# Initialize SQLAlchemy with the Flask application
db = SQLAlchemy(app)


# =========================
# Models
# =========================
class SupportedDiet(Enum):
    HALAL = "HALAL"
    VEGAN = "VEGAN"
    VEGETARIAN = "VEGETARIAN"
    KOSHER = "KOSHER"
    ANY = "ANY"
    NONE = "NONE"

    def serialize(self):
        return self.name


class Weekday(Enum):
    SUNDAY = "SUNDAY"
    MONDAY = "MONDAY"
    TUESDAY = "TUESDAY"
    WEDNESDAY = "WEDNESDAY"
    THURSDAY = "THURSDAY"
    FRIDAY = "FRIDAY"
    SATURDAY = "SATURDAY"


class HourlyRangeStatus(Enum):
    OPEN = "OPEN"
    CLOSED = "CLOSED"
    UNKNOWN = "UNKNOWN"


class Pantries(db.Model):
    __tablename__ = "pantries"

    id = db.Column(db.Integer, primary_key=True)
    url = db.Column(db.Text, nullable=False)
    name = db.Column(db.String(255), nullable=False)
    address = db.Column(db.String(255), nullable=False)
    city = db.Column(db.String(100), nullable=False)
    state = db.Column(db.String(2), nullable=False)
    zip = db.Column(db.String(10), nullable=False)
    latitude = db.Column(db.Numeric(15, 13), nullable=False)
    longitude = db.Column(db.Numeric(15, 13), nullable=False)
    phone = db.Column(db.String(25))
    email = db.Column(db.String(255))
    eligibility = db.Column(postgresql.ARRAY(db.String(10)))
    supported_diets = db.Column(
        postgresql.ARRAY(db.Enum(SupportedDiet, name="supported_diet"))
    )
    comments = db.Column(db.Text)
    created_at = db.Column(db.DateTime, default=datetime.now())
    has_variable_hours = db.Column(db.Boolean, nullable=False)
    hours = relationship("PantryHours")

    def serialize(self):
        diets = (
            [x.serialize() for x in self.supported_diets]
            if self.supported_diets is not None
            else None
        )

        hrs = [h.serialize() for h in self.hours] if self.hours is not None else None

        return {
            "id": self.id,
            "url": self.url,
            "name": self.name,
            "address": self.address,
            "city": self.city,
            "state": self.state,
            "zip": self.zip,
            "latitude": self.latitude,
            "longitude": self.longitude,
            "phone": self.phone,
            "email": self.email,
            "eligibility": self.eligibility,
            "supported_diets": diets,
            "comments": self.comments,
            "created_at": self.created_at,
            "has_variable_hours": self.has_variable_hours,
            "hours": hrs,
        }


class PantryHours(db.Model):
    __tablename__ = "pantry_hours"

    id = db.Column(db.Integer, primary_key=True)
    pantry_id = db.Column(
        db.Integer, db.ForeignKey("pantries.id", ondelete="CASCADE"), nullable=False
    )
    day_of_week = db.Column(db.Enum(Weekday, name="weekday"), nullable=False)
    status = db.Column(
        db.Enum(HourlyRangeStatus, name="hourly_range_status"), nullable=False
    )
    open_time = db.Column(db.Time)
    close_time = db.Column(db.Time)

    def serialize(self):
        # Convert times to readable 12-hr AM/PM times
        open_time = (
            self.open_time.strftime("%-I:%M %p") if self.open_time is not None else None
        )
        close_time = (
            self.close_time.strftime("%-I:%M %p")
            if self.close_time is not None
            else None
        )

        return {
            "id": self.id,
            "pantry_id": self.pantry_id,
            "day_of_week": self.day_of_week.name,
            "status": self.status.name,
            "open_time": open_time,
            "close_time": close_time,
        }


# =========================
# Routes
# =========================


# -------------------------
# GET /api/pantries
# Gets all pantry information. Supports URL query parameters
# for filtering.
# -------------------------
@app.route("/api/pantries", methods=["GET"])
def get_pantries():
    # URL Query parameters
    zip_code = request.args.get("zip")
    city = request.args.get("city")
    supported_diets = request.args.get("supported_diets")
    eligibility = request.args.get("eligibility")
    open_now = request.args.get("open_now", type=bool)
    varied_only = request.args.get("varied_only", type=bool)
    show_unknown = request.args.get("show_unknown", type=bool)

    # Actual query construction
    query = db.select(Pantries).order_by(Pantries.id)
    if zip_code:
        query = query.filter_by(zip=zip_code)

    if city:
        query = query.filter_by(city=city)

    if supported_diets:
        # Create comma-separated list, with diets in all caps, matching DB format
        supported_diets = [x.upper() for x in supported_diets.split(",")]

        # Validate given diet query, since an error will throw if you try to
        # query an invalid ENUM value
        invalid_diets = [
            diet for diet in supported_diets if diet not in SupportedDiet._member_names_
        ]
        if len(invalid_diets) > 0:
            return jsonify(
                abort(
                    404,
                    f"ERROR: given diet(s) {invalid_diets} do not match available choices",
                )
            )

        if show_unknown:
            query = query.where(
                or_(
                    Pantries.supported_diets.overlap(["ANY"] + supported_diets),
                    Pantries.supported_diets == None,
                )
            )
        else:
            query = query.where(
                Pantries.supported_diets.overlap(["ANY"] + supported_diets)
            )

    if eligibility:
        if show_unknown:
            query = query.where(
                or_(
                    Pantries.eligibility.overlap(["ANY", "ANY (VA)", eligibility]),
                    Pantries.eligibility == None,
                )
            )
        else:
            query = query.where(
                Pantries.eligibility.overlap(["ANY", "ANY (VA)", eligibility]),
            )

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


# -------------------------
# POST /api/pantries
# Creates a new pantry entry in the Pantries table.
# -------------------------
@app.route("/api/pantries", methods=["POST"])
def post_pantries():
    # If variable hours is present, ensure that it is a boolean
    has_variable_hours = request.form.get("has_variable_hours")
    if has_variable_hours is not None:
        if has_variable_hours.casefold() == "true":
            has_variable_hours = True
        elif has_variable_hours.casefold() == "false":
            has_variable_hours = False
        else:
            res = {
                "error_type": ValueError.__name__,
                "message": f"has_variable_hours must be boolean, not {{{has_variable_hours}}}.",
            }
            return res, 400

    # Split eligibility, diets into lists
    eligibility = request.form.get("eligibility")
    if eligibility is not None:
        eligibility = eligibility.split(",")
    supported_diets = request.form.get("supported_diets")
    if supported_diets is not None:
        supported_diets = supported_diets.split(",")

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
        eligibility=eligibility,
        supported_diets=supported_diets,
        comments=request.form.get("comments"),
        has_variable_hours=has_variable_hours,
    )

    try:
        db.session.add(pantry)
        db.session.commit()
    except (IntegrityError, DataError) as e:
        db.session.rollback()
        res = {"error_type": type(e).__name__, "message": str(e)}
        # Collision with another row
        if type(e.orig) is errors.UniqueViolation:
            return res, 409
        return res, 400
    return jsonify(pantry.serialize()), 201


# -------------------------
# GET /api/pantries/<id>
# Gets all information associated with a specific pantry ID.
# -------------------------
@app.route("/api/pantries/<int:pantry_id>", methods=["GET"])
def get_pantry_by_id(pantry_id):
    pantry = db.get_or_404(Pantries, pantry_id)
    pantry = pantry.serialize()
    return jsonify(pantry)


# -------------------------
# GET /api/pantries/<id>/hours
# Gets only a specific pantry's hours by ID.
# -------------------------
@app.route("/api/pantries/<int:pantry_id>/hours", methods=["GET"])
def get_pantry_hours(pantry_id):
    query = db.select(PantryHours).filter_by(pantry_id=pantry_id)
    hours = db.session.execute(query).scalars().all()
    hours = [h.serialize() for h in hours]
    return jsonify(hours)


# -------------------------
# POST /api/pantries/<id>/hours
# Creates an entry into table pantry_hours.
# -------------------------
@app.route("/api/pantries/<int:uri_pantry_id>/hours", methods=["POST"])
def post_pantry_hours(uri_pantry_id):
    # Ensure URI pantry ID and form data pantry ID are in alignment
    pantry_id = request.form.get("pantry_id", type=int)
    if pantry_id is not None and pantry_id != uri_pantry_id:
        return {
            "error_type": "ValueError",
            "message": f"The pantry_id {{{pantry_id}}} provided in the submitted form does not patch that of the URI, {{{uri_pantry_id}}}. Please ensure that they are equivalent.",
        }, 400

    # Parse datetimes, if there are any. Ensure that they are of the form
    # HH:MM <AM/PM>.
    open_time = request.form.get("open_time")
    close_time = request.form.get("close_time")
    try:
        if open_time is not None:
            open_time = datetime.strptime(open_time, "%I:%M %p")
        if close_time is not None:
            close_time = datetime.strptime(close_time, "%I:%M %p")
    except ValueError as e:
        return {
            "error_type": type(e).__name__,
            "message": "Open and closing times need to be of the form HH:MM <AM/PM>.",
        }, 400

    hours = PantryHours(
        pantry_id=request.form.get("pantry_id", type=int),
        day_of_week=request.form.get("day_of_week", type=Weekday),
        status=request.form.get("status", type=HourlyRangeStatus),
        open_time=open_time,
        close_time=close_time,
    )

    # Insert into DB and handle specific errors
    try:
        db.session.add(hours)
        db.session.commit()
    except Exception as e:
        db.session.rollback()
        res = {"error_type": type(e).__name__, "message": str(e)}

        # Bad reference to entry in pantries table
        if type(e.orig) is errors.ForeignKeyViolation:
            return res, 404
        # Collision with another row
        elif type(e.orig) is errors.UniqueViolation:
            return res, 409
        # Bad form data
        return res, 400
    return jsonify(hours.serialize()), 201


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
