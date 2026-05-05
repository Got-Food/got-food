import os
from functools import wraps

from flask import Blueprint, request, jsonify
from flask_jwt_extended import (
    create_access_token,
    jwt_required,
    get_jwt,
    get_jwt_identity,
)

auth = Blueprint("auth", __name__)


def admin_required(fn):
    """Decorator that requires a valid JWT with role == 'admin'."""

    @wraps(fn)
    @jwt_required()
    def wrapper(*args, **kwargs):
        if get_jwt().get("role") != "admin":
            return {"error": "Admin access required."}, 403
        return fn(*args, **kwargs)

    return wrapper


@auth.route("/login", methods=["POST"])
def login():
    ADMIN_EMAIL = os.environ.get("SEED_ADMIN_EMAIL", "").strip().lower()
    ADMIN_PASSWORD = os.environ.get("SEED_ADMIN_PASSWORD", "").strip()
    given_email = request.form.get("email", "").strip().lower()
    given_password = request.form.get("password", "")

    if not ADMIN_EMAIL or not ADMIN_PASSWORD:
        return {"error": "Admin account not configured."}, 503

    if given_email != ADMIN_EMAIL or given_password != ADMIN_PASSWORD:
        return {"error": "Invalid email or password."}, 401

    token = create_access_token(
        identity=given_email,
        additional_claims={"role": "admin"},
    )
    return jsonify({"access_token": token, "role": "admin"}), 200


@auth.route("/logout", methods=["POST"])
@jwt_required()
def logout():
    return {"message": "Successfully logged out."}, 200


@auth.route("/users/me", methods=["GET"])
@jwt_required()
def get_me():
    return jsonify({"email": get_jwt_identity(), "role": "admin"}), 200
