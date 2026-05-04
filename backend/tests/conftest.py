# Perform monkey patching before any imports or test config so Locust HTTP
# management works correctly.
from gevent import monkey

monkey.patch_all()

import pytest
import requests
import time
from app import create_app, database as db
from gevent.pywsgi import WSGIServer
from unittest.mock import patch


@pytest.fixture(scope="session")
def app():
    app = create_app()
    app.config.update(
        {
            "TESTING": True,
        }
    )

    yield app


@pytest.fixture()
def client(app):
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
    with app.app_context():
        db.session.begin_nested()

        with patch.object(db.session, "commit", bind_commit_to_savepoint):
            yield

        # roll back DB changes
        db.session.rollback()
        db.session.remove()
