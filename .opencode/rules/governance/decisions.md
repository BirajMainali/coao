# Decision Governance Policy

## Purpose

Ensure important decisions are intentional, traceable, reviewable, and understandable.

Decisions are organizational assets. They preserve reasoning, reduce repeated debate, and provide context for future work.

---

## Principles

- Record decisions that have long-term impact.
- Document reasoning, not just conclusions.
- Consider alternatives before deciding.
- Decisions should be evidence-based.
- Decisions may evolve as new evidence emerges.

---

## When to Record a Decision

Record a decision when it:

- Changes architecture or system design.
- Introduces new technology or dependency.
- Defines or changes organizational standards.
- Alters product direction or business behavior.
- Has significant cost, security, or operational impact.
- Is likely to be revisited in the future.

Routine implementation choices do not require formal decision records.

---

## Decision Locations

### Mission Decisions (temporary)

Written to `.coao/docs/<mission-slug>/<role>/decisions/`.

These support the current mission. They are archived with the workspace and are not expected to be read again unless the mission resumes.

### Architecture Decision Records — ADRs (organizational)

Promoted to `knowledge/decisions/` at the repository root.

These persist across missions and serve as organizational knowledge. Promote a mission decision to an ADR when it:

- Changes long-term architecture or system design
- Introduces new technology or dependency
- Has significant cost, security, or operational impact
- Is likely to be referenced by future missions

---

## Decision Record

Each decision should include:

- Context
- Problem Statement
- Constraints
- Alternatives Considered
- Decision
- Reasoning
- Trade-offs
- Expected Consequences
- Supporting Evidence
- Review Date (if applicable)

---

## Decision Lifecycle

A decision may be:

- Proposed
- Accepted
- Superseded
- Deprecated
- Archived

Never delete historical decisions.

When a decision changes, record the new decision and reference the previous one.

---

## Ownership

The decision owner is responsible for:

- Maintaining accuracy
- Reviewing when necessary
- Recording significant changes
- Communicating impacts

---

## Success

Future contributors should understand:

- Why the decision was made.
- What alternatives existed.
- Why this approach was chosen.
- Whether the decision is still valid.

---

## Anti-patterns

Avoid:

- Decisions without reasoning.
- Decisions based solely on preference.
- Hidden trade-offs.
- Deleting historical decisions.
- Repeating previous discussions because no decision was recorded.