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

.coao/workspace/active/<missions-slug>/

Example

.coao/workspace/active/payment-service-v2/

Everything related to the mission must remain inside this workspace until the mission is complete.

---

# Workspace Layout

.coao/workspace/active/<mission-slug>/

├── session.md
├── artifacts/
├── research/
├── implementation/
├── validation/
├── decisions/
├── handoffs/
└── attachments/

Each directory has a single responsibility.

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

# artifacts/

Purpose

Contains mission deliverables.

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

# research/

Purpose

Contains supporting investigation.

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

# implementation/

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

# validation/

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

# decisions/

Purpose

Contains important mission decisions.

Each decision should record

- Context
- Alternatives
- Decision
- Reasoning
- Trade-offs
- Consequences

Mission decisions remain local unless promoted into organizational ADRs.

---

# handoffs/

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

→ artifacts/

Supporting investigation

→ research/

Implementation planning

→ implementation/

Validation evidence

→ validation/

Mission decisions

→ decisions/

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

Workspace Initialized

↓

Artifacts Created

↓

Artifacts Updated

↓

Mission Complete

↓

Knowledge Review

↓

Workspace Archived

Archived work remains immutable and available for future reference.