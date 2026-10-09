# AGENTS.md — Universal Agent Instructions

> Source of Truth: [`.ai/AGENTS.md`](.ai/AGENTS.md)  
> Compatible with: OpenAI Codex, Claude Code, Cursor, GitHub Copilot, Gemini/Antigravity, Windsurf.

## Project Context
Network Programming university assignment (INT1433) at PTIT. Technology-agnostic, Docker-first client-server system.

## Key Rules
- **Technology-agnostic**: Any language (Java, Python, C/C++, Go, Node.js) is valid.
- **Docker-first**: All code runs inside Docker containers (`docker compose up --build`).
- **Server binding**: The Server MUST bind to `0.0.0.0`, NEVER `127.0.0.1` inside containers.
- **Network DNS**: Clients in Docker connect to host `server`, not `localhost`.
- **Environment variables**: Read ports/hosts from `.env` (`SERVER_PORT`, `SERVER_HOST`).
- **Protocol docs**: Document all messages in `docs/protocol-design.md`.
- **Concurrency**: Handle multiple clients concurrently with thread safety.
- **Graceful shutdown**: Clean up sockets and threads on exit.
