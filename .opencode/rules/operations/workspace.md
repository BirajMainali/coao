# Workspace Management Policy

## Purpose

Every work item creates an isolated workspace where all collaboration, progress tracking, and deliverables are managed.

The workspace is the only location where agents create, update, and exchange work item information.

---

# Workspace Root

Every work item creates a unique workspace under its type directory.

Example

`.coao/features/product-search/`

or

`.coao/fixes/login-button/`

or

`.coao/projects/ecommerce-app/`

Everything related to the work item must remain inside this workspace until the item is complete.

---

# Workspace Layout

```
.coao/<type>s/<slug>/
├── context.md              - Single living document (all roles contribute)
├── decisions.md            - Decision log (shared)
├── research.md             - Investigation notes (shared)
├── attachments/            - Supporting files (shared)
└── knowledge-candidates/   - Findings flagged for potential promotion (shared)
```

All agents contribute to the same shared files.

The required contents vary by work item type. See @.opencode/rules/operations/work-items.md for per-type requirements.

---

# context.md

Sections

- **Summary** - what is being built and why
- **Current Status** - who is working, current phase, progress
- **Requirements & User Stories** - what needs to be delivered
- **Design & Architecture** - how it will be built
- **Implementation Notes** - progress and decisions during coding
- **Validation & QA Results** - testing evidence and release confidence
- **Open Questions & Risks** - unresolved items and known blockers
- **Next Actions** - what should happen next

Every agent must read `context.md` before beginning work and update it before completing work.

---

# decisions.md

Contains important decisions made by any agent.

Every decision should record:

- Context
- Problem Statement
- Constraints
- Alternatives Considered
- Decision
- Reasoning
- Trade-offs
- Expected Consequences

Work item decisions remain in this file unless promoted into organizational ADRs in `knowledge/decisions/`.

---

# research.md

Contains supporting investigation by any agent.

Research explains WHY decisions were made.

---

# attachments/

Store supporting material that should not be duplicated.

---

# knowledge-candidates/

Findings flagged for potential promotion into organizational `knowledge/`.

Prefix entries with `[KNOWLEDGE-CANDIDATE]` or `[KNOWLEDGE-STALE]` and explain reusability.

Reviewed and curated at work item completion (per type rules).

---

# Working Agreement

Agents should prefer communicating through shared artifacts. Conversation history is session-local and lost on handoff.

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

Work Item Created

↓

Workspace Initialized

↓

context.md Created

↓

context.md Updated (continuously by all agents)

↓

Work Item Complete

↓

Knowledge Review (see `.opencode/rules/governance/knowledge.md`)

↓

Workspace Archived
