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

## Consultation Model

Agents are self-contained and mission-based — not sequential pipeline workers.

Each agent owns its domain end-to-end. When an agent encounters work outside its domain, it consults the appropriate agent directly rather than handing off ownership.

### Consultation Triggers

| Expertise needed | Consult |
|----------------|---------|
| Business research, requirements, domain knowledge | Product Owner |
| Architecture, design decisions, technical feasibility | Solution Architect |
| Code changes, bug fixes, implementation help | Software Engineer |
| Quality validation, test results, release confidence | QA Engineer |

### How to Consult

1. Invoke the appropriate subagent using the `task` tool with `subagent_type` matching the agent name.
2. Provide full context: what you know, what you need, and why.
3. Capture the response and incorporate it into your own work.
4. Document what was learned in the workspace `research/` or `artifacts/`.

### Rules

- You own your mission from start to finish. Consulting another agent does not transfer ownership.
- Do not perform work that belongs to another agent's domain — consult instead.
- Before consulting, research independently first. Consult with specific questions, not vague requests.
- After consulting, update your own artifacts with what you learned.

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