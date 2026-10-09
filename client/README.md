# Client Module

This directory contains the code for the Client application.

## Expected Behavior
The client application should:
1. Connect to the server using the host and port defined by `CLIENT_TARGET_HOST` and `CLIENT_TARGET_PORT`.
2. Provide a way to send commands (either via CLI or GUI).
3. Follow the protocol design in `docs/protocol-design.md` for messaging.

## Docker Usage
Configure the `Dockerfile` here to run your client code. If you are building a GUI, you might need to adapt the setup for X11 forwarding or test manually outside Docker.
