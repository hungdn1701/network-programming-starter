# Assignment Brief & Grading Policy — Network Programming (INT1433)

**Instructor:** Dr. Hung N. Dang (Đặng Ngọc Hùng) — hungdn@ptit.edu.vn  
**Faculty:** Information Technology 1 — Posts and Telecommunications Institute of Technology (PTIT)  
**Version:** 1.2.1 (2026-10-09) — see the repository tags for later versions

> ⚠️ **Official document — read-only.** This file is the assignment brief and grading policy issued by the instructor.
> Students and AI assistants must **not** edit or delete it. If copies differ, the
> [official version](https://github.com/hungdn1701/network-programming-starter/blob/main/INSTRUCTION.md) applies.
> If something is unclear or seems wrong, ask the instructor.

---

## 1. Learning Objectives

By completing this project, each team member demonstrates that they can:

- Use sockets correctly — TCP (stream-oriented) and/or UDP (datagram-oriented).
- Design an independent **application-layer protocol**: message framing, format, commands, status codes, session flow.
- Build a **concurrent server** that is thread-safe and robust against network failures.
- Package and run a networked system in an isolated environment with **Docker**.
- **Explain and defend** their own design decisions and code — including code produced with AI assistance.

---

## 2. Teams & Repository

| Rule | Detail |
|------|--------|
| Team size | **1–3 students. Maximum 3 — no exceptions.** |
| Repository | Every member stars and forks the public starter. Work happens only in the **private team repository** the LMS creates for your team in the course organization, set up as described in [`docs/student-guide.md`](docs/student-guide.md). Never push project work to a public repository. |
| Accounts | Every member commits from **their own** GitHub account — the one linked to their student ID on the LMS. Pair-programmed commits should credit the partner (e.g., a `Co-authored-by:` trailer). |
| Registration | Fill in the Team table and project pitch at the top of [`README.md`](README.md) in your first week. |

---

## 3. Milestones

The project is delivered in **three milestones**. Dates, and whether a milestone carries marks or feedback only,
are announced by the instructor for each class; milestones may be merged or adjusted to fit the class schedule.
The three outcomes — a proposal, a design with a running skeleton, and the final product — stay the same.

| Milestone | Deliverable | Where |
|-----------|-------------|-------|
| **M1 — Proposal** | Problem, idea, scope, key technical challenge, initial protocol sketch, ownership plan | [`docs/proposal.md`](docs/proposal.md) |
| **M2 — Design & Walking Skeleton** | Complete protocol and architecture design; server accepts concurrent connections and **one command works end-to-end** in Docker | [`docs/protocol-design.md`](docs/protocol-design.md), [`docs/architecture.md`](docs/architecture.md), `server/`, `client/` |
| **M3 — Final Product & Oral Defense** | Full product, test evidence, README with **AI Disclosure** and **Contribution**, AI log | Whole repository |

Tip: mark each milestone with a git tag (`git tag m1 && git push origin m1`) so it is easy to find later.

---

## 4. Mandatory Technical Requirements

1. **Technology-agnostic** — any language (Java, Python, C/C++, Go, Node.js, C#, Rust, ...).
2. **Independent client and server** — they share nothing except the documented network protocol.
3. **Specified protocol** — commands, message structure, status codes and main flows are documented in [`docs/protocol-design.md`](docs/protocol-design.md) and kept consistent with the code (designing before coding is strongly recommended).
4. **Concurrency** — the server serves many clients simultaneously without one client blocking others.
5. **Docker** — the server starts with a single command: `docker compose up --build`. Clients run with `docker compose run --rm client` (or natively, documented in README).
6. **No hard-coded addresses** — `HOST`/`PORT` come from environment variables (`.env`). The server binds to `0.0.0.0` inside its container.
7. **Robustness** — the server must not crash when a client disconnects abruptly, sends malformed data, or goes silent.

---

## 5. Suggested Topics

Choose one of the topics below **or propose your own** (original, well-motivated ideas score higher in criterion A1).

1. **Multi-room Chat System** — authentication, public rooms, private messages, file attachments, presence.
2. **Reliable File Transfer** — large files over TCP/UDP, integrity checks (MD5/SHA), resume after disconnection.
3. **Multiplayer Network Game** — turn-based or real-time (Caro, Chess, Battleship, Quiz) with server-side state sync.
4. **Remote System Monitor** — agents report CPU/RAM/network periodically; server raises alerts and sends commands.
5. **Custom Web Server / Reverse Proxy** — simplified HTTP/1.1, static files, load balancing, caching.

---

## 6. Grading Rubric (10 points)

The rubric is shared by all three of the instructor's project courses (Network Programming — INT1433, Mobile Application
Development — INT1449, Service-Oriented Software Development — INT1448). Only the course-specific sub-criteria differ.

| Part | Weight | Scored per |
|------|:------:|-----------|
| **A. Idea & Design** | **3.0** | Team |
| **B. Technical Product** | **3.0** | Team |
| **C. Individual Oral Defense** | **4.0** | **Individual** |

### A. Idea & Design — 3.0 (team)

| Criterion | Points | What earns full marks |
|-----------|:------:|-----------------------|
| **A1. Problem & Idea** | 1.0 | A real, clearly stated problem; justified scope; the non-trivial networking challenge is identified; alternatives were considered. Evidence: `docs/proposal.md`, README §2. |
| **A2. Protocol Design** | 1.0 | `docs/protocol-design.md` is complete (framing, message format, command table, status codes, sequence diagrams) **and explains why** (TCP vs UDP, framing choice, stateful vs stateless). |
| **A3. Architecture & Concurrency Design** | 1.0 | `docs/architecture.md` justifies the concurrency model, identifies all shared state and its locking strategy, and documents the connection lifecycle. |

### B. Technical Product — 3.0 (team)

| Criterion | Points | What earns full marks |
|-----------|:------:|-----------------------|
| **B1. Concurrency & Robustness** | 1.5 | Many simultaneous clients without blocking; no race conditions or deadlocks; survives abrupt disconnects, malformed input and timeouts; sockets/threads are released. |
| **B2. Features** | 1.0 | Registered features work as specified by your protocol, backed by real test evidence in `docs/testing-guide.md`. |
| **B3. Engineering Hygiene** | 0.5 | `docker compose up --build` works from a clean clone; config via `.env`; readable, organized code; meaningful git history. |

### C. Individual Oral Defense — 4.0 (individual)

| Criterion | Points | What earns full marks |
|-----------|:------:|-----------------------|
| **C1. Ownership** | 1.5 | Explains the modules they claim in the Contribution table — line by line when asked — including AI-generated code. |
| **C2. Reasoning** | 1.5 | Justifies design decisions and trade-offs; answers "what if" questions about their design. |
| **C3. Live Change** | 1.0 | Makes a small change or locates a bug in their own code on the spot (or walks through how they would, if time is short). |

**Individual score = A + B (team) + C (individual)**, subject to the adjustments in §7 and §8.

---

## 7. AI Usage Policy

AI assistants (ChatGPT, Claude, Gemini, Copilot, Cursor, ...) are **allowed for every part** of the project —
ideation, design, code, tests and documentation. What is graded is **your understanding and your decisions**,
not who typed the code.

1. **Disclose.** The README **AI Disclosure** section and [`docs/ai-log.md`](docs/ai-log.md) are mandatory.
   If they are missing, the instructor will ask you to complete them before the oral defense.
2. **Own it.** You are responsible for every line in your repository. A part you cannot explain during the oral
   defense earns **no credit** — in B for the team and in C for you — even if it works.
3. **Be honest.** Significant AI use that is not disclosed, or a disclosure that contradicts the evidence, is
   academic dishonesty: the instructor may deduct up to **2.0 points** from A + B and handle the case under PTIT regulations.
4. **No fabrication.** Test results, logs, screenshots and benchmark numbers must come from actually running your system.
5. **No secrets.** Never paste passwords, API keys or other people's personal data into AI tools.

> Disclosing AI use never lowers your score. Hiding it does.

---

## 8. Contribution & Individual Assessment

- The README **Contribution** table lists, for each member: the modules/documents they own, their key PRs or commits,
  and an agreed contribution percentage. **Every member ticks the confirmation box.**
- Evidence the instructor checks: git history (commits from each member's linked account, pull requests — summarized on the LMS),
  `docs/ai-log.md` entries per member, and answers in the oral defense.
- Oral-defense questions target the parts each member **claims**.
- A member with no verifiable contribution (no commits/PRs and unable to explain the parts they claim) may receive a
  reduced share of A + B, down to 0, at the instructor's decision.

---

## 9. Oral Defense

- **Format:** about 15–20 minutes per team — roughly 5 minutes per member (adjusted per class). Every member answers
  individually; teammates may not answer for each other. Not every question type is asked to every member — the
  instructor picks what fits the time.
- **Short demo first (a few minutes, prepared in advance):** the system running from a fresh start, showing the main flow.
- **Questions are drawn from:** your proposal, design documents, the code you claim, and your `ai-log.md` entries.
- **Sample questions:**
  - Why TCP (or UDP) for this application? What would change if you switched?
  - How does the receiver know where one message ends? Show what happens when a message arrives split across two `recv()` calls.
  - Which state is shared between client handlers, and how is it protected? Where could a deadlock occur?
  - What happens with 1,000 clients under your concurrency model? Where is the bottleneck?
  - Kill a client with `kill -9` — show the server log and explain each line.
  - *(Live)* Add a new command to the protocol, or change the max message size, and demonstrate it.

---

## 10. Final Submission

- The final submission is the **last commit on `main` before the deadline**.
- Before the deadline, go through the **Submission Checklist** in [`GETTING_STARTED.md`](GETTING_STARTED.md#submission-checklist).
- Late submissions and resubmissions follow the policy announced by the instructor.
