# python-boilerplate ![CI](https://github.com/BastiTee/python-boilerplate/workflows/CI/badge.svg)

> A best-practices template project for Python modules

## Setup

- Create a new repository [using this template](https://github.com/BastiTee/python-boilerplate/generate).
- Make sure that `python` is installed and available on system path. I recommend using [`pyenv`](https://github.com/pyenv/pyenv). Note that Python 2 is _not_ supported. It's end of life was on January 1st, 2020.
- Make sure [`poetry`](https://python-poetry.org/) is installed. This usually just means `python -m pip install poetry`.
- Rename the project using [the provided script](rename_template.sh): `./rename_template.sh`.
- Run `make` to initialize the project configuration and build everything.
- Refer to [the Makefile](Makefile) to learn about the various operations available. Most of them are just facades for `poetry`.

## Features

- Basic project/module organization according to <https://packaging.python.org>
- Makefile bootstrapping script
- [poetry](https://python-poetry.org/) with virtual environments and project builds
- [black](https://github.com/psf/black) code formatting
- Unit testing with [pytest](https://docs.pytest.org/en/latest/)
- Linting ([flake8](http://flake8.pycqa.org)) and code formatting ([autopep8](https://github.com/hhatto/autopep8)) support
- [isort](https://pypi.org/project/isort/) support for automated import sorting
- [mpyp](https://pypi.org/project/mypy/) support for type checking
- Publishing to PyPi.org
- [vscode](https://code.visualstudio.com/) editor configuration including plugin recommendations, debugging support, unit test discovery and on-save formatting
- [Github actions](https://github.com/BastiTee/python-boilerplate/actions) continuous integration with multi-python testing
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

## Future ideas and todos

- Embed flake8 config into `pyproject.toml` once they support it ([see](https://github.com/PyCQA/flake8/issues/234))
- Use cookiecutter instead of [shell script](./rename_template.sh) (it does work fine at the moment though)

## Licensing

This project is licensed under [Apache License 2.0](LICENSE.txt).
