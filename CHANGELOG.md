# Changelog

## 0.3.1

- Codebase clean-ups

## 0.3.0

- Removed support for Python 3.7
- Upgraded all dependencies
- Added a make target to list outdated dependencies

[#11](https://github.com/BastiTee/python-boilerplate/pull/11)

## 0.2.0

- Added a script installer for fast CLI access
- Improved readability and infos in README

[#10](https://github.com/BastiTee/python-boilerplate/pull/10)

## 0.1.0

- Removed all explicit calls for Python 3 and assuming it everywhere (including project name) [#8](https://github.com/BastiTee/python-boilerplate/pull/8)
- Added a changelog [#9](https://github.com/BastiTee/python-boilerplate/pull/9)

## 0.0.9

- Added support for Python 3.9-3.11
- Updated dependencies

[#6](https://github.com/BastiTee/python-boilerplate/pull/6) [#7](https://github.com/BastiTee/python-boilerplate/pull/7)

## 0.0.8

- Removed a lot of remaining boilerplate
- Reduced dependencies
- Improved Makefile
- Improve rename script

[#5](https://github.com/BastiTee/python-boilerplate/pull/5)

## 0.0.7

- Introduced black code formatting
- Cleaned up README.md

[#4](https://github.com/BastiTee/python-boilerplate/pull/4)

## 0.0.6

- Migrated from pipenv to poetry
- Introduced matrix testing via Github actions
- Updated configuration files

[#3](https://github.com/BastiTee/python-boilerplate/pull/3)

## 0.0.5

- Add mypy support
- Fix test discovery in VSCode
- Add PyLance support

## 0.0.4

- Fix Intellisense for VScode
- Integrate configuration files

## 0.0.3

- Update boilerplate tooling to 2020

## 0.0.2

First release. Contains support for:

- Flask-based dummy application running on <http://localhost:9690>
- Basic project/module organization according to <https://packaging.python.org>
- Makefile-like management script
- pipenv virtual environments
- setup.py-based installer script
- Unit testing with pyTest
- Multicore/-interpreter testing with detox
- Linting (flake8) and code formatting (autopep8) support
- vscode editor configuration including debugging support, unit test discovery and on-save formatting
- Dockerized builds and run with nginx/uwsgi
- Publishing to PyPi.org at <https://pypi.org/project/python3-boilerplate/>

## How to release a new version

- Finish development on branch and merge to main
- Update this changelog, bump version number in `pyproject.toml` and commit
- Run

```shell
VERSION=$( poetry version --short ) &&\
echo "Release: ${VERSION}" &&\
git tag -a ${VERSION} -m "Version ${VERSION}" &&\
git push --tags
```

- Create a new release under <https://github.com/BastiTee/python-boilerplate/releases>
