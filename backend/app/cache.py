from flask_caching import Cache

"""Global cache variable. Can be configured to use Redis with a Flask application
via create_app() in __init__.py."""
cache = Cache()
