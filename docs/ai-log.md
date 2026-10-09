# AI Usage Log

> **Mandatory** — see [`INSTRUCTION.md` §7](../INSTRUCTION.md#7-ai-usage-policy).
> Add an entry for every **significant** AI interaction: anything that produced or shaped design, code, tests or
> documentation that ended up in this repository. Quick factual questions do not need an entry.
>
> Write entries **as you go** (right after the session). The AI assistant configuration in this repo asks your
> assistant to remind you and to suggest a draft entry — but the "what we kept / verified" column must be yours.

---

## Log

| # | Date | Member | Tool / model | Task — what you asked | What AI produced | What you kept, changed or rejected — and how you verified it | Files |
|:-:|------|--------|--------------|-----------------------|------------------|---------------------------------------------------------------|-------|
| 0 | *(example — delete)* | *Nguyen Van A* | *Claude* | *Compare thread-per-client vs. NIO selector for our chat server* | *Comparison table + sample selector loop* | *Chose a fixed thread pool instead (easier to reason about locking); rewrote the accept loop; tested with 50 concurrent clients* | *`docs/architecture.md`, `server/src/Server.java`* |
| 1 | | | | | | | |

---

## Notable Interactions

Describe **2–5 interactions that shaped the project** (a design decision, a hard bug, a rejected suggestion).
These are likely oral-defense topics.

### N1. *(Title)*

- **Member / date / tool:**
- **Prompt (key excerpt):**
- **What the AI suggested:**
- **What we decided and why:**
- **What the AI got wrong or missed (if anything):**
