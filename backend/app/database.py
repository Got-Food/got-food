from flask_sqlalchemy import SQLAlchemy

"""Global database variable. Can be configured to accompany a Flask application
via create_app() in __init__.py."""
database = SQLAlchemy()
