# Knowledge Governance Policy

## Purpose

Ensure the organization becomes smarter over time.

Knowledge is a long-term organizational asset. It must be discovered, curated, and maintained continuously — not only at work item boundaries.

Memory supports execution. Knowledge supports future decisions.

---

## Knowledge vs Memory

### Memory

Memory is work-item-specific. It captures information needed to complete the current work item.

Examples: progress, notes, research, open questions, handoffs, temporary decisions, working assumptions.

Memory lives in `.coao/<type>s/<slug>/` and is archived with the workspace.

Memory is never promoted to knowledge.

---

### Knowledge

Knowledge is reusable organizational intelligence that outlives any single work item.

Examples: proven patterns, best practices, architecture guidance, business rules, standards, lessons learned, reusable decisions.

Knowledge lives in `knowledge/` at the repository root and persists across work items.

### Knowledge Store Structure

```
knowledge/
├── candidates/    - Unreviewed submissions (anyone can drop a file)
├── decisions/     - Architecture Decision Records (ADRs)
├── standards/     - Organizational standards and conventions
├── patterns/      - Reusable design and implementation patterns
├── runbooks/      - Operational procedures and troubleshooting
├── lessons/       - Retrospective insights and lessons learned
└── outdated/      - Deprecated or superseded entries
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

### Degradation Guide

When knowledge is outdated:

| Condition | Action |
|---|---|
| Still accurate but missing context | Update with new evidence |
| Partially wrong in a newer version | Add version note, mark superseded, link to updated entry |
| Completely wrong or obsolete | Move to `outdated/` with reason and date |
| Never referenced in 3+ work items | Move to `outdated/` |

---

## Lifecycle

Three states, all inside `knowledge/`:

```
candidates/ → decisions/ | standards/ | patterns/ | runbooks/ | lessons/ → outdated/
```

1. **candidates/** — unreviewed submissions. Anyone drops a file here anytime.
2. **knowledge/** — promoted entries in their category. Curated, evidence-based, reusable.
3. **outdated/** — deprecated entries. Moved here with reason and date when stale or superseded.

That is the entire lifecycle. Candidate rejection is a move to `outdated/` with reason. Stale detection is a move to `outdated/`.

### Who can submit

Any agent, at any time — during a work item or outside one. No work item required. Drop a file in `knowledge/candidates/`.

### Flagging stale knowledge

When you find inaccurate or outdated knowledge in `knowledge/` (decisions/, standards/, etc.), move it to `outdated/` with a note explaining why. Or if unsure, drop a `[STALE]` note in `candidates/` referencing the entry.

---

## Promotion

### Criteria

A candidate is ready for promotion only when ALL are true:

- **Reusable** — Applicable across multiple work items
- **Evidence-based** — Backed by real results
- **Valuable beyond current context** — Reduces future effort or prevents mistakes
- **Stable** — Unlikely to change frequently
- **Relevant to decision-making** — Helps someone choose what to do

### Process

The Knowledge Steward:

1. **Read** — Understand the claim and evidence
2. **Deduplicate** — Search `knowledge/` for existing entries
3. **Evaluate** — Check promotion criteria
4. **Categorize** — Map to the right subdirectory
5. **Promote** — Write to the appropriate category directory, link to evidence
6. **Remove** — Delete from `candidates/` (or move to `outdated/` if rejected with reason)

---

## Revalidation

Three mechanisms:

### 1. Passive (every agent, every work item)

Every agent consults `knowledge/` before starting work via `[KNOWLEDGE-CHECK]` in context.md. If they find stale entries, they move them to `outdated/` or flag in `candidates/`.

### 2. Scheduled (Knowledge Steward)

A full audit is mandatory when:
- 5 work items have completed since the last audit
- A human requests it

The Steward reviews every entry in `knowledge/`, applies the Degradation Guide, and records findings in context.md.

### 3. Triggered (Knowledge Steward)

When stale knowledge is flagged, the Steward processes it immediately.

---

## Knowledge Accounting

Three mandatory artifacts in context.md:

### [KNOWLEDGE-CHECK] (initiation, required)

Every work item requiring knowledge search (feature, project, spike) must produce this during initiation:

```
[KNOWLEDGE-CHECK] consulted knowledge/patterns/api-design.md, knowledge/standards/testing.md | result: no stale entries found
[KNOWLEDGE-CHECK] consulted knowledge/decisions/auth-flow.md | result: entry outdated, moved to outdated/
```

Without this entry, the knowledge search step is considered skipped.

### [KNOWLEDGE-FOUND] (advisory)

When existing knowledge directly helped:

```
[KNOWLEDGE-FOUND] knowledge/patterns/repository-pattern.md reduced design time via ready template
```

### [KNOWLEDGE-REFERENCE] (tracking)

Each knowledge entry may track which work items reference it:

```
Referenced by: feature/user-auth-2026-07-15, fix/login-timeout-2026-07-20
```

Entries unreferenced for 3+ consecutive work items are moved to `outdated/`.

---

## Knowledge Outcome Gate

Work items of type knowledge, project, feature, and spike must document a knowledge outcome before archiving.

The last active agent writes in `context.md`:
- `[KNOWLEDGE-PROMOTED] <path>` — reusable finding was promoted to `knowledge/`
- `[KNOWLEDGE-CANDIDATE-FILED] <path>` — candidate was dropped in repo-root `knowledge/candidates/`
- `[KNOWLEDGE-NONE] <reason>` — nothing met the promotion criteria

This ensures every work item either contributes knowledge or explains why it did not.

---

## Principles

- Search existing knowledge before creating new knowledge
- Improve existing knowledge before creating duplicates
- Link knowledge to supporting evidence
- Keep knowledge technology-agnostic whenever possible
- Retire obsolete knowledge
- Version significant changes
- Knowledge discovery is everyone's job; curation is the Steward's

---

## Success

- Future agents solve similar problems faster because knowledge improves
- `knowledge/candidates/` rarely exceeds 5 unreviewed items
- Stale knowledge is caught before it misleads
- Knowledge grows independently of work item throughput
