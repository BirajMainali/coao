# Knowledge Governance

## Purpose

Ensure the organization becomes smarter over time.

Knowledge is a long-term organizational asset. Memory supports execution; knowledge supports future decisions.

---

## Knowledge vs Memory

**Memory** is work-item-specific: progress notes, open questions, working assumptions, handoff records. Lives in `.coao/<type>s/<slug>/`. Archived with the workspace. Never promoted.

**Knowledge** is organizational: proven patterns, architecture decisions, standards, runbooks, lessons learned. Lives in `knowledge/` at repo root. Persists across work items.

---

## Knowledge Store

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

### Classification

| Finding type | → Directory | Example |
|---|---|---|
| Architecture decision, technology choice | `decisions/` | "Why we chose Postgres" |
| Coding convention, process rule | `standards/` | "Use Zod for all route validation" |
| Reusable solution to recurring problem | `patterns/` | "Repository pattern for DB access" |
| Step-by-step procedure | `runbooks/` | "How to rollback a failed deployment" |
| Retrospective insight | `lessons/` | "We underestimated cache invalidation" |

---

## Lifecycle

Three states, all inside `knowledge/`:

```
candidates/ → decisions/ | standards/ | patterns/ | runbooks/ | lessons/ → outdated/
```

1. **candidates/** — unreviewed submissions. Anyone drops a file anytime, no work item needed.
2. **knowledge/** — promoted entries. Curated, evidence-based, reusable.
3. **outdated/** — deprecated entries. Moved here with reason and date.

---

## Promotion

A candidate is ready when ALL are true:
- **Reusable** — applicable across multiple work items
- **Evidence-based** — backed by real results
- **Valuable beyond current context** — reduces future effort or prevents mistakes
- **Stable** — unlikely to change frequently
- **Relevant to decision-making** — helps someone choose what to do

Process: Knowledge Steward reads → deduplicates → evaluates → categorizes → promotes → removes from candidates.

---

## Degradation

| Condition | Action |
|---|---|
| Still accurate but missing context | Update with new evidence |
| Partially wrong in newer version | Add version note, mark superseded, link to update |
| Completely wrong or obsolete | Move to `outdated/` with reason and date |
| Never referenced in 3+ work items | Move to `outdated/` |

---

## Principles

- Search existing knowledge before creating new knowledge
- Improve existing knowledge before creating duplicates
- Link knowledge to supporting evidence
- Keep knowledge technology-agnostic when possible
- Retire obsolete knowledge promptly
- Knowledge discovery is everyone's job; curation is the Steward's
