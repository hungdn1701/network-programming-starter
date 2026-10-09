# GEMINI.md — Instructions for Gemini / Google Antigravity

Full project rules and source of truth: [`.ai/AGENTS.md`](.ai/AGENTS.md)

## Project
Network Programming assignment (INT1433). Technology-agnostic, Docker-first Client-Server architecture.

## Key Rules
- Technology-agnostic (Java, Python, C/C++, Go, Node.js)
- Server MUST bind to `0.0.0.0` in Docker, not `127.0.0.1`
- Client connects via `server:5000` inside Docker, or `localhost:5000` from host
- Single command run: `docker compose up --build`
- All application protocols documented in `docs/protocol-design.md`
- Concurrency and thread-safety required for multiple clients
- Read all configurations from `.env`
