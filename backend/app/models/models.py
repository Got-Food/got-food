from ..database import database as db
from .enums import SupportedDiet
from .enums import Weekday, HourlyRangeStatus

from datetime import datetime
from sqlalchemy.dialects import postgresql
from sqlalchemy.orm import relationship

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