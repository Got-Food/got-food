EXPECTED_PANTRY_KEYS = {
    "id", "url", "name", "address", "city", "state", "zip",
    "latitude", "longitude", "phone", "email", "eligibility",
    "supported_diets", "comments", "created_at", "has_variable_hours", "hours",
}

EXPECTED_HOURS_KEYS = {
    "id", "pantry_id", "day_of_week", "status", "open_time", "close_time",
}


# -------------------------
# GET /api/pantries
# -------------------------

def test_get_all_pantries_status(client):
    response = client.get("/api/pantries")
    assert response.status_code == 200


def test_get_all_pantries_returns_list(client):
    response = client.get("/api/pantries")
    data = response.get_json()
    assert isinstance(data, list)
    assert len(data) > 0


def test_get_all_pantries_response_shape(client):
    response = client.get("/api/pantries")
    data = response.get_json()
    pantry = data[0]
    assert EXPECTED_PANTRY_KEYS == set(pantry.keys())


def test_get_all_pantries_ordered_by_id(client):
    response = client.get("/api/pantries")
    data = response.get_json()
    ids = [p["id"] for p in data]
    assert ids == sorted(ids)


# -------------------------
# GET /api/pantries?zip=
# -------------------------

def test_filter_by_zip_returns_matches(client):
    response = client.get("/api/pantries?zip=20132")
    data = response.get_json()
    assert len(data) > 0
    assert all(p["zip"] == "20132" for p in data)


def test_filter_by_zip_no_matches(client):
    response = client.get("/api/pantries?zip=00000")
    data = response.get_json()
    assert data == []


# -------------------------
# GET /api/pantries?city=
# -------------------------

def test_filter_by_city_returns_matches(client):
    response = client.get("/api/pantries?city=Sterling")
    data = response.get_json()
    assert len(data) > 0
    assert all(p["city"] == "Sterling" for p in data)


def test_filter_by_city_no_matches(client):
    response = client.get("/api/pantries?city=NotACity")
    data = response.get_json()
    assert data == []


# -------------------------
# GET /api/pantries?supported_diets=
# -------------------------

def test_filter_by_valid_diet_returns_results(client):
    # Pantry 30 (Dar Al-Hijrah) explicitly supports HALAL
    response = client.get("/api/pantries?supported_diets=HALAL")
    data = response.get_json()
    assert response.status_code == 200
    assert len(data) > 0


def test_filter_by_diet_excludes_null_diets(client):
    # Pantries with NULL supported_diets should NOT appear without show_unknown
    response = client.get("/api/pantries?supported_diets=HALAL")
    data = response.get_json()
    # Every result must have a non-null supported_diets that overlaps HALAL or ANY
    for pantry in data:
        assert pantry["supported_diets"] is not None


def test_filter_by_diet_case_insensitive(client):
    response_upper = client.get("/api/pantries?supported_diets=HALAL")
    response_lower = client.get("/api/pantries?supported_diets=halal")
    assert response_upper.status_code == 200
    assert response_lower.status_code == 200
    assert response_upper.get_json() == response_lower.get_json()


def test_filter_by_diet_multiple_values(client):
    response = client.get("/api/pantries?supported_diets=HALAL,VEGAN")
    assert response.status_code == 200
    assert isinstance(response.get_json(), list)


def test_filter_by_invalid_diet_returns_404(client):
    response = client.get("/api/pantries?supported_diets=NOTADIET")
    assert response.status_code == 404


def test_filter_by_diet_with_show_unknown_includes_null_diets(client):
    # Pantries with NULL supported_diets should appear when show_unknown is set
    response = client.get("/api/pantries?supported_diets=HALAL&show_unknown=true")
    data = response.get_json()
    assert response.status_code == 200
    has_null = any(p["supported_diets"] is None for p in data)
    assert has_null


# -------------------------
# GET /api/pantries?eligibility=
# -------------------------

