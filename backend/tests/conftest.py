import pytest
from flask import Flask
from app import app as _app, db as _db
from unittest.mock import patch


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

def bind_commit_to_savepoint():
    # flush to a nested savepoint instead of real commit
    _db.session.begin_nested()  

@pytest.fixture(autouse=True)
def rollback_after_test(app):
    with app.app_context():
        _db.session.begin_nested()

        with patch.object(_db.session, 'commit', bind_commit_to_savepoint):
            yield

        # roll back DB changes
        _db.session.rollback()
        _db.session.remove()
