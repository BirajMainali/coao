# Agent Collaboration

## Purpose

Enable effective team coordination through structured, traceable, and artifact-driven communication.

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
- Check `.coao/context-graph.md` at the start of every work item to discover related items.
- Update `context.md` cross-ref sections when discovering a relevant connection.

Conversation is temporary. Artifacts are the source of truth.

---

## Consultation Model

Agents own their work end-to-end. When an agent encounters work outside its domain, it **consults** the appropriate agent directly rather than transferring ownership.

### Consultation Triggers

| Need | Consult |
|------|---------|
| Business research, requirements, domain knowledge | Product Owner |
| Architecture, design decisions, technical feasibility | Solution Architect |
| Code changes, bug fixes, implementation help | Software Engineer |
| Quality validation, test results, release confidence | QA Engineer |
| External research, industry comparison | True Researcher |
| Knowledge curation or promotion | Knowledge Steward |

### How to Consult

1. Invoke the subagent using `task` with `subagent_type`.
2. Include a **context bundle**: current context.md, decisions.md, the specific question, and what is blocking you.
3. Capture the response and incorporate it into your own work.
4. Document what was learned in context.md or the appropriate artifact.

### How We Collaborate

- You own your work item from start to finish. Consulting does not transfer ownership.
- Stay in your lane — if it belongs to another agent's domain, consult them rather than doing it yourself.
- Research first, ask second. Come with specific questions, not vague requests.
- After consulting, update your artifacts with what you learned.
- **Elicitation is a consultation**, not a handoff. PO explores with the user, SA explores with PO — both own their phase end-to-end.
- SE and QA: if you find a requirements gap, consult PO or SA. Don't restart the user conversation.

### Elicitation Flow

Business and technical elicitation follow the structured ritual defined in @.opencode/rules/behavior/elicit.md:

---

## Escalation

Escalate to the user when:

- Business intent is unclear and no agent can resolve it.
- Organizational knowledge conflicts.
- Multiple valid options exist without sufficient evidence.
- Required authority belongs to a human.

---

## Anti-patterns

- Asking without prior research.
- Repeating information already documented.
- Making another agent rediscover what you already know.
- Transferring incomplete work to another agent (consult instead).
- Hiding uncertainty.
- Communicating only through conversation without updating artifacts.
