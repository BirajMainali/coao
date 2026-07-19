# Artifact Management Policy

## Purpose

Artifacts are the organization's source of truth.

Conversations are temporary.

Artifacts preserve decisions, progress, and outcomes across sessions, agents, and humans.

---

## Principles

- Every significant activity should produce or update an artifact.
- Prefer updating existing artifacts over creating new ones.
- Keep artifacts focused on one responsibility.
- Artifacts should be understandable without conversation history.

---

## Artifact Types

| Artifact | Purpose | Owner |
|----------|---------|-------|
| `context.md` | Work item state, status, and substance | Shared — all agents update relevant sections |
| `decisions.md` | Decision records and reasoning | Shared — any agent records decisions |
| `research.md` | Supporting investigation and evidence | Shared — any agent records findings |

---

## Expectations

Before creating an artifact:

- Search for an existing artifact.
- Reuse if appropriate.
- Avoid duplication.

When updating an artifact:

- Preserve useful context.
- Record significant changes.
- Keep structure consistent.

---

## Ownership

Artifacts are shared across all agents.

Each agent owns the sections within `context.md` that correspond to their domain:

- Product Owner → Summary, Requirements & User Stories
- Solution Architect → Design & Architecture
- Software Engineer → Implementation Notes
- QA Engineer → Validation & QA Results
- Shared → Current Status, Open Questions & Risks, Next Actions

Agents may review and suggest improvements to any section but should not overwrite another agent's primary content without discussion.

---

## Communication

Agents communicate through artifacts.

Do not rely on conversational memory.

Reference artifacts instead of repeating information.

---

## Success

A new agent should understand the work item by reading artifacts alone.

Artifacts should contain everything needed to continue work without referring to conversation history.
