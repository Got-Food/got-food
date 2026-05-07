from copy import deepcopy

MOCKED_COORDS = (38.838026363222, -77.0487012623659)
"""Coordinates that are returned in lieu of actual Geocode API calls to grab
coordinates from an address. They lead to the Innovation Campus, in Alexandria, 
VA.
"""

# Used in testing the "UserPantries" table
USER_PANTRY_VALID_MANDATORY_DATA = {
    "name": "Test Creation User Pantry",
    "address": "3625 Potomac Ave",
    "city": "Alexandria",
    "state": "VA",
    "zip": "22305",
    "has_variable_hours": False,
}

# Used in testing the "UserPantryHours" table
USER_HOURS_VALID_MANDATORY_DATA = {
    "pantry_id": 1,
    "day_of_week": "MONDAY",
    "status": "CLOSED",
}


def test_user_pantries_null_data(client, mock_geocode):
    response = client.post("/api/community/pantries", data=None)
    assert response.status_code == 400


def test_user_pantries_mandatory_fields_some_missing(client, mock_geocode):
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    del data["address"]
    del data["zip"]
    del data["has_variable_hours"]
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400


def test_user_pantries_mandatory_fields_are_none(client, mock_geocode):
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    for k in data:
        data[k] = None
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400


def test_user_pantries_mandatory_fields_all_valid(client, mock_geocode):
    response = client.post(
        "/api/community/pantries",
        data=USER_PANTRY_VALID_MANDATORY_DATA,
    )
    assert response.status_code == 201
    assert response.json["name"] == USER_PANTRY_VALID_MANDATORY_DATA["name"]


