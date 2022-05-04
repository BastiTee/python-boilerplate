# python3-boilerplate ![CI](https://github.com/BastiTee/python3-boilerplate/workflows/CI/badge.svg)

> A best-practices template project for Python modules

## Setup

- [Use this template](https://github.com/BastiTee/python3-boilerplate/generate)
- Make sure that `python` (Python 2 is not supported – :skull:) and [`poetry`](https://python-poetry.org/) has been properly installed which usually just means `python -m pip install poetry`
- On first checkout run `make` to initialize the project configuration and build everything
- Refer to [the Makefile](Makefile) to learn about the various operations available. Most of them are just facades for `poetry`
- To rename the project you can use [the provided script](rename_template.sh): `./rename_template.sh`

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
- [Github actions](https://github.com/BastiTee/python3-boilerplate/actions) continuous integration with multi-python testing

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

- Introduce Python 3.10 to test matrix
- Embed flake8 config into `pyproject.toml` once they support it ([see](https://github.com/PyCQA/flake8/issues/234))

## Licensing

This project is licensed under [Apache License 2.0](LICENSE.txt)
