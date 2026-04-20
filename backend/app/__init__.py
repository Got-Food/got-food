import os
from flask import Flask

from .cache import cache
from .database import database


def create_app() -> Flask:
    """An app factory that returns a configured Flask application.

    This function enables the use of the cache and database global variables
    in other contexts by preventing them from being permanently tied to a Flask
    application. If a user wants to create a Flask application that makes use
    of the cache and database variables, they can call this function to return
    an app that is initialized with the database and cache.

    This function also registers the "/api" endpoint blueprint with the application.
    """
    app = Flask(__name__)
    app.config["SQLALCHEMY_DATABASE_URI"] = os.environ.get("DATABASE_URL")
    app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
    database.init_app(app)
    cache.init_app(
        app,
        config={
            "CACHE_TYPE": "RedisCache",
            "CACHE_REDIS_URL": os.environ.get("REDIS_URL"),
            "CACHE_DEFAULT_TIMEOUT": os.environ.get("REDIS_CACHE_TIMEOUT"),
        },
    )
    from .api import api

    app.register_blueprint(api, url_prefix="/api")
    return app
