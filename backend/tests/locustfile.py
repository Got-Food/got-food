"""Configures an APIUser Locust class that simulates a single user of our API.

This file will define any user classes that we need to use in Locust load tests.
Each user class simulates a single user of our API. For example, we can tune
the wait time between endpoints, chance of different endpoint choices, etc.
"""

from locust import HttpUser, between, task
import random
import logging

# Disable individual user thread messages to keep stdout clean
logging.getLogger("werkzeug").setLevel(logging.ERROR)


class APIUser(HttpUser):
    wait_time = between(1, 3)
    """Defines the user's simulated wait time between API queries, in seconds."""
    
    host = "http://localhost:5000"
    """The endpoint that will be queried. Currently, this is set to hit the live
    app that's initialized at a function scope in conftest.py."""

    def on_start(self):
        """Grab the current number of pantry entries every time a Locust
        load test starts."""
        self.pantry_ct = len(self.client.get("/api/pantries").json())

    @task
    def get_all_pantries(self):
        """Hit the API endpoint to grab all pantries in the DB."""
        with self.client.get("/api/pantries", catch_response=True) as res:
            if res.status_code != 200:
                res.failure(
                    f"Error: GET request failed. Got HTTP status code {res} instead of expected 200 OK."
                )

    @task
    def get_specific_pantry(self):
        """Hit the API endpoint to grab a specific pantry. Randomize the ID chosen."""
        with self.client.get(
            f"/api/pantries/{random.randint(1, self.pantry_ct)}", catch_response=True
        ) as res:
            if res.status_code != 200:
                res.failure(
                    f"Error: GET request failed. Got HTTP status code {res} instead of expected 200 OK."
                )

    @task
    def get_specific_pantry_hours(self):
        """Hit the API endpoint to grab a specific pantry's hours entries. Randomize
        the ID chosen."""
        with self.client.get(
            f"/api/pantries/{random.randint(1, self.pantry_ct)}/hours",
            catch_response=True,
        ) as res:
            if res.status_code != 200:
                res.failure(
                    f"Error: GET request failed. Got HTTP status code {res} instead of expected 200 OK."
                )
