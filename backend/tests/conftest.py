"""Configures the Pytest fixtures that will run according to their given scope
as the various test suites run."""

# Perform monkey patching before any imports or test config so Locust HTTP
# management works correctly.
from gevent import monkey

monkey.patch_all()

import pytest
import requests
import time
from app import create_app, database as db
from flask_jwt_extended import create_access_token
from gevent.pywsgi import WSGIServer
from unittest.mock import patch

MOCKED_COORDS = (38.838026363222, -77.0487012623659)
"""Coordinates that are returned in lieu of actual Geocode API calls to grab
coordinates from an address. They lead to the Innovation Campus, in Alexandria, 
VA.
"""


@pytest.fixture()
def mock_geocode():
    """Simulates a call to the Geocode API by patching the requests.get call
    to the API with a return of the mock coordinates.

    This prevents us from consuming the API key's limit when running tests.
    """
    with patch("app.utils.requests.get") as mock:
        mock.return_value.json.return_value = {
            "RESULTS": {
                "result": {
                    "coordinates": {"lat": MOCKED_COORDS[0], "lon": MOCKED_COORDS[1]}
                }
            }
        }
        yield


@pytest.fixture(scope="session")
def app():
    """Session-scoped app fixture to keep a single Flask instance in use.

    Note that the Locust test makes use of the live application actually listening
    on localhost per-test, instead of this inactive Flask app.
    """
    app = create_app()
    app.config.update(
        {
            "TESTING": True,
        }
    )

    yield app


@pytest.fixture(scope="session")
def jwt_token(app):
    """Generate a JWT access token for the whole session using the app fixture
    context.

    This token is not reused for the Locust load tests, since each "user" as part
    of the load test does not hit any admin-sensitive API endpoints. They only
    load test read operations.
    """
    with app.app_context():
        return create_access_token(
            identity="api-test-suite",
            additional_claims={"role": "admin"},
        )


@pytest.fixture()
def client(app):
    """Returns the app's test client for simulating API queries."""
    return app.test_client()


@pytest.fixture()
def live_app():
    """Launches a live instance of the application for use outside of the test
    client context. Currently primarily used for the Locust load balancing tests.

    Clients can connect to the application via http://localhost:5000. Functions
    that need to call to the live instance should include this fixture in their
    parameters, as this is a function-scoped fixture.
    """
    app = create_app()
    server = WSGIServer(("127.0.0.1", 5000), app)
    server.start()

    # wait until server is actually ready
    for _ in range(20):
        try:
            requests.get("http://localhost:5000")
            break
        except requests.ConnectionError:
            time.sleep(0.1)

    yield

    # Clean up after test function exits
    server.stop()


def bind_commit_to_savepoint():
    """Flush to a nested savepoint instead of a real commit.

    This is set for our tests to prevent the pollution of the database by test
    commits. It keeps the DB state clean between tests by creating a savepoint
    that we can roll back to instead of a DB commit.
    """
    db.session.begin_nested()


@pytest.fixture(autouse=True)
def rollback_after_test(app):
    """Resets the database to the last savepoint after each test to keep the
    DB state clean."""
    with app.app_context():
        db.session.begin_nested()

        with patch.object(db.session, "commit", bind_commit_to_savepoint):
            yield

        # roll back DB changes
        db.session.rollback()
        db.session.remove()


@pytest.fixture()
def populate_user_tables(client, mock_geocode):
    # Populate Pantries
    client.post(
        "/api/community/pantries",
        data={
            "name": "Test Creation User Pantry 1",
            "address": "3625 Potomac Ave",
            "city": "Alexandria",
            "state": "VA",
            "zip": "22305",
            "supported_diets": ["HALAL"],
            "has_variable_hours": False,
        },
    )

    client.post(
        "/api/community/pantries",
        data={
            "name": "Test Creation User Pantry 2",
            "address": "3625 Potomac Ave",
            "city": "Alexandria",
            "state": "VA",
            "zip": "22305",
            "eligibility": ["ALL"],
            "has_variable_hours": True,
        },
    )

    client.post(
        "/api/community/pantries",
        data={
            "name": "Test Creation User Pantry 3",
            "address": "3625 Potomac Ave",
            "city": "Alexandria",
            "state": "VA",
            "zip": "22305",
            "eligibility": ["22305"],
            "supported_diets": ["KOSHER"],
            "has_variable_hours": False,
        },
    )

    # Populate the UserHours table
    client.post(
        "/api/community/pantries/1",
        data={
            "pantry_id": 1,
            "day_of_week": "MONDAY",
            "status": "CLOSED",
        },
    )

    client.post(
        "/api/community/pantries/2",
        data={
            "pantry_id": 2,
            "day_of_week": "WEDNESDAY",
            "status": "CLOSED",
        },
    )

    client.post(
        "/api/community/pantries/3",
        data={
            "pantry_id": 3,
            "day_of_week": "SATURDAY",
            "status": "CLOSED",
        },
    )

    # Populate the UserEvents table
    client.post(
        "/api/community/events",
        data={
            "name": "Test Creation User Event 1",
            "address": "3625 Potomac Ave",
            "city": "Alexandria",
            "state": "VA",
            "zip": "22305",
            "is_students_only": True,
            "supported_diets": ["HALAL"],
            "date_and_time": "2026-05-05 12:00:00",
        },
    )

    client.post(
        "/api/community/events",
        data={
            "name": "Test Creation User Event 2",
            "address": "3625 Potomac Ave",
            "city": "Alexandria",
            "state": "VA",
            "zip": "22305",
            "is_students_only": True,
            "supported_diets": ["KOSHER"],
            "date_and_time": "2026-05-05 12:00:00",
        },
    )

    client.post(
        "/api/community/events",
        data={
            "name": "Test Creation User Event 3",
            "address": "3625 Potomac Ave",
            "city": "Alexandria",
            "state": "VA",
            "zip": "22305",
            "is_students_only": False,
            "supported_diets": ["HALAL"],
            "date_and_time": "2026-05-05 12:00:00",
        },
    )
