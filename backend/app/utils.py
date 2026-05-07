import os
import requests


def get_coordinates(
    street_address: str, city: str, state: str, zip: str
) -> tuple[float, float] | None:
    """Grabs the coordinates of a given address from Geocode using the API key.

    Returns None if there are errors, else returns a (latitude, longitude) tuple."""
    API_KEY = os.environ.get("GEOCODE_API_KEY")
    if not API_KEY:
        return None

    try:
        response = requests.get(
            "https://api.geocode.farm/forward/",
            params={
                "addr": f"{street_address}, {city}, {state} {zip}", 
                "key": API_KEY
            },
        )
        data = response.json()
        result = data.get("RESULTS", {}).get("result", {})
        coords = result.get("coordinates", {})

        if coords:
            return (float(coords.get("lat")), float(coords.get("lon")))
        else:
            return None
    except Exception as _:
        return None
