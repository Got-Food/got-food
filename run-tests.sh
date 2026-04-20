#!/bin/bash

docker compose -f ./docker-compose.test.yml down -v && \
docker compose -f ./docker-compose.test.yml build --no-cache && \
docker compose -f ./docker-compose.test.yml up --abort-on-container-exit;

# Always run docker compose down to kill any dangling containers
docker compose -f ./docker-compose.test.yml down -v