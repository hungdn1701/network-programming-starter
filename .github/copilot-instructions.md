# GitHub Copilot — Custom Instructions

Full project rules and source of truth: `.ai/AGENTS.md`

## Project
Network Programming assignment (INT1433). Technology-agnostic, Docker-first Client-Server architecture.

## Key Rules
- Technology-agnostic: Support student's language choice (Java, Python, C/C++, Go, Node)
- Docker-first: Server and Client run in containers
- Server MUST listen on `0.0.0.0` inside containers
- Client connects via `server:5000` in Docker network
- Custom protocol documented in `docs/protocol-design.md`
- Concurrency and thread-safety required for Server
- Configuration via environment variables (`.env`)