def test_user_pantries_malformed_name_max_len(client, mock_geocode):
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    # Test max string length constraint
    data["name"] = "NULL" * (255 // 4 + 1)
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400


def test_user_pantries_malformed_address_max_len(client, mock_geocode):
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    data["address"] = "NULL" * (255 // 4 + 1)
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400


def test_user_pantries_malformed_city_max_len(client, mock_geocode):
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    data["city"] = "NULL" * ((100 // 4) + 1)
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400


def test_user_pantries_malformed_state_max_len(client, mock_geocode):
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    data["state"] = "ABC"
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400


def test_user_pantries_malformed_zip_max_len(client, mock_geocode):
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    data["zip"] = "X" * 12
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400


def test_user_pantries_malformed_has_variable_hours_type(client, mock_geocode):
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    data["has_variable_hours"] = "Hello world!"
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400


def test_user_pantries_optional_fields_some_missing(client, mock_geocode):
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    data["comments"] = "Hello world!"
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 201


def test_user_pantries_optional_fields_some_none(client, mock_geocode):
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    data["comments"] = None
    data["supported_diets"] = None
    data["eligibility"] = ["20301"]
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 201


def test_user_pantries_eligibility_violating_constraint(client, mock_geocode):
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    data["comments"] = None
    data["supported_diets"] = None
    data["eligibility"] = "Hello world!"
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400


def test_user_pantries_eligibility_multiple(client, mock_geocode):
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    data["comments"] = None
    data["supported_diets"] = None
    data["eligibility"] = ["24060", "24061"]
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 201
    assert response.json["eligibility"] == ["24060", "24061"]


def test_user_pantries_diets_multiple(client, mock_geocode):
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    data["comments"] = None
    data["supported_diets"] = ["Halal", "Vegan"]
    data["eligibility"] = None
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 201
    assert response.json["supported_diets"] == ["HALAL", "VEGAN"]


def test_user_pantries_bad_url(client, mock_geocode):
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    data["url"] = "Hello world!"
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400

    data["url"] = 0.0
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400


def test_user_pantries_bad_phone(client, mock_geocode):
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    data["phone"] = "Hello World!"
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400

    data["phone"] = 0.0
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400

    data["phone"] = "1234"
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400

    data["phone"] = "1234567890"
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400

    data["phone"] = "(123)4567890"
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400


def test_user_pantries_bad_email(client, mock_geocode):
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    data["email"] = "Hello world!"
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400

    data["email"] = 0.0
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400

    data["email"] = "test@"
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400

    data["email"] = "@test.com"
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400

    data["email"] = "test.com"
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400

    data["email"] = "@.com"
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 400


def test_user_pantries_optional_fields_all_valid(client, mock_geocode):
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    data["comments"] = "Only open on every third Saturday of the month."
    data["supported_diets"] = ["Halal"]
    data["eligibility"] = ["20301"]
    data["url"] = "https://www.google.com"
    data["phone"] = "+1 703-538-8324"
    data["email"] = "admin@gotfood.org"
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 201

    data["comments"] = "Only open on every third Saturday of the month."
    data["supported_diets"] = ["Halal"]
    data["eligibility"] = ["20301"]
    data["url"] = "https://www.google.com"
    data["phone"] = "+1 (703) 538-8324"
    data["email"] = "test@domain.org"
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 201

    data["comments"] = "Only open on every third Saturday of the month."
    data["supported_diets"] = ["Halal"]
    data["eligibility"] = ["20301"]
    data["url"] = "https://www.google.com"
    data["phone"] = "+1 (703) 538-8324"
    data["email"] = "test@domain.org"
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 201

    data["comments"] = "Only open on every third Saturday of the month."
    data["supported_diets"] = ["Halal"]
    data["eligibility"] = ["20301"]
    data["url"] = "https://www.google.com"
    data["phone"] = "+1 (703)-538-8324"
    data["email"] = "test@domain.org"
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 201

    data["comments"] = "Only open on every third Saturday of the month."
    data["supported_diets"] = ["Halal"]
    data["eligibility"] = ["20301"]
    data["url"] = "https://www.google.com"
    data["phone"] = "+1 (703)-538-8324"
    data["email"] = "test@domain.org"
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 201


def test_user_pantries_colliding_id(client, mock_geocode):
    response = client.post(
        "/api/community/pantries", data=USER_PANTRY_VALID_MANDATORY_DATA
    )
    assert response.status_code == 201

    # Verify that the server will ignore user-given IDs in favor of DB serialization
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    data["id"] = 10000
    assert response.status_code == 201
    assert response.json["id"] != 10000


def test_user_pantries_any_id(client, mock_geocode):
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    data["id"] = 10000
    response = client.post("/api/community/pantries", data=data)
    assert response.status_code == 201
    assert response.json["id"] != 10000


def test_user_pantries_auto_lat_and_long(client, mock_geocode):
    response = client.post(
        "/api/community/pantries", data=USER_PANTRY_VALID_MANDATORY_DATA
    )
    assert response.status_code == 201
    assert response.json["latitude"] == MOCKED_COORDS[0]
    assert response.json["longitude"] == MOCKED_COORDS[1]


# Test "UserPantryHours" table
def test_user_pantry_hours_null_data(client, mock_geocode, populate_user_tables):
    # Insert example valid user pantry to test other functionality against it
    response = client.get("/api/community/pantries")
    assert response.status_code == 200
    id = response.json[0]["id"]

    response = client.post(
        f"/api/community/pantries/{id}/hours",
        data=None,
    )
    assert response.status_code == 400


def test_user_pantry_hours_mandatory_fields_some_missing(
    client, mock_geocode, populate_user_tables
):
    response = client.get("/api/community/pantries")
    assert response.status_code == 200
    id = response.json[0]["id"]

    data = deepcopy(USER_HOURS_VALID_MANDATORY_DATA)
    del data["pantry_id"]
    response = client.post(
        f"/api/community/pantries/{id}/hours",
        data=data,
    )
    assert response.status_code == 400


def test_user_pantry_hours_mandatory_fields_are_none(
    client, mock_geocode, populate_user_tables
):
    response = client.get("/api/community/pantries")
    assert response.status_code == 200
    id = response.json[0]["id"]

    data = deepcopy(USER_HOURS_VALID_MANDATORY_DATA)
    for k in data:
        data[k] = None
    response = client.post(
        f"/api/community/pantries/{id}/hours",
        data=data,
    )
    assert response.status_code == 400


def test_user_pantry_hours_malformed_pantry_id_type(
    client, mock_geocode, populate_user_tables
):
    response = client.get("/api/community/pantries")
    assert response.status_code == 200
    id = response.json[0]["id"]

    # Test handling of form data
    data = deepcopy(USER_HOURS_VALID_MANDATORY_DATA)
    data["pantry_id"] = "Hello world!"
    response = client.post(
        f"/api/community/pantries/{id}/hours",
        data=data,
    )
    assert response.status_code == 400

    # Test handling of bad URI
    response = client.post(
        f"/api/community/pantries/{data["pantry_id"]}/hours",
        data=data,
    )
    assert response.status_code == 404


def test_user_pantry_hours_malformed_day_of_week_type(
    client, mock_geocode, populate_user_tables
):
    response = client.get("/api/community/pantries")
    assert response.status_code == 200
    id = response.json[0]["id"]

    data = deepcopy(USER_HOURS_VALID_MANDATORY_DATA)
    data["day_of_week"] = 0.15
    data["pantry_id"] = id
    response = client.post(
        f"/api/community/pantries/{id}/hours",
        data=data,
    )
    assert response.status_code == 400


def test_user_pantry_hours_malformed_day_of_week_value(
    client, mock_geocode, populate_user_tables
):
    response = client.get("/api/community/pantries")
    assert response.status_code == 200
    id = response.json[0]["id"]

    data = deepcopy(USER_HOURS_VALID_MANDATORY_DATA)
    data["day_of_week"] = "Hello world!"
    data["pantry_id"] = id
    response = client.post(
        f"/api/community/pantries/{id}/hours",
        data=data,
    )
    assert response.status_code == 400


def test_user_pantry_hours_malformed_status_type(
    client, mock_geocode, populate_user_tables
):
    response = client.get("/api/community/pantries")
    assert response.status_code == 200
    id = response.json[0]["id"]

    data = deepcopy(USER_HOURS_VALID_MANDATORY_DATA)
    data["status"] = 0.15
    data["pantry_id"] = id
    response = client.post(
        f"/api/community/pantries/{id}/hours",
        data=data,
    )
    assert response.status_code == 400


def test_user_pantry_hours_malformed_status_value(
    client, mock_geocode, populate_user_tables
):
    response = client.get("/api/community/pantries")
    assert response.status_code == 200
    id = response.json[0]["id"]

    data = deepcopy(USER_HOURS_VALID_MANDATORY_DATA)
    data["status"] = "NONE?"
    data["pantry_id"] = id
    response = client.post(
        f"/api/community/pantries/{id}/hours",
        data=data,
    )
    assert response.status_code == 400


def test_user_pantry_hours_mandatory_fields_all_valid(
    client, mock_geocode, populate_user_tables
):
    # Grab real DB entry
    response = client.get("/api/community/pantries")
    assert response.status_code == 200
    test_id = response.json[0]["id"]

    data = deepcopy(USER_HOURS_VALID_MANDATORY_DATA)
    data["pantry_id"] = test_id
    response = client.post(
        f"/api/community/pantries/{test_id}/hours",
        data=data,
    )
    assert response.status_code == 201
    assert response.json["pantry_id"] == data["pantry_id"]
    assert response.json["status"] == "CLOSED"
    assert response.json["day_of_week"] == "MONDAY"


def test_user_pantry_hours_hourly_ranges(client, mock_geocode, populate_user_tables):
    # Insert non-varied pantry
    response = client.post(
        f"/api/community/pantries", data=USER_PANTRY_VALID_MANDATORY_DATA
    )
    assert response.status_code == 201
    normal_pantry_id = response.json["id"]

    # Insert varied pantry
    data = deepcopy(USER_PANTRY_VALID_MANDATORY_DATA)
    data["has_variable_hours"] = True
    response = client.post(f"/api/community/pantries", data=data)
    assert response.status_code == 201
    varied_pantry_id = response.json["id"]

    # Test rejection of ambiguous hour ranges for non-varied pantries
    data = deepcopy(USER_HOURS_VALID_MANDATORY_DATA)
    data["open_time"] = "07:00 AM"
    data["close_time"] = None
    data["status"] = "OPEN"
    data["pantry_id"] = normal_pantry_id
    response = client.post(
        f"/api/community/pantries/{normal_pantry_id}/hours",
        data=data,
    )
    assert response.status_code == 400

    # Test that the ambiguous hour range is accepted for a varied pantry
    data["pantry_id"] = varied_pantry_id
    response = client.post(
        f"/api/community/pantries/{varied_pantry_id}/hours",
        data=data,
    )
    assert response.status_code == 201

    # Test well-defined hour ranges
    data["open_time"] = "7:00 AM"
    data["close_time"] = "12:00 PM"
    response = client.post(
        f"/api/community/pantries/{varied_pantry_id}/hours",
        data=data,
    )
    assert response.status_code == 201
    assert response.json["open_time"] == "7:00 AM"

    # Test another range on the same pantry
    data["open_time"] = "1:00 PM"
    data["close_time"] = "3:00 PM"
    response = client.post(
        f"/api/community/pantries/{varied_pantry_id}/hours",
        data=data,
    )
    assert response.status_code == 201
    assert response.json["open_time"] == "1:00 PM"

    # Test duplicate range
    response = client.post(
        f"/api/community/pantries/{varied_pantry_id}/hours",
        data=data,
    )
    assert response.status_code == 409


def test_user_pantry_hours_optional_fields_malformed_open_time(
    client, mock_geocode, populate_user_tables
):
    response = client.get("/api/community/pantries")
    assert response.status_code == 200
    id = response.json[0]["id"]

    data = deepcopy(USER_HOURS_VALID_MANDATORY_DATA)
    data["open_time"] = "Hello world!"
    data["close_time"] = "7:00 PM"
    data["pantry_id"] = id
    response = client.post(
        f"/api/community/pantries/{id}/hours",
        data=data,
    )
    assert response.status_code == 400


def test_user_pantry_hours_optional_fields_malformed_close_time(
    client, mock_geocode, populate_user_tables
):
    response = client.get("/api/community/pantries")
    assert response.status_code == 200
    id = response.json[0]["id"]

    data = deepcopy(USER_HOURS_VALID_MANDATORY_DATA)
    data["open_time"] = "7:00 AM"
    data["close_time"] = "Hello world!"
    data["pantry_id"] = id
    response = client.post(
        f"/api/community/pantries/{id}/hours",
        data=data,
    )
    assert response.status_code == 400


def test_user_pantry_hours_optional_fields_some_none(
    client, mock_geocode, populate_user_tables
):
    response = client.get("/api/community/pantries")
    assert response.status_code == 200
    test_id = response.json[0]["id"]

    # Test when neither open or close time are defined, but status is closed.
    # Use different day of week to avoid collision
    data = deepcopy(USER_HOURS_VALID_MANDATORY_DATA)
    data["day_of_week"] = "THURSDAY"
    data["open_time"] = None
    data["close_time"] = None
    data["status"] = "CLOSED"
    data["pantry_id"] = test_id
    response = client.post(
        f"/api/community/pantries/{test_id}/hours",
        data=data,
    )
    assert response.status_code == 201


def test_user_pantry_hours_optional_fields_violating_constraints(
    client, mock_geocode, populate_user_tables
):
    response = client.get("/api/community/pantries")
    assert response.status_code == 200
    test_id = response.json[0]["id"]

    # Test NULL open + close time, but status says "Open"
    data = deepcopy(USER_HOURS_VALID_MANDATORY_DATA)
    data["open_time"] = None
    data["close_time"] = None
    data["status"] = "OPEN"
    data["pantry_id"] = test_id
    response = client.post(
        f"/api/community/pantries/{test_id}/hours",
        data=data,
    )
    assert response.status_code == 400

    # Test NULL open time, but defined close time
    data["open_time"] = None
    data["close_time"] = "7:00 PM"
    response = client.post(
        f"/api/community/pantries/{test_id}/hours",
        data=data,
    )
    assert response.status_code == 400

    # Test close time earlier than open time
    # data["open_time"] = "6:00 AM"
    # data["close_time"] = "5:00 AM"
    # response = client.post(
    #     f"/api/community/pantries/{test_id}/hours",
    #     data=data,
    # )
    # assert response.status_code == 400


def test_user_pantry_hours_optional_fields_all_valid(
    client, mock_geocode, populate_user_tables
):
    response = client.get("/api/community/pantries")
    assert response.status_code == 200
    test_id = response.json[0]["id"]

    # Test normal OPEN range
    data = deepcopy(USER_HOURS_VALID_MANDATORY_DATA)
    data["open_time"] = "6:00 AM"
    data["close_time"] = "7:00 PM"
    data["status"] = "OPEN"
    data["pantry_id"] = test_id
    response = client.post(
        f"/api/community/pantries/{test_id}/hours",
        data=data,
    )
    assert response.status_code == 201

    # Test CLOSED time entry, different day to avoid collision
    data["day_of_week"] = "THURSDAY"
    data["open_time"] = None
    data["close_time"] = None
    data["status"] = "CLOSED"
    response = client.post(
        f"/api/community/pantries/{test_id}/hours",
        data=data,
    )
    assert response.status_code == 201


def test_user_pantry_hours_invalid_pantry_id(client, mock_geocode):
    response = client.post(
        f"/api/community/pantries", data=USER_PANTRY_VALID_MANDATORY_DATA
    )
    assert response.status_code == 201

    # Test when URI DNE
    data = deepcopy(USER_HOURS_VALID_MANDATORY_DATA)
    data["pantry_id"] = 1000
    response = client.post(
        f"/api/community/pantries/{data["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 404

    # Test when form data doesn't match the URI
    data["pantry_id"] = 2
    response = client.post(
        f"/api/community/pantries/{USER_HOURS_VALID_MANDATORY_DATA["pantry_id"]}/hours",
        data=data,
    )
    assert response.status_code == 400


def test_user_pantry_hours_given_primary_id(client, mock_geocode, populate_user_tables):
    response = client.get("/api/community/pantries")
    assert response.status_code == 200
    test_id = response.json[0]["id"]

    data = deepcopy(USER_HOURS_VALID_MANDATORY_DATA)
    data["pantry_id"] = test_id
    data["id"] = 10000
    response = client.post(
        f"/api/community/pantries/{data["pantry_id"]}/hours", data=data
    )
    assert response.status_code == 201
    assert response.json["id"] != 10000
