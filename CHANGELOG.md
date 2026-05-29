# Changelog

## 0.6.1

-  Fix [tool.pytest] → [tool.pytest.ini_options] (was silently ignored)
-  Fix mypy version spec (>=1.19.0) and pin uv_build>=0.8,<0.9
-  Add pip-audit for dependency CVE scanning (make audit)
-  Add pytest-cov with ≥80% coverage threshold and main.py omit
-  Add pytest-randomly to randomize test execution order
-  Add pre-commit with ruff and file-hygiene hooks (.pre-commit-config.yaml)
-  Expand ruff rules: UP, B, C4, PTH, RUF
-  Tighten mypy: warn_return_any, no_implicit_reexport, strict_equality
-  Harden CI: permissions: contents: read, fail-fast: false, pip-audit step
-  Remove obsolete UTF-8 coding declarations (UP009)
-  Fix Makefile install-run to use uv pip; add audit and pre-commit targets
-  Add python.defaultInterpreterPath to VS Code settings

## 0.6.0

-  Simplify .gitignore
-  Migrate from black, flake8, and isort to https://github.com/astral-sh/ruff
-  Improve CI flow
-  Add dependabot config
-  Add security scanning
-  Add help section to Makefile

[#20](https://github.com/BastiTee/python-boilerplate/pull/20)

## 0.5.1

-  Upgrade all dependencies
-  Fix and simplify uv usage in Makefile
-  Update vscode setup
-  Add a CLAUDE.md

[#19](https://github.com/BastiTee/python-boilerplate/pull/19)

## 0.5.0

-   Migrate from poetry to uv

[#18](https://github.com/BastiTee/python-boilerplate/pull/18)

## 0.4.2

-   Upgrade all dependencies
-   Drop support for Python 3.9
-   Upgrade `pyproject.toml` after deprecation

[#16](https://github.com/BastiTee/python-boilerplate/pull/16)

## 0.4.1

-   Upgrade all dependencies

[#15](https://github.com/BastiTee/python-boilerplate/pull/15)

## 0.4.0

-   Add pyproject.toml metadata fields for better <https://pypi.org/> usability
-   Upgrade all dependencies

[#14](https://github.com/BastiTee/python-boilerplate/pull/14)

## 0.3.4

-   Upgrade all dependencies
-   Add support and Github actions matrix for Python 3.13
-   Drop support for Python 3.8

[#13](https://github.com/BastiTee/python-boilerplate/pull/13)

## 0.3.3

-   Upgrade all dependencies
-   Add support and Github actions matrix for Python 3.12

## 0.3.2

-   Upgrade all dependencies

## 0.3.1

-   Codebase clean-ups

## 0.3.0

-   Remove support for Python 3.7
-   Upgrade all dependencies
-   Add a make target to list outdated dependencies

[#11](https://github.com/BastiTee/python-boilerplate/pull/11)

## 0.2.0

-   Add a script installer for fast CLI access
-   Improve readability and infos in README

[#10](https://github.com/BastiTee/python-boilerplate/pull/10)

## 0.1.0

-   Remove all explicit calls for Python 3 and assuming it everywhere (including project name) [#8](https://github.com/BastiTee/python-boilerplate/pull/8)
-   Add a changelog [#9](https://github.com/BastiTee/python-boilerplate/pull/9)

## 0.0.9

-   Add support for Python 3.9-3.11
-   Update dependencies

[#6](https://github.com/BastiTee/python-boilerplate/pull/6) [#7](https://github.com/BastiTee/python-boilerplate/pull/7)

## 0.0.8

-   Remove a lot of remaining boilerplate
-   Reduce dependencies
-   Improve Makefile
-   Improve rename script

[#5](https://github.com/BastiTee/python-boilerplate/pull/5)

## 0.0.7

-   Introduce black code formatting
-   Clean up README.md

[#4](https://github.com/BastiTee/python-boilerplate/pull/4)

## 0.0.6

-   Migrate from pipenv to poetry
-   Introduce matrix testing via Github actions
-   Update configuration files

[#3](https://github.com/BastiTee/python-boilerplate/pull/3)

## 0.0.5

-   Add mypy support
-   Fix test discovery in VSCode
-   Add PyLance support

## 0.0.4

-   Fix Intellisense for VScode
-   Integrate configuration files

## 0.0.3

-   Update boilerplate tooling to 2020

## 0.0.2

First release. Contains support for:

-   Flask-based dummy application running on <http://localhost:9690>
-   Basic project/module organization according to <https://packaging.python.org>
-   Makefile-like management script
-   pipenv virtual environments
-   setup.py-based installer script
-   Unit testing with pyTest
-   Multicore/-interpreter testing with detox
-   Linting (flake8) and code formatting (autopep8) support
-   vscode editor configuration including debugging support, unit test discovery and on-save formatting
-   Dockerized builds and run with nginx/uwsgi
-   Publishing to PyPi.org at <https://pypi.org/project/python3-boilerplate/>

## How to release a new version

-   Implement all desired changes on branch
-   Update this changelog
-   Bump version number in `pyproject.toml`
-   Finish development on branch and merge to main
-   Run

```shell
VERSION=$( python -m uv version --short --color never ) &&\
echo "Release: ${VERSION}" &&\
git tag -a ${VERSION} -m "Version ${VERSION}" &&\
git push --tags
git push
```

-   Create a new release under <https://github.com/BastiTee/python-boilerplate/releases>
