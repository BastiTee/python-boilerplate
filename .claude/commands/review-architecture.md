---
description: Assess whether the Python project's tooling and CI/CD setup reflects current best practices. Flags proven improvements — not new toys, but well-established tools that have become community standards.
---

## Phase 1 — Discover

Read all four files in parallel before assessing anything:

1. `pyproject.toml`
2. `.github/workflows/main.yml`
3. `.pre-commit-config.yaml`
4. `Makefile`

If a file does not exist, note it as absent and continue.

## Phase 2 — Assess

For each area below, evaluate what you found in the files against the current community standard. Assign one verdict:

- ✓ **Good** — current best practice, no action needed
- ⚠ **Consider** — not wrong, but a proven improvement exists
- ✗ **Outdated** — clearly superseded; replacement is well-established

Do not flag something as ⚠ or ✗ unless you can point to a specific gap in the files you read. Do not give generic advice.

### Areas to assess

1. **Package & dependency management**  
   Is uv used? Is the lockfile committed? Are dependency groups (dev/prod) properly separated? Are version constraints reasonable (not over-pinned, not unconstrained)?

2. **Build backend**  
   Is the build backend modern and PEP 517/518 compliant (uv_build, hatchling, flit-core)? Is the src layout used?

3. **Test runner & coverage**  
   Is pytest configured with a meaningful coverage threshold (≥80%)? Is `--import-mode=importlib` set? Are there signs that parallelism (`pytest-xdist`) would help? Is `xfail_strict` enabled?

4. **Linting & formatting**  
   Is ruff used for both linting and formatting (replacing black + flake8 + isort)? Does the rule set cover security (S), type-checking (TCH), and modern Python (UP)? Is there a separate `T20` rule for catching stray print() calls in non-CLI code?

5. **Type checking**  
   Is mypy or pyright in use? Are strict options enabled (`disallow_untyped_defs`, `warn_return_any`)? Is the `py.typed` marker present for a library? Does CI run type checking?

6. **Pre-commit hygiene**  
   Are hooks pinned to specific versions? Is secret scanning present (gitleaks or detect-secrets)? Are YAML/TOML validators included? Are hook versions reasonably recent?

7. **CI/CD pipeline**  
   Is the full matrix (all supported Python versions) tested? Is uv caching configured? Is concurrency set to cancel stale runs? Does CI run lint, type check, and tests as separate steps or in one step? Is there a release/publish workflow, and if so, does it use trusted publishing (OIDC) instead of API tokens?

8. **Security & supply chain**  
   Is `pip-audit` or `safety` run in CI (not just locally)? Is there SBOM generation or dependency review? Are GitHub Actions pinned to a commit SHA or just a tag?

## Phase 3 — Report

Output a Markdown report with this structure:

```
## Architecture Review

| Area | Verdict | Summary |
|------|---------|---------|
| Package & dependency management | ✓/⚠/✗ | one line |
| Build backend | ... | ... |
| Test runner & coverage | ... | ... |
| Linting & formatting | ... | ... |
| Type checking | ... | ... |
| Pre-commit hygiene | ... | ... |
| CI/CD pipeline | ... | ... |
| Security & supply chain | ... | ... |

### Findings

For each ⚠ or ✗ item:
**[Area name]** — [What the files show] → [What to change and why it's better]. Effort: low/medium/high.

### Top 3 Priorities

Ordered list of the highest-value actionable changes.
```

Keep findings grounded in what you actually read. If the project is already well-configured in an area, say so briefly and move on.
