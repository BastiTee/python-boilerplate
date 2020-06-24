# python3-boilerplate

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
- [pipenv](https://github.com/pypa/pipenv) & virtual environments
- [distutils](https://docs.python.org/3/library/distutils.html)-based installer script
- Unit testing with [pytest](https://docs.pytest.org/en/latest/)
- Multicore/-interpreter testing with [tox](https://tox.readthedocs.io/en/latest/)
- Linting ([flake8](http://flake8.pycqa.org)) and code formatting ([autopep8](https://github.com/hhatto/autopep8)) support
- [isort](https://pypi.org/project/isort/) support for automated import sorting
- Publishing to PyPi.org at <https://pypi.org/project/python3-boilerplate/>
- [vscode](https://code.visualstudio.com/) editor configuration including plugin recommendations, debugging support, unit test discovery and on-save formatting
- [Github actions](https://github.com/BastiTee/python3-boilerplate/actions) continuous integration

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

- [ ] `.PHONY` doesn't really work yet. Seems like `make venv` is exiting with 1
- [ ] Optional static typing for Python 2 and 3 (PEP 484) <https://github.com/python/mypy>
- [ ] Reflect current state of Python multi-threading
- [ ] Make sure tox is working as expected for supported Python versions
