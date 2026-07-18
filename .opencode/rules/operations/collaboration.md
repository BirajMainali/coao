# Agent Collaboration Policy

## Purpose

Enable effective collaboration between agents through structured, traceable, and artifact-driven communication.

Agents are collaborators, not isolated workers.

---

## Principles

- Communicate through artifacts, not conversation.
- Share facts, not assumptions.
- Preserve context for future sessions.
- Minimize unnecessary interruptions.
- Respect each agent's ownership and responsibility.
- Escalate uncertainty instead of guessing.

---

## Communication Model

Communication should be asynchronous whenever possible.

Agents should:

- Read existing artifacts before asking questions.
- Update artifacts instead of repeating information.
- Reference artifacts rather than copying content.
- Leave sufficient context for the next contributor.

Conversation is temporary.

Artifacts are the source of truth.

---

## Before Requesting Another Agent

An agent should first:

- Complete its own responsibility.
- Research available information.
- Record assumptions.
- Document remaining uncertainty.
- Identify exactly what is needed.

Only then should another agent be involved.

---

## Request Format

Every request should include:

- Mission
- Objective
- Current State
- Relevant Artifacts
- Specific Question
- Expected Outcome

Avoid vague requests.

---

## Response Format

Responses should include:

- Summary
- Decision or Recommendation
- Supporting Reasoning
- Risks
- Next Action
- Updated Artifacts

---

## Handoff

When transferring work:

- Summarize completed work.
- Describe remaining work.
- Record assumptions.
- Record unresolved questions.
- Record known risks.
- Identify the next owner.

The receiving agent should continue without rediscovery.

---

## Conflict Resolution

When disagreements occur:

- Compare evidence.
- Compare trade-offs.
- Explain reasoning.
- Record differing viewpoints.
- Escalate unresolved business decisions.

Never resolve disagreement through opinion alone.

---

## Mission Workflow

Every mission follows this standard pipeline. Each phase produces artifacts and hands off to the next.

```
Product Owner ──(requirements)──→ Solution Architect ──(design)──→ Software Engineer ──(implementation)──→ QA Engineer ──(validation)──→ PO/Release
```

| Phase | Owner | Produces | Hands off to |
|-------|-------|----------|-------------|
| 1. Requirements | Product Owner | User stories, acceptance criteria, success metrics | Solution Architect |
| 2. Design | Solution Architect | Technical spec, API design, ADRs, implementation plan | Software Engineer |
| 3. Implementation | Software Engineer | Production code, tests, PR summary, implementation notes | QA Engineer |
| 4. Validation | QA Engineer | Test results, defect reports, risk assessment, release recommendation | Product Owner |
| 5. Release Decision | Product Owner | Release sign-off or iteration request | — |

Agents must update `session.md` with the current phase after each handoff.

The next agent reads `session.md` and `handoffs/` to understand what to pick up.

---

## Escalation

Escalate when:

- Business intent is unclear.
- Organizational knowledge conflicts.
- Multiple valid options exist without sufficient evidence.
- Required authority belongs to a human.

---

## Anti-patterns

Avoid:

- Asking without prior research.
- Repeating information already documented.
- Making another agent rediscover context.
- Transferring incomplete work.
- Hiding uncertainty.
- Communicating only through conversation.

---

## Success

A collaborating agent should be able to continue work by reading shared artifacts without requiring previous conversation or additional clarification.