def test_filter_by_eligibility_zip_includes_any_pantries(client):
    # Pantries with eligibility=ANY should match any zip query (overlap with "ANY")
    response = client.get("/api/pantries?eligibility=20132")
    data = response.get_json()
    assert response.status_code == 200
    assert len(data) > 0
    any_pantries = [p for p in data if p["eligibility"] == ["ANY"]]
    assert len(any_pantries) > 0


def test_filter_by_eligibility_with_show_unknown_includes_null(client):
    response = client.get("/api/pantries?eligibility=20132&show_unknown=true")
    data = response.get_json()
    assert response.status_code == 200
    has_null = any(p["eligibility"] is None for p in data)
    assert has_null


# -------------------------
# GET /api/pantries?varied_only=true
# -------------------------

def test_filter_varied_only_all_have_variable_hours(client):
    response = client.get("/api/pantries?varied_only=true")
    data = response.get_json()
    assert response.status_code == 200
    assert len(data) > 0
    assert all(p["has_variable_hours"] is True for p in data)


# -------------------------
# GET /api/pantries?open_now=true
# -------------------------

def test_filter_open_now_returns_200(client):
    response = client.get("/api/pantries?open_now=true")
    assert response.status_code == 200
    assert isinstance(response.get_json(), list)


# -------------------------
# GET /api/pantries/<id>
# -------------------------

def test_get_pantry_by_id_status(client):
    response = client.get("/api/pantries/1")
    assert response.status_code == 200


def test_get_pantry_by_id_correct_id(client):
    response = client.get("/api/pantries/1")
    data = response.get_json()
    assert data["id"] == 1


def test_get_pantry_by_id_response_shape(client):
    response = client.get("/api/pantries/1")
    data = response.get_json()
    assert EXPECTED_PANTRY_KEYS == set(data.keys())


def test_get_pantry_by_id_includes_hours(client):
    # Pantry 1 has 7 days of hours seeded
    response = client.get("/api/pantries/1")
    data = response.get_json()
    assert isinstance(data["hours"], list)
    assert len(data["hours"]) > 0


def test_get_pantry_by_id_not_found(client):
    response = client.get("/api/pantries/999999")
    assert response.status_code == 404


def test_get_pantry_by_id_invalid_id_type(client):
    response = client.get("/api/pantries/notanid")
    assert response.status_code == 404


# -------------------------
# GET /api/pantries/<id>/hours
# -------------------------

def test_get_hours_status(client):
    response = client.get("/api/pantries/1/hours")
    assert response.status_code == 200


def test_get_hours_returns_list(client):
    response = client.get("/api/pantries/1/hours")
    data = response.get_json()
    assert isinstance(data, list)


def test_get_hours_response_shape(client):
    response = client.get("/api/pantries/1/hours")
    data = response.get_json()
    assert len(data) > 0
    assert EXPECTED_HOURS_KEYS == set(data[0].keys())


def test_get_hours_all_belong_to_pantry(client):
    response = client.get("/api/pantries/1/hours")
    data = response.get_json()
    assert all(h["pantry_id"] == 1 for h in data)


def test_get_hours_seven_days_seeded(client):
    # Pantry 1 has hours seeded for all 7 days
    response = client.get("/api/pantries/1/hours")
    data = response.get_json()
    assert len(data) == 7


def test_get_hours_valid_day_of_week_values(client):
    valid_days = {"SUNDAY", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY"}
    response = client.get("/api/pantries/1/hours")
    data = response.get_json()
    for hour in data:
        assert hour["day_of_week"] in valid_days


def test_get_hours_valid_status_values(client):
    valid_statuses = {"OPEN", "CLOSED", "UNKNOWN"}
    response = client.get("/api/pantries/1/hours")
    data = response.get_json()
    for hour in data:
        assert hour["status"] in valid_statuses


def test_get_hours_for_nonexistent_pantry_returns_empty(client):
    # The endpoint doesn't 404 for unknown pantry_id — it returns an empty list
    response = client.get("/api/pantries/999999/hours")
    assert response.status_code == 200
    assert response.get_json() == []
