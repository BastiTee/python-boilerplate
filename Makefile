# Required executables
ifeq (, $(shell which python))
 $(error "No python on PATH.")
endif
ifeq (, $(shell uv help))
 $(error "uv not available in Python installation.")
endif

export LC_ALL = C
export LANG = C.UTF-8
PY_FILES := my_module tests

.PHONY: help all clean clear-cache venv build test mypy lint lint-fix format format-check outdated update run-venv install-run audit pre-commit
.DEFAULT_GOAL := all

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-15s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

# Bundle tasks

all: clean venv build ## Clean, create venv, and run full build (default)
	@echo Executed default build pipeline

clean: ## Remove .venv, caches, and build artifacts
	@echo Clean project base
	find . -type d \
	-name ".venv" -o \
	-name ".tox" -o \
	-name ".ropeproject" -o \
	-name ".mypy_cache" -o \
	-name ".ruff_cache" -o \
	-name ".pytest_cache" -o \
	-name "__pycache__" -o \
	-iname "*.egg-info" -o \
	-name "build" -o \
	-name "dist" \
	|xargs rm -rfv

clear-cache: ## Clear uv dependency cache
	uv cache clean

venv: clean ## Clean and recreate virtual environment
	uv sync

build: test mypy lint format ## Run the entire build chain
	uv build

test: ## Run pytest test suite
	uv run py.test tests

mypy: ## Run mypy type checking
	uv run mypy $(PY_FILES)

lint: ## Run ruff linting
	uv run ruff check $(PY_FILES)

lint-fix: ## Auto-fix linting issues with ruff
	uv run ruff check --fix $(PY_FILES)

format: ## Format code with ruff
	uv run ruff format $(PY_FILES)

format-check: ## Check code formatting (no changes)
	uv run ruff format --check $(PY_FILES)

outdated: ## Show outdated dependencies
	uv pip list --outdated --exclude-editable

update: ## Update all dependencies
	uv sync --upgrade

run-venv: ## Run module directly in venv
	uv run python -m my_module

install-run: ## Install package and run CLI
	uv pip install --upgrade .
	@echo --- Note: The next command might fail before you reload your shell
	my_module_cli

audit: ## Scan dependencies for known CVEs
	uv run pip-audit

pre-commit: ## Run all pre-commit hooks on all files
	uv run pre-commit run --all-files
