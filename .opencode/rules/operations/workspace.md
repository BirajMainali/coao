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

├── session.md              — Mission state (shared)
├── handoffs/               — Inter-agent communication (shared)
├── attachments/            — Supporting files (shared)
├── product-owner/
│   ├── artifacts/
│   ├── research/
│   └── decisions/
├── solution-architect/
│   ├── artifacts/
│   ├── research/
│   ├── decisions/
│   └── implementation/
├── software-engineer/
│   ├── artifacts/
│   ├── research/
│   ├── decisions/
│   └── implementation/
└── qa-engineer/
    ├── artifacts/
    ├── research/
    ├── decisions/
    └── validation/

Each agent owns files within its role directory.

---

# session.md

Purpose

Represents the current state of the mission.

Updated continuously throughout execution.

Contains

- Mission summary
- Current owner
- Current phase
- Progress
- Current objective
- Open questions
- Known risks
- Blocking issues
- Next action

Every agent must read this file before beginning work.

Every agent must update this file before completing work.

---

# artifacts/ (within each role directory)

Purpose

Contains mission deliverables for that agent's domain.

Artifacts describe WHAT is being built.

Examples

- Product Specification
- User Stories
- Acceptance Criteria
- Solution Design
- API Contract
- Architecture Diagram
- Release Notes

Artifacts should evolve throughout the mission.

Prefer updating existing artifacts rather than creating duplicates.

Artifacts become the communication contract between agents.

---

# research/ (within each role directory)

Purpose

Contains supporting investigation for that agent's domain.

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

# implementation/ (within solution-architect and software-engineer)

Purpose

Contains implementation planning and execution information.

Implementation explains HOW work is completed.

Examples

- Implementation Plan
- Task Breakdown
- Migration Strategy
- Technical Notes
- Integration Notes
- Refactoring Plan
- Deployment Plan

Implementation does not contain source code.

Source code belongs in the repository.

---

# validation/ (within qa-engineer)

Purpose

Contains evidence that work satisfies requirements.

Examples

- QA Report
- Test Summary
- Validation Checklist
- Performance Results
- Security Review
- Accessibility Review
- Known Issues

Validation should demonstrate confidence, not merely completion.

---

# decisions/ (within each role directory)

Purpose

Contains important decisions made by that agent.

Each decision should record

- Context
- Alternatives
- Decision
- Reasoning
- Trade-offs
- Consequences

Mission decisions remain within the role directory unless promoted into organizational ADRs.

---

# handoffs/ (mission-level shared)

Purpose

Support ownership transfer.

Every handoff should include

- Current Status
- Completed Work
- Remaining Work
- Updated Artifacts
- Risks
- Assumptions
- Recommended Next Action

Another agent should continue work without rediscovery.

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

# Information Placement Rules

Mission status

→ session.md

Mission deliverables

→ artifacts/ (within your role directory)

Supporting investigation

→ research/ (within your role directory)

Implementation planning

→ implementation/ (within solution-architect or software-engineer)

Validation evidence

→ validation/ (within qa-engineer)

Mission decisions

→ decisions/ (within your role directory)

Ownership transitions

→ handoffs/

Supporting files

→ attachments/

Source code

→ src/

Tests

→ tests/

Organization knowledge

→ knowledge/

Organization standards

→ knowledge/standards/

Architecture decisions

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

- Update session.md.
- Update affected artifacts.
- Record decisions.
- Leave a handoff if another agent is expected.

---

# Workspace Lifecycle

Mission Created

↓

**Load the `git-worktree` skill and initialize a dedicated worktree with feature branch.**

↓

Workspace Initialized (`.coao/docs/<mission-slug>/`)

↓

Artifacts Created

↓

Artifacts Updated

↓

Mission Complete

↓

Knowledge Review (see `.opencode/rules/governance/knowledge.md` — review workspace artifacts, promote reusable findings to `knowledge/`, leave session-specific memory archived)

↓

Workspace Archived

Archived work remains immutable and available for future reference.