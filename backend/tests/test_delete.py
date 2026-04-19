from random import randint

def test_pantries_delete_id_in_table(client):
    # Verify pantry is present in table
    response = client.get("/api/pantries/63")
    assert response.status_code == 200
    assert response.json["id"] == 63
    assert response.json["name"] == "St. Stephen's United Methodist Church: First Fridays/Green Groceries"

    # Delete pantry
    response = client.delete("/api/pantries/63")
    assert response.status_code == 200

    # Verify deletion went through
    response = client.get("/api/pantries/63")
    assert response.status_code == 404

def test_pantries_delete_id_not_in_table(client):
    # Verify pantry is not present
    response = client.get("/api/pantries/1000")
    assert response.status_code == 404
    
    # Verify expected 404 from deletion
    response = client.delete("/api/pantries/1000")
    assert response.status_code == 404

def test_hours_delete_id_in_table(client):
    # Verify hours entry is present in table
    response = client.get("/api/pantries/63/hours")
    assert any([h["id"] == 435 for h in response.json])
    
    # Delete hours entry
    response = client.delete("/api/pantries/63/hours/435")
    assert response.status_code == 200

    # Verify deletion went through
    response = client.get("/api/pantries/63/hours")
    assert all([h["id"] != 435 for h in response.json])

def test_hours_delete_id_bad_uri(client):
    # Pick some hours entry that is present in table for given pantry ID
    response = client.get("/api/pantries/63/hours")
    hours_id = response.json[randint(0, len(response.json) - 1)]["id"]
    assert any([h["id"] == hours_id for h in response.json])

    # Verify hours entry is not present for another pantry
    response = client.get("/api/pantries/64/hours")
    assert all([h["id"] != hours_id for h in response.json])

    # Attempt deletion using another pantry's ID
    response = client.delete(f"/api/pantries/64/hours/{hours_id}")
    assert response.status_code == 404

    # Verify that hours entries have not changed
    response = client.get("/api/pantries/63/hours")
    assert any([h["id"] == hours_id for h in response.json])
    response = client.get("/api/pantries/64/hours")
    assert all([h["id"] != hours_id for h in response.json])


def test_hours_delete_id_not_in_table(client):
    # Verify hours entry is not present in table
    test_id = 1000
    response = client.get("/api/pantries/63/hours")
    assert all([h["id"] != test_id for h in response.json])

    # Attempt deletion
    response = client.delete("/api/pantries/63/hours/1000")
    assert response.status_code == 404

    # Verify hours information has not changed
    response = client.get("/api/pantries/63/hours")
    assert all([h["id"] != test_id for h in response.json])