# Workspace Management Policy

## Purpose

The workspace is the operational environment for a single mission.

Every mission creates an isolated workspace where all collaboration, progress tracking, and deliverables are managed.

The workspace is the only location where agents create, update, and exchange mission information.

Conversation is never considered a reliable source of truth.

---

# Workspace Root

Every mission creates a unique workspace.

Example

.coao/docs/<mission-slug>/

Example

.coao/docs/payment-service-v2/

Everything related to the mission must remain inside this workspace until the mission is complete.

---

# Workspace Layout

.coao/docs/<mission-slug>/

├── context.md              — Single living document (all roles contribute)
├── decisions.md            — Decision log (shared)
├── research.md             — Investigation notes (shared)
├── attachments/            — Supporting files (shared)
└── knowledge-candidates/   — Findings flagged for potential promotion (shared)

All agents contribute to the same shared files. No role-specific directories.

---

# context.md

Purpose

Represents the mission's complete state — substance, status, progress, and next actions.

Updated continuously throughout execution by every agent.

Sections

- **Mission Summary** — what is being built and why
- **Current Status** — who is working, current phase, progress (absorbed from former session.md)
- **Requirements & User Stories** — what needs to be delivered
- **Design & Architecture** — how it will be built
- **Implementation Notes** — progress and decisions during coding
- **Validation & QA Results** — testing evidence and release confidence
- **Open Questions & Risks** — unresolved items and known blockers
- **Next Actions** — what should happen next

Every agent must read context.md before beginning work and update it before completing work.

Prefer updating existing sections rather than creating new ones.

---

# decisions.md

Purpose

Contains important mission decisions made by any agent.

Every decision should record:

- Context
- Problem Statement
- Constraints
- Alternatives Considered
- Decision
- Reasoning
- Trade-offs
- Expected Consequences

Mission decisions remain in this file unless promoted into organizational ADRs in `knowledge/decisions/`.

---

# research.md

Purpose

Contains supporting investigation by any agent.

Research explains WHY decisions were made.

Examples

- Business research
- Technical research
- Competitor analysis
- Framework comparison
- Benchmark results
- Performance investigation
- External references

Research supports decisions.

Research is never considered organizational knowledge until promoted.

---

# attachments/

Purpose

Store supporting material that should not be duplicated.

Examples

- Screenshots
- Diagrams
- Design Files
- Meeting Notes
- Customer Documents
- External References

Large supporting files belong here.

---

# knowledge-candidates/

Purpose

Findings flagged for potential promotion into organizational `knowledge/`.

Prefix entries with `[KNOWLEDGE-CANDIDATE]` or `[KNOWLEDGE-STALE]` and explain reusability.

Reviewed and curated at mission completion.

---

# Information Placement Rules

Mission status, progress, substance

→ context.md (relevant section)

Decision records

→ decisions.md

Supporting investigation

→ research.md

Supporting files

→ attachments/

Knowledge candidates

→ knowledge-candidates/

Source code

→ src/

Tests

→ tests/

Organization knowledge

→ knowledge/

Organization standards

→ knowledge/standards/

Architecture decisions (promoted)

→ knowledge/decisions/

---

# Working Agreement

Agents should never communicate by relying on conversation history.

Agents communicate by updating shared workspace artifacts.

Every significant activity should produce or update an artifact.

Before creating new files:

- Search existing workspace.
- Reuse existing artifacts.
- Avoid duplication.

Before finishing work:

- Update context.md.
- Record decisions in decisions.md.
- Leave a handoff note in context.md (Next Actions section) if another agent is expected.

---

# Workspace Lifecycle

Mission Created

↓

**Load the `git-worktree` skill and initialize a dedicated worktree with feature branch.**

↓

Workspace Initialized (`.coao/docs/<mission-slug>/`)

↓

context.md Created

↓

context.md Updated (continuously by all agents)

↓

Mission Complete

↓

Knowledge Review (see `.opencode/rules/governance/knowledge.md` — review workspace artifacts, promote reusable findings to `knowledge/`, leave session-specific memory archived)

↓

Workspace Archived

Archived work remains immutable and available for future reference.
