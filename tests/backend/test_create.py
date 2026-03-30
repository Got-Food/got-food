from copy import deepcopy

# Used in testing the "Pantries" table
PANTRY_VALID_MANDATORY_DATA = {
    "url": "https://www.google.com",
    "name": "Test Creation Pantry",
    "address": "123 Main Street",
    "city": "Arlington",
    "state": "VA",
    "zip": "20301",
    "latitude": 38.86860932010702,
    "longitude": -77.05817942501781,
    "has_variable_hours": False,
}

# Used in testing the "PantryHours" table
HOURS_VALID_MANDATORY_DATA = {
    "pantry_id": 1,
    "day_of_week": "MONDAY",
    "status": "OPEN",
}


def test_pantries_null_data(client):
    response = client.post("/api/pantries", data=None)
    assert response.status_code == 400


def test_pantries_mandatory_fields_some_missing(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    del data["address"]
    del data["zip"]
    del data["has_variable_hours"]
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_mandatory_fields_are_none(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    for k in data:
        data[k] = None
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_mandatory_fields_all_valid(client):
    response = client.post("/api/pantries", data=PANTRY_VALID_MANDATORY_DATA)
    assert response.status_code == 201
    assert response.location == "/api/pantries/71"
    assert response.body["id"] == 71
    assert response.body["name"] == "Test Creation Pantry"


def test_pantries_malformed_url_type(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    # URL does not have max string length (text type), so test bad type
    data["url"] = -1
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_malformed_name_max_len(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    # Test max string length constraint
    data["name"] = "NULL" * (255 // 4 + 1)
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_malformed_name_type(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    # Test max string length constraint
    data["name"] = -1
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_malformed_address_max_len(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["address"] = "NULL" * (255 // 4 + 1)
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_malformed_address_type(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["address"] = -1
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_malformed_city_max_len(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["city"] = "NULL" * ((100 // 4) + 1)
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_malformed_city_type(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["city"] = -1
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_malformed_state_max_len(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["state"] = "ABC"
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_malformed_state_type(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["state"] = -1
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_malformed_zip_max_len(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["zip"] = "X" * 12
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_malformed_zip_type(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["zip"] = -1
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_malformed_latitude_max_len(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["latitude"] = 1 * 10**20
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_malformed_latitude_type(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["latitude"] = "Hello world!"
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_malformed_longitude_max_len(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["longitude"] = 1 * 10**20
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_malformed_longitude_type(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["longitude"] = "Hello world!"
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_malformed_has_variable_hours_type(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["has_variable_hours"] = "Hello world!"
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_optional_fields_some_missing(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["comments"] = "Hello world!"
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 201


def test_pantries_optional_fields_some_none(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["comments"] = None
    data["supported_diet"] = None
    data["eligibility"] = "20301"
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 201


def test_pantries_eligibility_violating_constraint(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["comments"] = None
    data["supported_diet"] = None
    data["eligibility"] = "Hello world!"
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_coordinates_violating_constraint(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["latitude"] = 47.605356379302464
    data["longitude"] = -122.33293685730997
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 400


def test_pantries_optional_fields_all_valid(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["comments"] = "Only open on every third Saturday of the month."
    data["supported_diet"] = "Halal"
    data["eligibility"] = "20301"
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 201


def test_pantries_colliding_id(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["id"] = 1
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 201
    assert response.body["id"] == 71


def test_pantries_any_id(client):
    data = deepcopy(PANTRY_VALID_MANDATORY_DATA)
    data["id"] = 10000
    response = client.post("/api/pantries", data=data)
    assert response.status_code == 201
    assert response.body["id"] == 71


# Test "PantryHours" table
def test_hours_null_data(client):
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours", data=None
    )
    assert response.status_code == 400


def test_hours_mandatory_fields_some_missing(client):
    data = deepcopy(HOURS_VALID_MANDATORY_DATA)
    del data["pantry_id"]
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 400


def test_hours_mandatory_fields_are_none(client):
    data = deepcopy(HOURS_VALID_MANDATORY_DATA)
    for k in data:
        data[k] = None
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 400


def test_hours_malformed_pantry_id_type(client):
    # Test handling of form data
    data = deepcopy(HOURS_VALID_MANDATORY_DATA)
    data["pantry_id"] = "Hello world!"
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 400

    # Test handling of bad URI
    response = client.post(f"/api/pantries/{data["pantry_id"]}/hours", data=data)
    assert response.status_code == 404


def test_hours_malformed_day_of_week_type(client):
    data = deepcopy(HOURS_VALID_MANDATORY_DATA)
    data["day_of_week"] = 0.15
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 400


def test_hours_malformed_day_of_week_value(client):
    data = deepcopy(HOURS_VALID_MANDATORY_DATA)
    data["day_of_week"] = "Hello world!"
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 400


def test_hours_malformed_status_type(client):
    data = deepcopy(HOURS_VALID_MANDATORY_DATA)
    data["status"] = 0.15
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 400


def test_hours_malformed_status_value(client):
    data = deepcopy(HOURS_VALID_MANDATORY_DATA)
    data["status"] = "NONE?"
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 400


def test_hours_mandatory_fields_all_valid(client):
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours",
        data=HOURS_VALID_MANDATORY_DATA,
    )
    assert response.status_code == 201
    assert (
        response.location
        == f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours"
    )
    assert response.body["status"] == "OPEN"
    assert response.body["day_of_week"] == "MONDAY"


def test_hours_optional_fields_some_missing(client):
    data = deepcopy(HOURS_VALID_MANDATORY_DATA)
    data["open_time"] = "7:00:00 AM"
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 201
    assert response.body["open_time"] == "7:00:00 AM"


def test_hours_optional_fields_malformed_open_time(client):
    data = deepcopy(HOURS_VALID_MANDATORY_DATA)
    data["open_time"] = "Hello world!"
    data["close_time"] = "7:00:00 PM"
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 400


def test_hours_optional_fields_malformed_close_time(client):
    data = deepcopy(HOURS_VALID_MANDATORY_DATA)
    data["open_time"] = "7:00:00 AM"
    data["close_time"] = "Hello world!"
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 400


def test_hours_optional_fields_some_none(client):
    # Test when open time is defined
    data = deepcopy(HOURS_VALID_MANDATORY_DATA)
    data["open_time"] = "7:00:00 PM"
    data["close_time"] = None
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 201

    # Test when neither open or close time are defined, but status is closed
    data["open_time"] = None
    data["close_time"] = None
    data["status"] = "CLOSED"
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 201


def test_hours_optional_fields_violating_constraints(client):
    # Test NULL open + close time, but status says "Open"
    data = deepcopy(HOURS_VALID_MANDATORY_DATA)
    data["open_time"] = None
    data["close_time"] = None
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 400

    # Test NULL open time, but defined close time
    data = deepcopy(HOURS_VALID_MANDATORY_DATA)
    data["open_time"] = None
    data["close_time"] = "7:00:00 PM"
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 400

    # Test close time earlier than open time
    data["open_time"] = "6:00:00 AM"
    data["close_time"] = "5:00:00 AM"
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 400


def test_hours_optional_fields_all_valid(client):
    # Test normal OPEN range
    data = deepcopy(HOURS_VALID_MANDATORY_DATA)
    data["open_time"] = "6:00:00 AM"
    data["close_time"] = "7:00:00 PM"
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 201

    # Test CLOSED time entry
    data["open_time"] = None
    data["close_time"] = None
    data["status"] = "CLOSED"
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 201


def test_hours_invalid_pantry_id(client):
    # Test when URI DNE
    data = deepcopy(HOURS_VALID_MANDATORY_DATA)
    data["pantry_id"] = 1000
    response = client.post(f"/api/pantries/{data["pantry_id"]}/hours", data=data)
    assert response.status_code == 404

    # Test when form data doesn't match the URI
    data["pantry_id"] = 2
    response = client.post(
        f"/api/pantries/{HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 400


def test_hours_given_primary_id(client):
    # Test when URI DNE
    data = deepcopy(HOURS_VALID_MANDATORY_DATA)
    data["id"] = 1
    response = client.post(f"/api/pantries/{data["pantry_id"]}/hours", data=data)
    assert response.status_code == 201
    assert response.body["id"] > 1


def test_hours_colliding_entry(client):
    response = client.post(
        f"/api/pantries/63/hours",
        data={
            "pantry_id": 63,
            "day_of_week": "WEDNESDAY",
            "status": "CLOSED",
            "open_time": None,
            "close_time": None,
        },
    )
    assert response.status_code == 409
