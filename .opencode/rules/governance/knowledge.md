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

### Classification Guide

| Type of finding | → Promote to | Example |
|---|---|---|
| Architecture decision, technology choice, trade-off analysis | `decisions/` | "We chose Postgres over MySQL because of JSONB support" |
| Coding convention, workflow, process rule | `standards/` | "All API routes must use Zod validation" |
| Reusable solution to a recurring problem | `patterns/` | "Repository pattern for database access" |
| Step-by-step procedure, deployment steps, troubleshooting | `runbooks/` | "How to rollback a failed deployment" |
| Retrospective insight, what went wrong/right | `lessons/` | "We underestimated cache invalidation complexity" |
| Business rule, domain logic | `standards/` | "Orders must be authorized before fulfillment" |
| External reference, tool evaluation | `patterns/` | "Comparison of testing frameworks" |
| Operational alert, monitoring setup | `runbooks/` | "How to respond to PagerDuty alert X" |

### Demotion Guide

When stale knowledge is flagged (`[KNOWLEDGE-STALE]`):

| Condition | Action |
|---|---|
| Still accurate but missing context | Update with new evidence |
| Partially wrong in a newer version | Add version note, mark superseded, link to new entry |
| Completely wrong or obsolete | Mark as `deprecated` with reason and date |
| Never referenced in 3+ missions | Archive (move to `knowledge/_archived/`) |

---

## Promotion Pipeline

Not all memory becomes knowledge. Promotion follows a staged pipeline:

```
Collect (during mission) → Curate (knowledge review) → Promote (write to knowledge/) → Validate (future missions)
```

---

### Stage 1 — Collect (continuous, during mission)

Every agent continuously watches for reusable findings during their work.

When an agent discovers something potentially reusable:
1. Write a brief note in their role's `research/` with the prefix `[KNOWLEDGE-CANDIDATE]`
2. Or drop a file in the mission-level `knowledge-candidates/` directory
3. Include: what was found, why it's reusable, and where the evidence lives

Agents should also check existing knowledge during research — if they find outdated or incorrect knowledge, flag it in `knowledge-candidates/` with prefix `[KNOWLEDGE-STALE]`.

### Stage 2 — Curate (at mission completion)

During the Knowledge Review phase (after Mission Complete, before Workspace Archived), the last active agent:

1. **Collect candidates** — read `knowledge-candidates/` and grep for `[KNOWLEDGE-CANDIDATE]` in all role `research/` and `artifacts/`
2. **Evaluate against criteria** — each candidate must be:
   - Reusable across multiple missions
   - Evidence-based (backed by real results)
   - Valuable beyond the current mission
   - Stable (unlikely to change frequently)
   - Relevant to future decision-making
3. **Deduplicate** — search `knowledge/` for duplicates or related entries
4. **Categorize** — use the Classification Guide to map each finding to the right `knowledge/` subdirectory

### Stage 3 — Promote (at mission completion)

For each curated candidate:

1. **Improve or create** — write to the appropriate `knowledge/` subdirectory. Improve existing entries rather than creating duplicates.
2. **Link to evidence** — reference the workspace path where the original finding lives
3. **Record in session.md** — note what was promoted and where it now lives

### Stage 4 — Validate (ongoing across future missions)

Knowledge is only proven when it survives real use:

1. **Future agents reference `knowledge/`** before starting work in a domain
2. **If knowledge is inaccurate or outdated**, the agent flags it with `[KNOWLEDGE-STALE]` in the current mission's `knowledge-candidates/`
3. **Stale knowledge is reviewed** during the next curation cycle — use the Demotion Guide to decide whether to update, deprecate, or archive
4. **Promoted knowledge that is never referenced** after 3 missions is archived (`knowledge/_archived/`)

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