# Decisions

## D-001: Relationships as YAML front-matter files

**Context**: Need a parseable format for relationship manifests that can be auto-indexed.

**Decision**: Use YAML front-matter in `relationships.md` files — human-readable, machine-parseable, and consistent with how agents define their own config.

**Alternatives considered**: JSON (noisy), TOML (less familiar), database (overkill for file-based).

**Trade-offs**: YAML is whitespace-sensitive but widely understood.

## D-002: Auto-generated context-graph.md

**Context**: The relationship index must be always up-to-date without manual maintenance.

**Decision**: Use a shell script (`generate-context-graph.sh`) that scans all `relationships.md` files and regenerates the graph root. Agents run it after creating/updating relationships.

**Alternatives considered**: Git hooks (too intrusive), manual maintenance (will go stale), VS Code extension (too heavy).

**Trade-offs**: Requires agents to remember to regenerate. Mitigated by adding it to the workspace lifecycle and collaboration ritual.

## D-003: Research-brief bridge for True Researcher

**Context**: TR cannot read project files (Eliminate X constraint) but needs domain context to research effectively.

**Decision**: SA or PO creates a `research-brief.md` with domain terms, constraints, and the question — no code, no implementation details. TR reads only this file alongside `research.md`.

**Alternatives considered**: Verbal handoff (lost), letting TR read project files (violates Eliminate X principle), embedding context in the question (not reusable).

**Trade-offs**: Extra step for SA/PO, but preserves TR's unbiased research capability.

## D-004: Minimal relationship type set

**Context**: Need enough expressiveness without making the system complex.

**Decision**: Start with 7 relationship types: `depends-on`, `implements`, `relates-to`, `supersedes`, `blocked-by`, `references`, `promotes-to`. These cover dependency, implementation, conceptual links, and knowledge lifecycle.

**Alternatives considered**: Free-form tags (too loose), 3 types (too restrictive).

**Trade-offs**: May need extension later, but easier to add than to remove.
