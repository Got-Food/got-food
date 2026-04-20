from typing import Protocol, runtime_checkable


@runtime_checkable
class Serializable(Protocol):
    """A mypy runtime-enforcable protocol that defines a "Serializable" type.

    This is useful for when developers want to enforce that some function
    accepts an argument/returns a value of type "Serializable", guaranteeing
    that the object with such a type implements its own serialize() function.
    This function can be used when returning data to users within jsonify().
    """

    def serialize(self) -> str | list:
        pass
