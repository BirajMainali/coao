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
├── context.md              - Shared ticket: summary, workflow, requirements, status, risks
├── decisions.md            - Decision log (shared, promoted to ADRs when significant)
├── product-owner/          - Product Owner artifacts (requirements, user stories)
├── solution-architect/     - Solution Architect artifacts (design, architecture research)
├── software-engineer/      - Software Engineer artifacts (implementation notes, research)
├── qa-engineer/            - QA Engineer artifacts (test plans, validation results)
├── attachments/            - Supporting files
└── knowledge-candidates/   - Findings flagged for potential promotion
```

All agents contribute to context.md and decisions.md. Role-specific work lives in the agent's own directory.

The required contents vary by work item type. See @.opencode/rules/operations/work-items.md for per-type requirements.

---

# context.md

context.md is the **shared ticket** — the single document every agent reads to understand the work item at a glance. It is not a dumping ground for deep work.

Think of it like a Jira ticket: everyone reads it, everyone contributes their field, but no one edits another agent's contribution.

Sections

- **Summary** - what is being built and why (PO)
- **Workflow** - agent sequence, current phase, timeline (shared)
- **Requirements** - what needs to be delivered (PO)
- **Design Overview** - chosen architecture, key decisions, linked design doc (SA)
- **Implementation Summary** - what was built, notable decisions (SE)
- **Validation Summary** - test results, sign-off status (QA)
- **Current Status** - who is working, progress, blockers (shared)
- **Open Questions & Risks** - unresolved items and known blockers (shared)
- **Next Actions** - what should happen next (shared)

Every agent must read `context.md` before beginning work and update it before completing work.

### Ownership

Each agent owns the sections of `context.md` that correspond to their domain:

| Role | Owned sections |
|------|---------------|
| Product Owner | Summary, Requirements |
| Solution Architect | Design Overview |
| Software Engineer | Implementation Summary |
| QA Engineer | Validation Summary |
| Shared (any agent) | Workflow, Current Status, Open Questions & Risks, Next Actions |

### Section Sanctity

An agent must not edit another agent's owned section without explicit agreement from that agent.

Shared sections may be updated by any agent. For significant cross-cutting changes (e.g., changing the workflow or adding a new requirement), the agent must seek agreement from affected roles before editing.

This mirrors real team collaboration — a Jira ticket's description is set by the reporter, status is updated by the assignee, and team members leave comments rather than rewriting each other's fields.

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

# Role Directories

Each role directory (`product-owner/`, `solution-architect/`, `software-engineer/`, `qa-engineer/`) contains detailed work artifacts owned by that role.

### Boundary Rule

Decide where information lives by asking: "Does every agent need this at a glance, or is this specific to one role's work?"

| Goes in `context.md` | Goes in role directory |
|---|---|
| What all agents need to read | Deep work owned by one role |
| Concise summary, requirements, decisions | Full exploration, detailed tracking |
| Status, blockers, next actions | Drafts, research notes, working files |
| Cross-cutting open questions | Role-specific investigations |
| Links/references to role work ("see `software-engineer/notes.md`") | The actual detailed artifacts |

Duplicate information is a violation. If a fact exists in a role directory and in context.md, one of them is wrong.

### What Goes Inside

Agents decide what to put in their own directory. No prescribed filenames or structure. The boundary rule is the only constraint — if all agents need it, it belongs in `context.md`, not in a role directory.

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
