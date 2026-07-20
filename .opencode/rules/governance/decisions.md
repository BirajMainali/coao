# Decision Governance Policy

## Purpose

Ensure important decisions are intentional, traceable, reviewable, and understandable.

Decisions are organizational assets. They preserve reasoning, reduce repeated debate, and provide context for future work.

---

## Decision Process

Every significant decision follows:

1. Understand the problem.
2. Gather evidence.
3. Identify constraints.
4. Explore alternatives.
5. Evaluate trade-offs.
6. Recommend a solution.
7. Explain reasoning.
8. Record important decisions.

## Decision Principles

- Evidence over opinion.
- Simplicity over complexity.
- Reuse over recreation.
- Long-term maintainability over short-term convenience.
- Customer value over technical preference.

## Trade-off Evaluation

Consider:

- Business value
- Complexity
- Maintainability
- Security
- Performance
- Scalability
- Reliability
- Cost
- Delivery impact

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

### Work Item Decisions (temporary)

Written to `.coao/<type>s/<slug>/<role>/decisions/`.

These support the current work item. They are archived with the workspace and are not expected to be read again unless the work item resumes.

### Architecture Decision Records - ADRs (organizational)

Promoted to `knowledge/decisions/` at the repository root.

These persist across work items and serve as organizational knowledge. Promote a work item decision to an ADR when it:

- Changes long-term architecture or system design
- Introduces new technology or dependency
- Has significant cost, security, or operational impact
- Is likely to be referenced by future work items

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