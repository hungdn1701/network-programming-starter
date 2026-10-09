# Client Module

This directory contains the code for the Client application.

## Expected Behavior
The client application should:
1. Connect to the server using the host and port defined by `CLIENT_TARGET_HOST` and `CLIENT_TARGET_PORT`.
2. Provide a way to send commands (either via CLI or GUI).
3. Follow the protocol design in `docs/protocol-design.md` for messaging.

## Docker
Configure the `Dockerfile` here to run your client. Run it with `make client` (`docker compose run --rm client`). A GUI client may run natively instead — document how in the README.
