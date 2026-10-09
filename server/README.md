# Server Module

This directory contains the code for the Server application.

## Expected Behavior
The server application should:
1. Listen on a port specified by the environment variable `SERVER_PORT` (default: 5000) on the host `SERVER_HOST`.
2. Accept incoming client connections.
3. Handle multiple connections concurrently (via threads, processes, or async I/O).
4. Parse and respond to client messages according to the protocol defined in `docs/protocol-design.md`.

## Docker Usage
Code runs inside a Docker container. Configure `Dockerfile` in this directory to install your runtime/compiler and build/run your code.
