#!/usr/bin/env bash
# Smoke test: the server container is running and accepts TCP connections on the published port.
# Usage: bash scripts/smoke-test.sh   (start the server first with `make up`)
set -euo pipefail
cd "$(dirname "$0")/.."
[ -f .env ] && set -a && . ./.env && set +a
HOST=localhost
PORT="${SERVER_PORT:-5000}"

for i in $(seq 1 30); do
  if (exec 3<>"/dev/tcp/$HOST/$PORT") 2>/dev/null; then
    echo "OK: server accepts TCP connections on $HOST:$PORT"
    exit 0
  fi
  sleep 1
done

echo "FAIL: nothing accepts connections on $HOST:$PORT after 30s"
docker compose ps
docker compose logs --tail=50 server
exit 1
