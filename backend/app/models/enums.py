from enum import Enum


class SupportedDiet(Enum):
    """An enumeration for all supported diets in the database.

    Note that a value of "ANY" means that a given pantry is willing to support
    any dietary restriction a customer may have. A value of "NONE" means that
    a given pantry is not able to support any dietary restrictions; i.e. "you
    get what you get."
    """

    HALAL = "HALAL"
    VEGAN = "VEGAN"
    VEGETARIAN = "VEGETARIAN"
    KOSHER = "KOSHER"
    ANY = "ANY"
    NONE = "NONE"

    def serialize(self) -> str:
        return self.name


class Weekday(Enum):
    """An enumeration for all possible open/closed days in the database."""

    SUNDAY = "SUNDAY"
    MONDAY = "MONDAY"
    TUESDAY = "TUESDAY"
    WEDNESDAY = "WEDNESDAY"
    THURSDAY = "THURSDAY"
    FRIDAY = "FRIDAY"
    SATURDAY = "SATURDAY"

    def serialize(self) -> str:
        return self.name


class HourlyRangeStatus(Enum):
    """An enumeration for all hourly range statuses in the database.

    A value of "OPEN" means that a given pantry is open for the specified range
    of times. This can include variable hourly ranges, where a pantry may open
    at a definitive time but stay open until supplies last. A value of "CLOSED"
    means that a given pantry is closed for the specified range of times. A
    value of "UNKNOWN" is moreso a catch-all for any unique or vague situations.
    """

    OPEN = "OPEN"
    CLOSED = "CLOSED"
    UNKNOWN = "UNKNOWN"

    def serialize(self) -> str:
        return self.name
