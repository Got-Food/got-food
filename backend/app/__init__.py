import os
from .cache import cache
from .database import database
from flask import Flask

def create_app():
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