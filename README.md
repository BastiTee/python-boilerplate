# python3-boilerplate

> A boilerplate project based on Python3 development best-practices

## Setup

- Make sure that `python3` and `pip3` is installed and available on the path (on Ubuntu: `sudo apt-get install python3 python3-pip`)
- On first checkout run `./make init` to initialize the project configuration
- Refer to [the make script](make) to learn about the various operations available

## Reuse for own projects

- Fork this repository
- Use the [`__rename__`](__rename__) script to apply your own module name, etc.

## Features

- [Flask](http://flask.pocoo.org/)-based dummy application running on <http://localhost:9690>
- Basic project/module organization according to <https://packaging.python.org>
- Makefile-like management script
- [pipenv](https://github.com/pypa/pipenv) & virtual environments
- [distutils](https://docs.python.org/3/library/distutils.html)-based installer script
- Unit testing with [pytest](https://docs.pytest.org/en/latest/)
- Multicore/-interpreter testing with [tox](https://tox.readthedocs.io/en/latest/) and [detox](https://github.com/tox-dev/detox)
- Linting ([flake8](http://flake8.pycqa.org)) and code formatting ([autopep8](https://github.com/hhatto/autopep8)) support
- [vscode](https://code.visualstudio.com/) editor configuration including debugging support, unit test discovery and on-save formatting
- [Dockerized builds](https://www.docker.com/) and run with [nginx](https://www.nginx.com/)/uwsgi
- Publishing to PyPi.org at <https://pypi.org/project/python3-boilerplate/>
- Simulation of installing application to a mint system

## Further resource

- <http://packaging.python.org/>
- <https://packaging.python.org/en/latest/distributing.html>
- <https://pypi.org/>
- <https://github.com/pypa/sampleproject>
- <https://www.python.org/dev/peps/>
- <https://www.python.org/dev/peps/pep-0008/>
- <https://www.kennethreitz.org/essays/why-you-should-use-vs-code-if-youre-a-python-developer>
- <https://code.visualstudio.com/docs/python/python-tutorial>
