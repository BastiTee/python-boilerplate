# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Python boilerplate/template project using `uv` for dependency management. To use as a template, run `./rename_template.sh <NEW_NAME>` — this renames the module, resets the version to `0.0.1`, rewrites `README.md`, and deletes itself and `CHANGELOG.md`.

## Development Commands

All operations are managed through the Makefile (facade for `uv` commands):

```bash
make                # Full pipeline: clean + venv + sync + build (destructive — removes .venv first)
make test           # Run pytest test suite (with coverage)
make build          # Run test, mypy, lint, format, then package
make audit          # Scan dependencies for known CVEs (pip-audit)
make pre-commit     # Run all pre-commit hooks on all files
make mypy           # Type checking
make lint           # Ruff linting
make lint-fix       # Auto-fix lint issues
make format         # Format code with ruff
make run-venv       # Run module: uv run python -m my_module
make clean          # Remove .venv, caches, build artifacts
make venv           # Recreate virtual environment
make update         # Update dependencies
```

### Running Single Tests
```bash
uv run py.test tests/test_code.py           # Single file
uv run py.test tests/test_code.py::TestCode # Single class
uv run py.test tests/test_code.py -k "test_code"  # By name pattern
```

## Architecture

The public API lives in `my_module/__init__.py` (exports via `__all__`). `__main__.py` is the CLI entry point that imports from `__init__.py` — new functionality goes in `__init__.py` (or submodules imported there), not in `__main__.py`.

- `my_module/py.typed` — PEP 561 marker; this package ships type information for downstream consumers
- `tests/` — pytest test suite, class-based structure mirroring module structure
- CLI entry point: `my_module_cli` → `my_module.__main__:main`

## Code Quality

- **Ruff**: Linting + formatting (line-length 88, quote-style preserve)
  - Rules: pycodestyle, pyflakes, isort, pyupgrade (UP), flake8-bugbear (B), flake8-comprehensions (C4), flake8-use-pathlib (PTH), Ruff-native (RUF), flake8-bandit (S); `assert` allowed in tests
- **Mypy**: Strict mode (`disallow_untyped_defs`, `warn_return_any`, `no_implicit_reexport`, `strict_equality`)
- **pytest**: Coverage enforced at ≥80% (`pytest-cov`), randomized order (`pytest-randomly`), `__main__.py` excluded from coverage
- **pip-audit**: CVE scanning for all dependencies
- **pre-commit**: Ruff auto-fix + format, YAML/TOML/merge-conflict hygiene
- **Python**: 3.10–3.13

All config is centralized in `pyproject.toml`.
