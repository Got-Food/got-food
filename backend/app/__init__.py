import os
from datetime import timedelta
from flask import Flask
from flask_cors import CORS
from flask_jwt_extended import JWTManager
from flask_talisman import Talisman

from .cache import cache
from .database import database


def create_app() -> Flask:
    """An app factory that returns a configured Flask application."""
    app = Flask(__name__)

    # -------------------------
    # Database
    # -------------------------
    app.config["SQLALCHEMY_DATABASE_URI"] = os.environ.get("DATABASE_URL")
    app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
    database.init_app(app)

    # -------------------------
    # JWT
    # -------------------------
    app.config["JWT_SECRET_KEY"] = os.environ.get("JWT_SECRET_KEY", "dev-secret-change-in-production")
    app.config["JWT_ACCESS_TOKEN_EXPIRES"] = timedelta(hours=8)
    JWTManager(app)

    # -------------------------
    # Cache
    # -------------------------
    redis_url = os.environ.get("REDIS_URL", "redis://redis:6379")
    cache.init_app(
        app,
        config={
            "CACHE_TYPE": "RedisCache",
            "CACHE_REDIS_URL": redis_url,
            "CACHE_DEFAULT_TIMEOUT": os.environ.get("REDIS_CACHE_TIMEOUT", 300),
        },
    )

    # -------------------------
    # CORS
    # -------------------------
    allowed_origins = os.environ.get("CORS_ORIGINS", "http://localhost:5173").split(",")
    CORS(app, resources={r"/api/*": {"origins": allowed_origins}})

    # -------------------------
    # Security headers (Talisman)
    # Force HTTPS only in production; disabled in dev so local demo works.
    # -------------------------
    force_https = os.environ.get("FLASK_ENV", "development") == "production"
    Talisman(
        app,
        force_https=force_https,
        strict_transport_security=force_https,
        content_security_policy=False,
        x_content_type_options=True,
        x_xss_protection=True,
        referrer_policy="strict-origin-when-cross-origin",
    )

    # -------------------------
    # Blueprints
    # -------------------------
    from .api import api
    from .auth import auth

    app.register_blueprint(api, url_prefix="/api")
    app.register_blueprint(auth, url_prefix="/api/auth")

    return app
