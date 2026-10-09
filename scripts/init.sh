#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

if [ ! -f .env ]; then
  cp .env.example .env
  echo "Created .env from .env.example"
else
  echo ".env already exists — skipped"
fi

command -v docker >/dev/null 2>&1 || { echo "Docker not found: https://docs.docker.com/get-docker/"; exit 1; }
docker compose version >/dev/null 2>&1 || { echo "Docker Compose v2 not found (need 'docker compose')"; exit 1; }
echo "Ready. Next: choose your language (GETTING_STARTED.md §4), then 'make up'."
