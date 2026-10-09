# Vibe Coding Guide for Students

This guide explains how to effectively use AI tools for your INT1433 Network Programming assignment.

## AI Tools & Configurations

This starter repository is pre-configured with rules and system instructions for various AI tools to ensure the AI understands the project's requirements:

| Tool | Configuration File |
|------|---------------------|
| Cursor | `.cursor/rules/*.mdc` |
| Windsurf | `.windsurfrules` |
| GitHub Copilot | `.github/copilot-instructions.md` |
| Claude Code | `CLAUDE.md` |
| Gemini / Antigravity | `GEMINI.md` |

These adapters all point to the central source of truth: `.ai/AGENTS.md`.

## Using Prompt Templates

In `.ai/prompts/`, you'll find templates to help you ask the AI for specific implementations.
To use them, copy the content or reference the file when chatting with the AI.
Example: "@.ai/prompts/socket-server.md please implement this in Python."

## ⚠️ Warning
AI is a powerful tool, but it is not a replacement for your understanding.
You are responsible for the code you submit. Make sure you understand every line the AI generates, as you will need to defend it during your project presentation.
