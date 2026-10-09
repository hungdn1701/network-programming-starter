# CLAUDE.md — Instructions for Claude Code

Full project rules and source of truth: [`.ai/AGENTS.md`](.ai/AGENTS.md)

## Project
Network Programming university assignment (INT1433). Technology-agnostic, Docker-first.

## Key Rules
- Technology-agnostic: Any language/framework is valid
- Docker-first: All code runs inside containers (`docker compose up --build`)
- Server binds to `0.0.0.0`, never `127.0.0.1` inside Docker
- Client communicates with `server:5000` via Docker DNS
- Protocol documented in `docs/protocol-design.md`
- Concurrency required: server must support multiple concurrent clients
- Environment variables for all networking configs (`.env`)
