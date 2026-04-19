# -------------------------
# GET /api/pantries?supported_diets=
# -------------------------

def test_filter_by_kosher_returns_valid_diets(client):
    response = client.get("/api/pantries?supported_diets=KOSHER")
    data = response.get_json()
    assert response.status_code == 200
    for pantry in data:
        assert pantry["supported_diets"] is not None
        assert any(d in pantry["supported_diets"] for d in ["KOSHER", "ANY"])


def test_filter_by_halal_returns_valid_diets(client):
    response = client.get("/api/pantries?supported_diets=HALAL")
    data = response.get_json()
    assert response.status_code == 200
    for pantry in data:
        assert pantry["supported_diets"] is not None
        assert any(d in pantry["supported_diets"] for d in ["HALAL", "ANY"])


def test_filter_by_kosher_and_halal_returns_valid_diets(client):
    response = client.get("/api/pantries?supported_diets=KOSHER,HALAL")
    data = response.get_json()
    assert response.status_code == 200
    for pantry in data:
        assert pantry["supported_diets"] is not None
        assert any(d in pantry["supported_diets"] for d in ["KOSHER", "HALAL", "ANY"])


# -------------------------
# GET /api/pantries?varied_only=
# -------------------------

def test_filter_varied_only_true_returns_results(client):
    response = client.get("/api/pantries?varied_only=true")
    data = response.get_json()
    assert response.status_code == 200
    assert len(data) > 0

def test_filter_varied_only_true_all_have_variable_hours(client):
    response = client.get("/api/pantries?varied_only=true")
    data = response.get_json()
    assert all(p["has_variable_hours"] is True for p in data)


# -------------------------
# GET /api/pantries?eligibility=
# -------------------------

def test_filter_by_nonexistent_zip_returns_only_any(client):
    response = client.get("/api/pantries?eligibility=11111")
    data = response.get_json()
    assert response.status_code == 200
    assert len(data) > 0
    for pantry in data:
        assert pantry["eligibility"] is not None
        assert "ANY" in pantry["eligibility"] or "ANY (VA)" in pantry["eligibility"]

def test_filter_by_existing_zip_returns_any_or_matching(client):
    response = client.get("/api/pantries?eligibility=20180")
    data = response.get_json()
    assert response.status_code == 200
    assert len(data) > 0
    for pantry in data:
        assert pantry["eligibility"] is not None
        assert any(e in pantry["eligibility"] for e in ["ANY", "ANY (VA)", "20180"])