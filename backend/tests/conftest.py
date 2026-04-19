import pytest
from flask import Flask
from app import create_app, database as db
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
def runner(app):
    return app.test_cli_runner()

def bind_commit_to_savepoint():
    # flush to a nested savepoint instead of real commit
    db.session.begin_nested()  

@pytest.fixture(autouse=True)
def rollback_after_test(app):
    with app.app_context():
        db.session.begin_nested()

        with patch.object(db.session, 'commit', bind_commit_to_savepoint):
            yield

        # roll back DB changes
        db.session.rollback()
        db.session.remove()
