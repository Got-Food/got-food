import pytest
from flask import Flask
from app import app as _app, db as _db


@pytest.fixture()
def app():
    _app.config.update(
        {
            "TESTING": True,
        }
    )
    return _app


@pytest.fixture()
def client(app):
    return app.test_client()


@pytest.fixture()
def runner(app):
    return app.test_cli_runner()


# @pytest.fixture(autouse=True)
# def reset_to_seed(app):
#     with app.app_context():
#         # Save state before test runs
#         _db.session.execute(_db.text("SAVEPOINT seed_state"))
#         yield
#         # Roll back after test runs
#         _db.session.execute(_db.text("ROLLBACK TO SAVEPOINT seed_state"))
#         _db.session.execute(_db.text("SAVEPOINT seed_state"))  # re-arm it
#         _db.session.commit()
