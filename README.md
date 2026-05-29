# python-boilerplate ![CI](https://github.com/BastiTee/python-boilerplate/workflows/CI/badge.svg)

> A best-practices template project for Python modules

This boilerplate gives you a production-ready Python project structure with modern tooling. Clone it, rename it, and start coding - linting, formatting, type checking, testing, and CI are already configured. No more setting up the same tools for every new project.

## Setup

- Create a new repository [using this template](https://github.com/BastiTee/python-boilerplate/generate).
- Make sure that `python` is installed and available on system path.
- Make sure [`uv`](https://github.com/astral-sh/uv) is installed. This usually just means `python -m pip install uv`.
- Rename the project using [the provided script](rename_template.sh): `./rename_template.sh`.
- Run `make` to initialize the project configuration and build everything.
- Refer to [the Makefile](Makefile) to learn about the various operations available. Most of them are just facades for `uv`.

## Features

- Basic project/module organization according to <https://packaging.python.org>
- Makefile bootstrapping script
- [uv](https://github.com/astral-sh/uv) with virtual environments and project builds
- [Ruff](https://github.com/astral-sh/ruff) for linting and code formatting (replaces black, flake8, isort)
- Security scanning via Ruff's [flake8-bandit](https://docs.astral.sh/ruff/rules/#flake8-bandit-s) rules
- Dependency vulnerability scanning with [pip-audit](https://github.com/pypa/pip-audit) (`make audit`)
- Unit testing with [pytest](https://docs.pytest.org/en/latest/) including coverage enforcement (`pytest-cov`) and randomized test order (`pytest-randomly`)
- [mypy](https://pypi.org/project/mypy/) for static type checking
- PEP 561 compliant (`py.typed` marker included)
- [pre-commit](https://pre-commit.com/) hooks for Ruff and file hygiene (`make pre-commit`)
- Publishing to PyPi.org
- [vscode](https://code.visualstudio.com/) editor configuration including plugin recommendations, debugging support, unit test discovery and on-save formatting
- [Github actions](https://github.com/BastiTee/python-boilerplate/actions) continuous integration with multi-python testing and dependency scanning
- [Dependabot](https://docs.github.com/en/code-security/dependabot) for automated dependency updates
- Executable script so after package installation you can run from the CLI using `my_module_cli`

## Resources

- <http://packaging.python.org/>
- <https://packaging.python.org/en/latest/distributing.html>
- <https://pypi.org/>
- <https://github.com/pypa/sampleproject>
- <https://www.python.org/dev/peps/>
- <https://www.python.org/dev/peps/pep-0008/>
- <https://www.kennethreitz.org/essays/why-you-should-use-vs-code-if-youre-a-python-developer>
- <https://code.visualstudio.com/docs/python/python-tutorial>

## Licensing

This project is licensed under [Apache License 2.0](LICENSE.txt).
