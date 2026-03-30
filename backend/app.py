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
        eligibility=request.form.get("eligibility"),
        supported_diets=request.form.get("supported_diets"),
        comments=request.form.get("comments"),
        has_variable_hours=request.form.get("has_variable_hours", type=bool),
    )

    try:
        db.session.add(pantry)
        res = db.session.commit()
    except (IntegrityError, DataError) as e:
        db.session.rollback()
        res = {"error_type": type(e).__name__, "message": str(e)}
        print("\n\n\n" + str(res) + "\n\n\n", flush=True)
        return res, 400
    print("\n\n\n" + str(res) + "\n\n\n", flush=True)
    return res, 201


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
    pantry_id = request.form.get("pantry_id")
    day_of_week = request.form.get("day_of_week", type=Weekday)
    status = request.form.get("status", type=HourlyRangeStatus)
    open_time = request.form.get("open_time")
    close_time = request.form.get("close_time")

    # Ensure mandatory fields present
    err = ""
    if pantry_id is None:
        err += "pantry_id"
    if day_of_week is None:
        err += "day_of_week" if len(err) == 0 else ", day_of_week"
    if status is None:
        err += "status" if len(err) == 0 else ", status"
    if len(err) > 0:
        abort(
            400,
            f"Mandatory pantry_hours field(s) {{{err}}} were not present in the request.",
        )

    # Validate given open time, close time, and status, if any
    match status:
        case "OPEN":
            if open_time is None:  # OPEN: (NULL, 7:00:00 PM)
                abort(
                    400,
                    f"An opening time needs to be specified for an OPEN hourly range.",
                )
            if close_time is not None:  # OPEN: (7:00:00 AM, 6:00:00 PM)
                validate_open_and_close_times(open_time, close_time)
        case "CLOSED" | "UNKNOWN":
            if open_time is None:
                if close_time is not None:  # CLOSED: (NULL, 6:00:00 PM)
                    abort(
                        400,
                        "An opening time needs to be given with a corresponding close time.",
                    )
            else:
                if close_time is None:  # CLOSED: (7:00:00 PM, NULL)
                    abort(
                        400,
                        "If an opening time is provided, a fixed closing time must be provided for CLOSED hourly ranges.",
                    )
                else:  # CLOSED: (7:00:00 AM, 6:00:00 PM)
                    validate_open_and_close_times(open_time, close_time)
        case _:
            abort(400, f"Given status {{{status}}} is not an acceptable value.")

    # perform insertion
    hours = PantryHours()
    hours.pantry_id = pantry_id
    hours.day_of_week = day_of_week
    hours.status = status
    hours.open_time = open_time
    hours.close_time = close_time
    db.session.add(hours)
    try:
        db.session.commit()
    except Exception as e:
        abort(401, "collision?")
    else:
        return


# Helper function that will abort, returning 400 BAD REQUEST if the user-given
# open and close times are either malformed or invalid.
def validate_open_and_close_times(open: str, close: str) -> None:
    try:
        open_datetime = datetime.strftime(open, "%-I:%M:%S %p")
        close_datetime = datetime.strftime(close, "%-I:%M:%S %p")
    except Exception as e:
        abort(
            400,
            f"Malformed open or close time (open:{{{open}}}, close:{{{close}}}). Please provide the times in format HH:MM:SS <AM/PM>; e.g. 7:00:00 PM.",
        )
    else:
        if close_datetime < open_datetime:
            abort(
                400, f"Closing time {{{close}}} is later than opening time {{{open}}}."
            )


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
