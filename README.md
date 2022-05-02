# python3-boilerplate ![CI](https://github.com/BastiTee/python3-boilerplate/workflows/CI/badge.svg)

> A best-practices template project for Python3 modules

--------------------------------------------------------------------------------

**Disclaimer**: If you see this on [pypi.org](https://pypi.org/project/python3-boilerplate/) please note that the project is only published here for testing purposes. Please visit [GitHub](https://github.com/BastiTee/python3-boilerplate) for the related template project.

--------------------------------------------------------------------------------

## Setup

- Make sure that `python` and `poetry` is installed and available on the path. Python 2 is not supported – :skull:
- On first checkout run `make` to initialize the project configuration and build everything
- Refer to [the Makefile](Makefile) to learn about the various operations available
- To rename the project you can use [the provided script](__rename__.sh): `./__rename__.sh`

## Features

- Basic project/module organization according to <https://packaging.python.org>
- `Makefile` bootstrapping script
- [poetry](https://python-poetry.org/) with virtual environments and project builds
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

- Introduce [black](https://github.com/psf/black) in favour of other linters
- Introce Python 3.7 and Python 3.10 to test matrix

## Licensing

This project is licensed under [Apache License 2.0](LICENSE.txt).
