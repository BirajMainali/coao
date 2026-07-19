---
name: git-worktree
description: Create, resume, validate, and maintain Git worktrees for work-item-based development. Use whenever work requires an isolated development environment.
---

# Git Worktree

## Purpose

Provide a consistent workflow for managing Git worktrees throughout a work item.

This skill standardizes how development workspaces are created, resumed, reused, and cleaned up.

---

## When to Use

Use this skill when:

- Starting a new work item.
- Resuming an existing work item.
- Switching between work items.
- Preparing a work item for handoff.
- Completing a work item.

---

## Worktree Basics

A worktree is a separate checkout in its own directory. Work on multiple branches simultaneously without stashing or cloning again. Worktrees share `.git` objects, refs, and config - no duplication.

---

# Workflow

## 1. Discover

```bash
git worktree list
```

Shows every worktree path, branch, and commit. If one exists for this item, resume it - do not create another.

---

## 2. Create

All worktrees go in a **sibling directory** of the main repo (never inside it).

```bash
git worktree add ../<name> <base-branch>
```

### Examples

```bash
# New branch from master
git worktree add ../feat-user-auth master

# Existing local branch
git worktree add ../fix-login-error fix/login-error

# Remote tracking branch
git worktree add ../feat-user-auth origin/feat/user-auth
```

Create the work item workspace:

```bash
mkdir -p ../<name>/.coao/<type>s/<slug>
```

---

## 3. Validate

```bash
cd ../<name>
git status          # correct branch? clean?
git log --oneline -3
```

### Common Fixes

| Problem | Fix |
|---------|-----|
| Detached HEAD | `git checkout <branch>` then `git pull` |
| Stale metadata | `git worktree prune` |
| Branch missing locally | `git fetch origin` then retry |

---

## 4. Resume

```bash
cd ../<name>
git pull
```

Read `context.md` and workspace artifacts. Determine objective, owner, next action. Continue.

---

## 5. Reuse - Switch to a Different Branch

```bash
cd ../<name>
git fetch origin
git checkout -b <new-branch> <base-branch>
```

Or to an existing branch:

```bash
cd ../<name>
git checkout <existing-branch> && git pull
```

Delete the old branch if no longer needed:

```bash
git branch -d <old-branch>
```

---

## 6. Maintain

During work: update `context.md`, update artifacts, commit regularly.

```bash
git add -A && git commit -m "human-style message" && git push -u origin <branch>
```

---

## 7. Cleanup

After the branch is merged or the work item is complete:

```bash
git worktree remove ../<name>
git worktree prune
rm -rf ../<name>           # if directory still exists
```

### When to Clean

| Situation | Action |
|-----------|--------|
| Branch merged, PR closed | Remove worktree |
| Work item abandoned | Remove worktree + delete branch |
| Switching items | Leave current; create/resume another |
| Stale worktrees piling up | `git worktree prune` |

Prevent accidental cleanup of active worktrees:

```bash
git worktree lock ../<name>
git worktree unlock ../<name>
```

---

## Directory Convention

Workspace at `.coao/<type>s/<slug>/` where `<type>` is one of:

`projects`, `features`, `fixes`, `tasks`, `spikes`, `chores`, `releases`

---

## Anti-patterns

- Creating a worktree inside the main repo directory.
- Removing a worktree directory without `git worktree prune` after.
- Leaving stale worktrees indefinitely.
- Working in the main checkout when a dedicated worktree exists.

---

## Success

Every work item has exactly one active worktree. Every worktree is resumable by reading its artifacts. No stale worktrees accumulate.
