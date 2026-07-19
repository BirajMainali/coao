---
name: git-branching
description: Consistent Git branching conventions — branch from higher branches, safe merge workflow, human-style commits. Use when creating branches, merging, or committing.
---

# Git Branching

## Purpose

Standardize branch creation, naming, merging, and committing to prevent collisions, protect environment branches, and keep history clean.

---

## When to Use

Use this skill when:
- Creating a new branch for any work item.
- Naming a branch.
- Merging work into an environment branch.
- Committing changes.
- Reviewing branch structure.

---

## Conventions

### 1. Source Branch

Always branch from the highest applicable production or near-production branch.

- `main` or `master` or `prod` — whichever is designated as the production branch.
- Confirm the production branch name on first interaction and memorize it for the session.

### 2. Branch Naming

Format:

```
<work>/<source-branch>/<work-item>
```

Examples:
- `feat/master/user-fix`
- `fix/main/login-error`
- `chore/prod/update-deps`
- `spike/master/auth-research`

Work types: `feat`, `fix`, `chore`, `spike`, `task`, `refactor`, `docs`, `test`, `perf`, `style`, `ci`, `build`, `revert`.

### 3. Merge Branch Naming

Do not merge a feature branch directly into an environment branch.

Create a dedicated merge branch:

```
merge/<source-branch>/<work-item>
```

Examples:
- `merge/master/user-fix`
- `merge/main/login-error`

### 4. Commit Style

No tool tags, agent metadata, or automated prefixes in commit messages.

Commit like a human would:

```
fix login button alignment on mobile
```

```
add user profile endpoint
```

```
refactor auth middleware
```

No emojis, no `[cursor]`, no `opencode:`, no ticket numbers in the subject line.

### 5. Environment Branch Protection

Never push directly to environment branches:

- `develop`
- `qa`
- `staging`
- `uat`
- `master` / `main` / `prod`

All changes reach environment branches only through a merge branch workflow.

---

## Merge Workflow

The merge branch prevents conflicts from polluting the feature branch and keeps the path to production clean.

### Step-by-Step

**1. Ensure feature branch is up to date**

```bash
git checkout feat/master/my-feature
git fetch origin
git rebase origin/master
```

**2. Create a merge branch from the environment branch**

```bash
git checkout origin/develop
git checkout -b merge/master/my-feature
```

**3. Merge the feature branch into the merge branch**

```bash
git merge feat/master/my-feature
```

Resolve any conflicts here. The merge branch absorbs the resolution.

**4. Push the merge branch and open a PR to the environment branch**

```
merge/master/my-feature  →  develop
```

**5. After merge to environment branch, delete the merge branch**

---

## Why This Workflow

- If `feat/master/user-fix` is merged directly into `develop` and a conflict occurs, the conflict resolution lives on the feature branch. Patching that to `master` becomes risky — it effectively moves `develop` into `master`.
- With a merge branch, conflict resolution is isolated. The feature branch remains clean and can still be merged elsewhere.
- This applies to all environment branches, not just `develop`.

---

## Anti-patterns

- Merging feature branch directly into any environment branch.
- Pushing directly to `develop`, `qa`, `staging`, `uat`, `master`/`main`/`prod`.
- Including tool metadata in commit messages.
- Creating branches from non-production branches without confirmation.

---

## Success

Every branch name communicates: what kind of work, where it came from, and what it changes. Every merge goes through a merge branch. Every commit reads like a human wrote it.
