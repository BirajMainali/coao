---
name: git-worktree
description: Create, resume, validate, and maintain Git worktrees for mission-based development. Use whenever work requires an isolated development environment.
---

# Git Worktree

## Purpose

Provide a consistent workflow for managing Git worktrees throughout a mission.

This skill standardizes how development workspaces are created, resumed, and maintained.

---

## When to Use

Use this skill when:

- Starting a new mission.
- Resuming an existing mission.
- Switching between missions.
- Preparing a mission for handoff.
- Completing a mission.

---

# Workflow

## 1. Discover

Determine whether an appropriate worktree already exists.

If one exists:

- Resume it.
- Do not create another.

If one does not exist:

- Continue to initialization.

---

## 2. Initialize

Create a dedicated worktree.

The worktree should contain:

- Feature branch
- Repository checkout
- Mission workspace
- Session tracking

Initialize the workspace.

Example
workspace/
    active/
        <mission-slug>/

---

## 3. Validate

Before beginning work verify:

- Correct worktree
- Correct branch
- Workspace exists
- Session exists
- Repository is in expected state

Resolve inconsistencies before continuing.

---

## 4. Resume

Read:

- session.md
- workspace artifacts
- handoffs
- outstanding work

Determine:

- Current objective
- Current owner
- Next action

Resume from existing state.

---

## 5. Maintain

During work:

- Update session.md.
- Update owned artifacts.
- Keep workspace synchronized with progress.
- Avoid duplicate files.

Workspace is the operational source of truth.

---

## 6. Complete

Before leaving the workspace:

- Update mission state.
- Record remaining work.
- Record assumptions.
- Record risks.
- Leave structured handoff.

---

## 7. Archive

When the mission is complete:

- Review artifacts.
- Recommend knowledge promotion.
- Archive workspace.
- Remove worktree only when explicitly instructed.

---

## Success

Every mission should have exactly one active worktree.

Every worktree should contain a complete and resumable workspace.

A contributor should be able to continue work without relying on previous conversations.