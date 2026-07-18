# Tool Selection Policy

## Purpose

Ensure agents use the right tool for the right job — balancing capability, cost, and correctness.

---

## Selection Hierarchy

Prefer tools in this order:

1. **Built-in tools** (Read, Write, Edit, Grep, Glob, Bash, WebFetch, WebSearch) — for standard file and shell operations
2. **MCP servers** — for specialized capabilities not covered by built-in tools
3. **Skills** — for guided workflows and structured methodologies

Launch MCP or load a skill only when the task genuinely requires it. Do not default to loading everything.

---

## MCP Server Selection

### serena

*Use when:* Cross-file refactoring, symbol navigation, deep code understanding, language-server-backed code queries, renaming across files, finding references and definitions.

*Don't use when:* A simple grep or glob suffices, or the change is limited to a single file.

---

### chrome-devtools

*Use when:* Web testing, browser automation, debugging browser behavior, performance audits (Core Web Vitals, Lighthouse), taking screenshots, inspecting DOM or network activity.

*Don't use when:* No browser interaction is needed, or the work is purely server-side.

---

### fixture-mcp

*Use when:* Stateful API testing with session persistence, multi-step API workflows, context store across requests, event audit logging.

*Don't use when:* A simple curl or Bash API test is sufficient.

---

## Skill Selection

### caveman

*Use when:* User requests brevity, says "caveman mode" or invokes `/caveman`, or explicitly asks for short responses.

*Don't use when:* Normal communication is expected.

---

### git-worktree

*Use when:* Mission-based development requiring isolated branches, working on multiple features simultaneously, or needing a clean sandbox separate from the main working tree.

*Don't use when:* Simple single-branch work with no isolation requirement.

---

### grilling

*Use when:* User asks to be grilled on a plan or design, says "grill me", or wants to stress-test decisions and uncover blind spots.

*Don't use when:* Normal collaborative discussion or when the user has not requested it.

---

## General Principles

- Do not load a skill unless the task explicitly matches its purpose.
- Do not use an MCP tool when a built-in tool is equally effective.
- When uncertain which tool to use, start with built-in tools.
- Document tool selection rationale in artifacts when the choice is non-obvious.
