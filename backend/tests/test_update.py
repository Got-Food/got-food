# -------------------------
# PUT /api/pantries/<id>
# -------------------------


def test_put_pantry_not_found(client):
    response = client.put("/api/pantries/999999", data={"name": "New Name"})
    assert response.status_code == 404


def test_put_pantry_returns_200(client):
    response = client.put("/api/pantries/1", data={"name": "Updated Name"})
    assert response.status_code == 200


def test_put_pantry_updates_name(client):
    response = client.put("/api/pantries/1", data={"name": "Updated Name"})
    assert response.get_json()["name"] == "Updated Name"


def test_put_pantry_updates_url(client):
    response = client.put("/api/pantries/1", data={"url": "https://updated.com"})
    assert response.get_json()["url"] == "https://updated.com"


def test_put_pantry_updates_address(client):
    response = client.put("/api/pantries/1", data={"address": "999 New Street"})
    assert response.get_json()["address"] == "999 New Street"


def test_put_pantry_updates_city(client):
    response = client.put("/api/pantries/1", data={"city": "Fairfax"})
    assert response.get_json()["city"] == "Fairfax"


def test_put_pantry_updates_state(client):
    response = client.put("/api/pantries/1", data={"state": "VA"})
    assert response.get_json()["state"] == "VA"


def test_put_pantry_updates_zip(client):
    response = client.put("/api/pantries/1", data={"zip": "20301"})
    assert response.get_json()["zip"] == "20301"


def test_put_pantry_updates_phone(client):
    response = client.put("/api/pantries/1", data={"phone": "(703) 000-0000"})
    assert response.get_json()["phone"] == "(703) 000-0000"


def test_put_pantry_updates_email(client):
    response = client.put("/api/pantries/1", data={"email": "test@test.com"})
    assert response.get_json()["email"] == "test@test.com"


def test_put_pantry_updates_comments(client):
    response = client.put("/api/pantries/1", data={"comments": "Updated comment."})
    assert response.get_json()["comments"] == "Updated comment."


def test_put_pantry_updates_latitude(client):
    response = client.put("/api/pantries/1", data={"latitude": 38.12345678901234})
    assert response.status_code == 200


def test_put_pantry_updates_longitude(client):
    response = client.put("/api/pantries/1", data={"longitude": -77.12345678901234})
    assert response.status_code == 200


def test_put_pantry_updates_has_variable_hours(client):
    response = client.put("/api/pantries/1", data={"has_variable_hours": "false"})
    assert response.status_code == 200
    assert response.get_json()["has_variable_hours"] is False


def test_put_pantry_updates_supported_diets(client):
    response = client.put(
        "/api/pantries/1", data={"supported_diets": ["HALAL", "VEGAN"]}
    )
    assert response.status_code == 200
    assert response.get_json()["supported_diets"] == ["HALAL", "VEGAN"]


def test_put_pantry_updates_eligibility(client):
    response = client.put("/api/pantries/1", data={"eligibility": ["20301"]})
    assert response.status_code == 200
    assert response.get_json()["eligibility"] == ["20301"]


def test_put_pantry_invalid_has_variable_hours(client):
    response = client.put("/api/pantries/1", data={"has_variable_hours": "notabool"})
    assert response.status_code == 400


def test_put_pantry_invalid_diet(client):
    response = client.put("/api/pantries/1", data={"supported_diets": ["NOTADIET"]})
    assert response.status_code == 400


def test_put_pantry_malformed_state_too_long(client):
    response = client.put("/api/pantries/1", data={"state": "ABC"})
    assert response.status_code == 400


def test_put_pantry_coordinates_outside_virginia(client):
    response = client.put(
        "/api/pantries/1",
        data={
            "latitude": 47.605356379302464,
            "longitude": -122.33293685730997,
        },
    )
    assert response.status_code == 400


def test_put_pantry_does_not_change_unspecified_fields(client):
    original = client.get("/api/pantries/1").get_json()
    client.put("/api/pantries/1", data={"name": "Changed Name"})
    updated = client.get("/api/pantries/1").get_json()
    assert updated["address"] == original["address"]
    assert updated["city"] == original["city"]
    assert updated["zip"] == original["zip"]


# -------------------------
# PUT /api/pantries/<id>/hours/<hours_id>
# -------------------------


def test_put_hours_not_found(client):
    response = client.put("/api/pantries/1/hours/999999", data={"status": "CLOSED"})
    assert response.status_code == 404


def test_put_hours_wrong_pantry_id(client):
    # hours_id=1 belongs to pantry_id=1, not pantry_id=999999
    response = client.put("/api/pantries/999999/hours/1", data={"status": "CLOSED"})
    assert response.status_code == 404


def test_put_hours_returns_200(client):
    hours = client.get("/api/pantries/1/hours").get_json()[0]
    response = client.put(
        f"/api/pantries/1/hours/{hours['id']}", data={"status": "CLOSED"}
    )
    assert response.status_code == 200


def test_put_hours_updates_status(client):
    hours = client.get("/api/pantries/1/hours").get_json()[0]
    response = client.put(
        f"/api/pantries/1/hours/{hours['id']}", data={"status": "UNKNOWN"}
    )
    assert response.get_json()["status"] == "UNKNOWN"


def test_put_hours_updates_open_time(client):
    hours = client.get("/api/pantries/1/hours").get_json()[0]
    response = client.put(
        f"/api/pantries/1/hours/{hours['id']}",
        data={"status": "OPEN", "open_time": "9:00 AM"},
    )
    assert response.status_code == 200
    assert response.get_json()["open_time"] == "9:00 AM"


def test_put_hours_updates_close_time(client):
    hours = client.get("/api/pantries/1/hours").get_json()[0]
    response = client.put(
        f"/api/pantries/1/hours/{hours['id']}",
        data={"status": "OPEN", "open_time": "9:00 AM", "close_time": "5:00 PM"},
    )
    assert response.status_code == 200
    assert response.get_json()["close_time"] == "5:00 PM"


def test_put_hours_malformed_open_time(client):
    hours = client.get("/api/pantries/1/hours").get_json()[0]
    response = client.put(
        f"/api/pantries/1/hours/{hours['id']}",
        data={"open_time": "not-a-time"},
    )
    assert response.status_code == 400


def test_put_hours_malformed_close_time(client):
    hours = client.get("/api/pantries/1/hours").get_json()[0]
    response = client.put(
        f"/api/pantries/1/hours/{hours['id']}",
        data={"close_time": "not-a-time"},
    )
    assert response.status_code == 400


def test_put_hours_does_not_change_unspecified_fields(client):
    hours = client.get("/api/pantries/1/hours").get_json()[0]
    original_day = hours["day_of_week"]
    client.put(f"/api/pantries/1/hours/{hours['id']}", data={"status": "UNKNOWN"})
    updated = client.get("/api/pantries/1/hours").get_json()
    updated_hour = next(h for h in updated if h["id"] == hours["id"])
    assert updated_hour["day_of_week"] == original_day
