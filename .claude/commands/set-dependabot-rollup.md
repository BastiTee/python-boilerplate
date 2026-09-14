---
description: Combines all open Dependabot PRs into one branch, runs tests, and opens a rollup PR that lists the changes and the individual PRs it replaces.
---

## Phase 1 — Sync

Pull the latest main branch:

```
git pull origin main
```

## Phase 2 — Discover open Dependabot PRs

List all open Dependabot PRs and capture their PR number, title, and head branch:

```
gh pr list --author "app/dependabot" --state open --json number,title,headRefName
```

If there are no open Dependabot PRs, report that and stop.

## Phase 3 — Create a combined branch

Create a new branch off the current main:

```
git checkout -b chore/dependabot-updates
```

If the branch already exists locally, check it out and reset it to main:

```
git checkout chore/dependabot-updates
git reset --hard origin/main
```

## Phase 4 — Cherry-pick each Dependabot PR

For each open Dependabot PR found in Phase 2:

1. Fetch the remote branch:
   ```
   git fetch origin <headRefName>
   ```
2. Find the commits on that branch that are not on main:
   ```
   git log --oneline origin/<headRefName> --not origin/main
   ```
3. Cherry-pick each such commit onto the combined branch (in the order they appear, oldest first). If there is exactly one commit (the common case), cherry-pick it directly.

If a cherry-pick produces a conflict, stop, report the conflict and the PR that caused it, and ask the user how to proceed before continuing.

## Phase 5 — Run tests

Run the project test suite:

```
make test
```

If tests fail, report the failure output and stop — do not push or open a PR.

## Phase 6 — Push the branch

```
git push -u origin chore/dependabot-updates
```

## Phase 7 — Open a rollup PR

Create a PR with:
- **Title**: `chore: roll up Dependabot updates (<comma-separated PR numbers>)`
- **Base branch**: `main`
- **Body** structured as follows:

```
## Summary

Combines N open Dependabot PRs into a single reviewable branch.

### Changes included

| Dependency | From | To | Type |
|---|---|---|---|
| <dep name> | <old version> | <new version> | <GitHub Actions / Python dep> |
...

### Replaces

- #<number> — <title>
...

Both/All of those PRs can be closed once this is merged.

### Validation

`make test` passed locally after applying all changes.

---

🤖 Generated with [Claude Code](https://claude.com/claude-code)
```

Fill the **Changes included** table from the PR bodies of the individual Dependabot PRs (each PR body lists the exact old and new versions).

Determine the **Type** column value from the PR's head branch name:
- `dependabot/github_actions/...` → `GitHub Actions`
- `dependabot/pip/...` → `Python dep`

Report the URL of the created PR when done.
