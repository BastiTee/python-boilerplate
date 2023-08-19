# Required executables
ifeq (, $(shell which python))
 $(error "No python on PATH.")
endif
POETRY_CMD := python -m poetry
ifeq (, $(shell $(POETRY_CMD)))
 $(error "Poetry not available in Python installation.")
endif

export LC_ALL = C
export LANG = C.UTF-8
PY_FILES := my_module tests
VERSION := $(shell poetry version --short)

# Bundle tasks

all: clean venv build
	@echo Executed default build pipeline

# Clean up and set up

clean:
	@echo Clean project base
	find . -type d \
	-name ".venv" -o \
	-name ".tox" -o \
	-name ".ropeproject" -o \
	-name ".mypy_cache" -o \
	-name ".pytest_cache" -o \
	-name "__pycache__" -o \
	-iname "*.egg-info" -o \
	-name "build" -o \
	-name "dist" \
	|xargs rm -rfv

clear-cache:
	@echo Clear poetry cache
	$(POETRY_CMD) cache clear pypi --all --no-interaction

venv: clean
	@echo Initialize virtualenv, i.e., install required packages etc.
	$(POETRY_CMD) config virtualenvs.in-project true --local
	$(POETRY_CMD) install

shell:
	@echo Open a new shell using virtualenv
	$(POETRY_CMD) shell

# Building software

build: test mypy isort black lint
	@echo Run build process to package application
	$(POETRY_CMD) build

test:
	@echo Run all tests suites
	$(POETRY_CMD) run py.test tests

mypy:
	@echo Run static code checks against source code base
	$(POETRY_CMD) run mypy $(PY_FILES)

isort:
	@echo Check for incorrectly sorted imports
	$(POETRY_CMD) run isort --check-only $(PY_FILES)

isort-apply:
	@echo Check and correct incorrectly sorted imports
	$(POETRY_CMD) run isort $(PY_FILES)

black:
	@echo Run code formatting using black
	$(POETRY_CMD) run black $(PY_FILES)

lint:
	@echo Run code formatting checks against source code base
	$(POETRY_CMD) run flake8 $(PY_FILES)

outdated:
	@echo Show outdated dependencies
	$(POETRY_CMD) show --outdated

# Executing

run-venv:
	@echo Execute package directly in virtual environment
	$(POETRY_CMD) run python -m my_module

install-run:
	@echo Install and run package via CLI using the activated Python env
	python -m pip install --upgrade .
	@echo --- Note: The next command might fail before you reload your shell
	my_module_cli
