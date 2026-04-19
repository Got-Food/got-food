from typing import Protocol, runtime_checkable

@runtime_checkable
class Serializable(Protocol):
    def serializable(self) -> str | list:
        pass