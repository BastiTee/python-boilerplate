---
name: "Release"
description: Run the full release workflow — changelog, version bump, tag, GitHub release
allowed-tools: Bash, Read, Edit
category: Workflow
tags: [release, workflow]
---

Execute the full release workflow. Follow every step in order; always confirm with the user before any irreversible action (tag push, GitHub release, PyPI publish).

---

## Step 1 — Pre-flight checks

Run all three checks before proceeding. If any fails, stop and tell the user what to fix.

```bash
git branch --show-current          # must be "main"
git status --porcelain             # must be empty (clean tree)
gh auth status                     # must show BastiTee as the active account
```

## Step 2 — Determine next version

```bash
grep '^version' pyproject.toml | head -1    # current version
git log $(git describe --tags --abbrev=0)..HEAD --oneline   # commits since last tag
```

Show the user the current version and the commit list, then ask: **"What should the new version number be?"**

## Step 3 — Draft and confirm changelog entry

Extract PR numbers from merge commits and build a draft `## X.Y.Z` section:

```bash
git log $(git describe --tags --abbrev=0)..HEAD --oneline | grep "Merge pull request"
```

For each user-facing change, include a linked PR reference in the format `([#N](https://github.com/BastiTee/python-boilerplate/pull/N))`. Skip Dependabot and pure CI commits. Show the draft to the user and ask them to confirm or edit before writing anything.

## Step 4 — Update files

1. Prepend the confirmed changelog section to `CHANGELOG.md` — insert it right after the `# Changelog` title line, above all existing version sections.
2. Update `version = "..."` in `pyproject.toml` to the new version.
3. Show `git diff` and ask for confirmation before continuing.

## Step 5 — Build the release artifact

```bash
make release
```

This runs a clean build (tests, mypy, lint, format, package) and lists the built artifacts. It must succeed before committing. Fix any failures before continuing.

## Step 6 — Commit

```bash
git add CHANGELOG.md pyproject.toml uv.lock
git commit -m "Release X.Y.Z"
```

## Step 7 — Tag and push _(confirm before running — irreversible)_

```bash
git tag -a X.Y.Z -m "Version X.Y.Z"
git push && git push --tags
```

## Step 8 — Create GitHub release _(confirm before running — irreversible)_

The release title is `vX.Y.Z` (v-prefixed). The notes are a bare URL to the changelog section — the anchor is the version with dots stripped (e.g. `0.1.2` → `#012`).

```bash
gh release create X.Y.Z \
  --title "vX.Y.Z" \
  --notes "https://github.com/BastiTee/python-boilerplate/blob/main/CHANGELOG.md#XYZ"
```

Report the release as complete once Step 8 succeeds.
