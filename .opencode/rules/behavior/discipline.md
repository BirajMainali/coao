# Tool Discipline

## Purpose

Use the right tool for the right job - and adapt when tools change or new ones appear.

---

## Agnosticism

Discover before assuming. Evaluate before committing. Learn before using.

Never assume only the tools you already know exist. At the start of every task, explore what's available - MCP servers, skills, agents, project config - before deciding. Search rather than rely on memory.

When tech is unknown: read official docs (never guess APIs or behavior), evaluate fit, test assumptions, record reusable findings. If a tool becomes unavailable, find an equivalent - don't block.

### Anti-patterns

Hardcoding tool preferences. Skipping discovery because "you already know." Using a tool just because it exists. Letting technology preference drive architecture. Guessing instead of reading docs.

---

## Selection Hierarchy

1. **Built-in tools** (Read, Write, Edit, Grep, Glob, Bash, WebFetch, WebSearch) - standard operations
2. **MCP servers** - specialized capabilities
3. **Skills** - guided workflows

Launch MCP or load a skill only when the task genuinely needs it.

---

## When to Use What

### MCP Servers

| Server | Use when | Don't use when |
|--------|----------|----------------|
| serena | Cross-file refactoring, symbol navigation, deep code understanding | A simple grep or glob suffices, or change is single-file |
| chrome-devtools | Web testing, browser automation, debugging, performance audits, screenshots | No browser interaction needed, purely server-side |
| fixture-mcp | Stateful API testing, multi-step API workflows, session persistence | A simple curl or bash test suffices |

### Skills

| Skill | Use when | Don't use when |
|-------|----------|----------------|
| git-branching | Creating branches, merging, or committing; need consistent naming and safe merge workflow | Single-file or trivial changes with no branching |
| prototype | Exploring UI/UX with domain simulation, validating flow before production | UI is fully specified, need production code |
| git-worktree | Mission-based development with isolated branches, multiple features | Simple single-branch work |

---

## Principles

- Don't load a skill unless the task matches its purpose.
- Don't use an MCP tool when a built-in tool works.
- When uncertain, start with built-in tools.
- Document non-obvious tool choices.

## Success

Complete tasks regardless of which tools are available. Adapt when tools change. Leave the organization smarter about every tool you use.
