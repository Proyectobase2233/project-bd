#!/bin/bash
COUNT=${1:-1}
echo "Rollback de $COUNT changeset(s)..."
docker compose run --rm liquibase rollback-count --count=$COUNT
echo "Listo"
