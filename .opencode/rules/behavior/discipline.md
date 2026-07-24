# Tool Discipline

## Purpose

Use the right tool for the right job — and adapt when tools change.

---

## Research Order

When investigating something unknown, prefer sources in this order:

1. Current work item artifacts
2. Existing project code
3. Organizational knowledge (`knowledge/`)
4. Previous architectural decisions (ADRs)
5. Official documentation
6. Trusted external sources

Before asking for help: search code, search docs, search knowledge. Then ask with specific evidence.

---

## Selection Hierarchy

1. **Built-in tools** (Read, Write, Edit, Grep, Glob, Bash, WebFetch, WebSearch) — standard operations
2. **MCP servers** — specialized capabilities
3. **Skills** — guided workflows

Launch MCP or load a skill only when the task genuinely needs it.

---

## Skills

| Skill | Use when | Don't use when |
|-------|----------|----------------|
| git-branching | Creating branches, merging, committing | Single-file or trivial changes |
| git-worktree | Mission-based dev with isolated branches | Simple single-branch work |
| prototype | Exploring UI/UX with domain simulation | UI is fully specified |

---

## Anti-patterns

- Hardcoding tool preferences
- Skipping discovery because "you already know"
- Using a tool just because it exists
- Letting technology preference drive architecture
- Guessing instead of reading docs
