# python3-boilerplate ![CI](https://github.com/BastiTee/python3-boilerplate/workflows/CI/badge.svg)

> A best-practices template project for Python3 modules

---

**Disclaimer**: If you see this on [pypi.org](https://pypi.org/project/python3-boilerplate/) please note that the project is only published here for testing purposes. Please visit [GitHub](https://github.com/BastiTee/python3-boilerplate) for the related template project.

---

## Setup

- Make sure that `python3` and `pip3` is installed and available on the path (on Ubuntu: `sudo apt-get install python3 python3-pip`)
- On first checkout run `make venv` to initialize the project configuration
- Refer to [the Makefile](Makefile) to learn about the various operations available
- To rename the project you can use [the provided script](__rename__.sh)

## Features

- Basic project/module organization according to <https://packaging.python.org>
- [Makefile](Makefile) management script
- [pipenv](https://github.com/pypa/pipenv) and virtual environments
- [distutils](https://docs.python.org/3/library/distutils.html)-based installer script
- Unit testing with [pytest](https://docs.pytest.org/en/latest/)
- Multicore/-interpreter testing with [tox](https://tox.readthedocs.io/en/latest/)
- Linting ([flake8](http://flake8.pycqa.org)) and code formatting ([autopep8](https://github.com/hhatto/autopep8)) support
- [isort](https://pypi.org/project/isort/) support for automated import sorting
- Publishing to PyPi.org at <https://pypi.org/project/python3-boilerplate/>
- [vscode](https://code.visualstudio.com/) editor configuration including plugin recommendations, debugging support, unit test discovery and on-save formatting
- [Github actions](https://github.com/BastiTee/python3-boilerplate/actions) continuous integration

## How to use in existing project

To use it in an existing project you can merge the remote changes to your project.

- Add remote to access the template project

```shell
git remote add py3template git@github.com:BastiTee/python3-boilerplate.git
git pull py3template master --allow-unrelated-histories
```

- Solve all merge conflicts and commit. Most likely there will be a lot
- Do whatever is necessary to remove the boilerplate you don't need, e.g.

```shell
rm -rf my_module tests/test_utils.py __rename__.sh
```

- Commit your changes and push to your project

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

- Optional static type hints ([PEP 484](https://www.python.org/dev/peps/pep-0484/)) with [mypy](https://github.com/python/mypy)
- Make sure [tox](https://tox.readthedocs.io/) is working as expected for supported Python versions
- Introduce [black](https://github.com/psf/black) in favour of other linters
- Introduce [pyproject.toml](https://www.python.org/dev/peps/pep-0518/) along with bleeding edge build tools like [flit](https://flit.readthedocs.io/en/latest/rationale.html) or [poetry](https://python-poetry.org/)

## Licensing

This project is licensed under [Apache License 2.0](LICENSE.txt).
