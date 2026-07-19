---
name: prototype
description: >
  Build a throwaway HTML/CSS/JS prototype with domain simulation.
  Single goal: produce an HTML file the user opens in a browser,
  interacts with, and gives feedback on.
---

# Prototype Skill

## Goal

Produce a single HTML file that the user opens in a browser, interacts with, and gives feedback on.

Everything in this skill — research, elicitation, design, validation — exists solely to make that HTML file accurate and reviewable. Nothing else matters.

---

## When to Use

Use when UI flow, domain logic, or interaction patterns need validation before implementation. The prototype exists to answer questions, not to ship.

Do not use when the design is already settled and ready for production.

---

## Boundaries

### What the skill delivers

A throwaway HTML file that:
- Simulates domain behavior — taxonomy, calculations, state transitions, success and failure paths
- Matches the project's design language (fonts, colors, spacing, alignment) — discovered from the codebase, not guessed
- Is openable directly in a browser — no server, no build step
- Lets the user click, type, and see results — the entire point is interaction

### Constraints

- Vanilla HTML/CSS/JS only. No frameworks, no build tools, no npm.
- Output to `prototypes/<slug>/index.html` — exactly one deliverable
- If splitting into separate files helps readability, do it. But index.html must be openable standalone.
- Throwaway code. Do not optimize for production.

### What the agent decides

- What questions to ask and how to elicit domain information
- UI layout, component structure, visual design (within design token bounds)
- How to implement the simulation (state machine, async patterns, etc.)
- When and how to consult sub-agents

---

## Workflow

### 1. Discover

Research the codebase for:
- Design tokens — CSS custom properties, fonts, colors, spacing, radii, shadows
- Domain terms — entity names, actions, statuses from types, routes, schemas

Check `prototypes/<slug>/index.html`. If it exists, skip to Validate.

Write findings to `research.md`.

### 2. Elicit

Interactive. The user needs to make decisions. You need answers.

Present research findings first. Then ask questions one at a time. Never ask what the codebase already answers. Provide a recommended answer with each question.

Cover:
- What user action or decision does this prototype simulate?
- What are the key entities and their properties?
- What calculations or rules govern behavior?
- What UI states exist and what triggers transitions?
- What validates correctness?
- What edge cases matter?

Record answers in `decisions.md`. Synthesize into a data model, state machine, business rules, and flow map. These directly drive the HTML file.

### 3. Build

Write `prototypes/<slug>/index.html`. This is the only deliverable.

The HTML file must:
- Be openable by double-click (file:// protocol) — no server required
- Use design tokens discovered in Discover phase
- Include a way for the user to trigger both success and failure paths (e.g., a checkbox for "simulate error")
- Be visually complete — the user should understand the flow immediately
- Work in a modern browser

Use a simple reactive state pattern — `setState()` triggers `render()`. Simulate async operations with `setTimeout`.

Consult Solution Architect for complex logic. Consult Software Engineer for non-trivial patterns. Their output must end up in the same HTML file.

### 4. Validate

Open the HTML file and verify:
- User can interact with it (click, type, see results)
- Both success and failure paths are demonstrable
- All UI states render (idle, loading, success, error, empty)
- Design tokens match codebase findings
- No console errors
- Edge cases from Elicit phase are handled

Consult QA Engineer to formalize validation if needed.

Fix issues and re-validate until the file is review-ready.

### 5. Present

The prototype is done. Tell the user:
- Where the file is (`prototypes/<slug>/index.html`)
- What it simulates
- How to trigger each path (happy path, error path, edge cases)
- What feedback you need

Update `context.md` with prototype status. Record learnings in `research.md`. Flag reusable findings as knowledge candidates.

---

## Agent Consultation

| Trigger | Agent |
|---|---|
| Complex data model or logic | Solution Architect |
| Non-trivial implementation | Software Engineer |
| Validation criteria definition | QA Engineer |
| Domain decisions | Human (Elicit phase) |

Research before consulting. Provide full context. Document learnings.

---

## Success

The user opens `prototypes/<slug>/index.html`, interacts with it, and gives feedback that reduces uncertainty about the design.

If that happens, the skill succeeded. Everything else is support.
