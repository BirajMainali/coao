---
name: git-branching
description: Consistent Git branching conventions - branch from higher branches, safe merge workflow, human-style commits. Use when creating branches, merging, or committing.
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

- `main` or `master` or `prod` - whichever is designated as the production branch.
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

## Merge & Conflict Resolution Workflow

The merge branch prevents conflicts from polluting the feature branch and keeps the path to production clean. All conflict resolution happens in the merge branch, never in the feature branch.

### 1. Prepare Feature Branch

```bash
git checkout feat/master/my-feature
git fetch origin
git rebase origin/master
```

If rebase has conflicts, resolve them in the feature branch - this is normal. The feature branch should always be current against its source.

### 2. Create Merge Branch

```bash
git checkout origin/develop
git checkout -b merge/master/my-feature
```

### 3. Merge Feature into Merge Branch

```bash
git merge feat/master/my-feature
```

### 4. Resolve Conflicts

When conflicts appear:

```bash
# See what's conflicted
git status

# Open each conflicted file, find markers:
#   <<<<<<< HEAD        - your side (merge branch / develop base)
#   =======             - divider
#   >>>>>>> feat/...    - their side (feature branch)
```

Edit each conflicted file to keep the correct code, remove markers, then:

```bash
git add <resolved-file>
git commit                 # let Git generate the default merge commit message
```

Verify the result:

```bash
git log --oneline -5
git diff origin/develop    # confirm only your changes differ
```

If the merge is wrong and you want to start over:

```bash
git merge --abort
# fix the issue, then merge again
```

### 5. Push & PR

```bash
git push -u origin merge/master/my-feature
```

Open a PR: `merge/master/my-feature` → `develop`

### 6. Delete Merge Branch After Merge

Once the PR is merged to the environment branch, delete the merge branch both remote and local:

```bash
git push origin --delete merge/master/my-feature
git branch -d merge/master/my-feature
```

---

## Why This Workflow

- If `feat/master/user-fix` is merged directly into `develop` and a conflict occurs, the conflict resolution lives on the feature branch. Patching that to `master` becomes risky - it effectively moves `develop` into `master`.
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
