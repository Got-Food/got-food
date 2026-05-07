from copy import deepcopy

USER_EVENT_VALID_MANDATORY_DATA = {
    "name": "Test Creation User Event",
    "full_address": "3625 Potomac Ave, Alexandria, VA 22305",
    "is_students_only": True,
    "date_and_time": "2026-05-05 12:00:00",
}


def test_user_events_all_mandatory_fields_valid(client, mock_geocode):
    response = client.post(
        f"/api/community/events", data=USER_EVENT_VALID_MANDATORY_DATA
    )
    assert response.status_code == 201
    assert response.json["name"] == USER_EVENT_VALID_MANDATORY_DATA["name"]


def test_user_events_some_missing_mandatory_fields(client, mock_geocode):
    data = deepcopy(USER_EVENT_VALID_MANDATORY_DATA)
    del data["name"]
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400


def test_user_events_malformed_name(client, mock_geocode):
    data = deepcopy(USER_EVENT_VALID_MANDATORY_DATA)
    data["name"] = "NULL" * (255 // 4 + 1)
    response = client.post("/api/community/events", data=data)
    assert response.status_code == 400


def test_user_events_malformed_full_address(client, mock_geocode):
    data = deepcopy(USER_EVENT_VALID_MANDATORY_DATA)
    data["full_address"] = "NULL" * (255 // 4 + 1)
    response = client.post("/api/community/events", data=data)
    assert response.status_code == 400


def test_user_events_malformed_is_students_only(client, mock_geocode):
    data = deepcopy(USER_EVENT_VALID_MANDATORY_DATA)
    data["is_students_only"] = "test"
    response = client.post("/api/community/events", data=data)
    assert response.status_code == 400


def test_user_events_malformed_date_and_time(client, mock_geocode):
    data = deepcopy(USER_EVENT_VALID_MANDATORY_DATA)
    data["date_and_time"] = 0.0
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["date_and_time"] = True
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["date_and_time"] = "test"
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["date_and_time"] = "2026-05-05"
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["date_and_time"] = "12:00:00"
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400


def test_user_events_some_optional_fields_missing(client, mock_geocode):
    data = deepcopy(USER_EVENT_VALID_MANDATORY_DATA)
    data["url"] = "https://www.google.com"
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 201


def test_user_events_some_optional_fields_none(client, mock_geocode):
    data = deepcopy(USER_EVENT_VALID_MANDATORY_DATA)
    data["url"] = None
    data["email"] = None
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 201


def test_user_events_malformed_url(client, mock_geocode):
    data = deepcopy(USER_EVENT_VALID_MANDATORY_DATA)
    data["url"] = 0.0
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["url"] = "test"
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["url"] = True
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400


def test_user_events_malformed_phone(client, mock_geocode):
    data = deepcopy(USER_EVENT_VALID_MANDATORY_DATA)
    data["phone"] = 0.0
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["phone"] = "test"
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["phone"] = False
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["phone"] = "1234567890"
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["phone"] = "NULL" * (25 // 4 + 1)
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400


def test_user_events_malformed_email(client, mock_geocode):
    data = deepcopy(USER_EVENT_VALID_MANDATORY_DATA)
    data["email"] = 0.0
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["email"] = True
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["email"] = "test"
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["email"] = "test@"
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["email"] = "@test.com"
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["email"] = ".com"
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["email"] = "NULL" * (255 // 4 + 1)
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400


def test_user_events_malformed_supported_diets(client, mock_geocode):
    data = deepcopy(USER_EVENT_VALID_MANDATORY_DATA)
    data["supported_diets"] = 0.0
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["supported_diets"] = "test"
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["supported_diets"] = True
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["supported_diets"] = [1, 2]
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400

    data["supported_diets"] = ["test", "test"]
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 400


def test_user_events_optional_fields_all_valid(client, mock_geocode):
    data = deepcopy(USER_EVENT_VALID_MANDATORY_DATA)
    data["url"] = "https://www.google.com"
    data["phone"] = "+1 703-538-8324"
    data["email"] = "admin@gotfood.org"
    data["supported_diets"] = ["Halal", "Kosher"]
    data["comments"] = "This is a test pantry."
    response = client.post(f"/api/community/events", data=data)
    assert response.status_code == 201
