# Knowledge Governance Policy

## Purpose

Ensure the organization becomes smarter after every mission.

Knowledge is a long-term organizational asset.

Memory supports execution.

Knowledge supports future decisions.

---

## Knowledge vs Memory

### Memory

Memory is mission-specific.

It captures information needed to complete the current mission.

Examples

- Progress
- Notes
- Research
- Open questions
- Handoffs
- Temporary decisions
- Working assumptions

Memory belongs in `.coao/docs/<mission-slug>/`.

Memory is archived with the mission and never promoted to knowledge.

---

### Knowledge

Knowledge is reusable organizational intelligence.

It should improve future missions.

Examples

- Proven patterns
- Best practices
- Architecture guidance
- Business rules
- Standards
- Lessons learned
- Reusable decisions

Knowledge lives in `knowledge/` at the repository root.

Knowledge persists across missions and survives workspace archiving.

### Knowledge Store Structure

```
knowledge/
├── decisions/       — Architecture Decision Records (ADRs)
├── standards/       — Organizational standards and conventions
├── patterns/        — Reusable design and implementation patterns
├── runbooks/        — Operational procedures and troubleshooting
└── lessons/         — Post-mission lessons learned
```

---

## Promotion

Not all memory becomes knowledge.

Promotion happens at mission completion during the Knowledge Review phase.

### Who promotes

The last active agent or the agent completing the mission reviews workspace artifacts and decides what to promote.

### When to promote

During the Knowledge Review phase of the workspace lifecycle (after Mission Complete, before Workspace Archived).

### Promotion criteria

Information should be promoted only when it is:

- Reusable across multiple missions
- Evidence-based (backed by real results)
- Valuable beyond the current mission
- Stable (unlikely to change frequently)
- Relevant to future decision-making

### Promotion process

1. **Review workspace artifacts** — read `research/`, `decisions/`, `artifacts/`, `validation/`
2. **Identify promotable items** — match against promotion criteria
3. **Check existing knowledge** — search `knowledge/` for duplicates or related entries
4. **Improve or create** — update existing knowledge or create new files in the appropriate `knowledge/` subdirectory
5. **Link to evidence** — reference the workspace path where the original finding lives
6. **Update session.md** — record what was promoted and where it now lives

### What stays as memory

- Progress notes, open questions, working assumptions
- Temporary decisions not intended to be permanent
- Research that was context-specific and not reusable
- Handoff documents and ownership records
- Anything that does not meet the promotion criteria

Memory is archived with the workspace. It is never deleted but is not expected to be read again unless the mission is resumed.

---

## Principles

- Search existing knowledge before creating new knowledge.
- Improve existing knowledge before creating duplicates.
- Link knowledge to supporting evidence.
- Keep knowledge technology-agnostic whenever possible.
- Retire obsolete knowledge.
- Version significant changes.

---

## Success

Future agents should solve similar problems faster because organizational knowledge continues to improve.

The workspace should contain mission memory.

The knowledge base (`knowledge/`) should contain only reusable organizational intelligence.