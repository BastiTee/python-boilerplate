#!/bin/sh
set -e  # Always exit on non-zero return codes
cd "$( cd "$( dirname "$0" )"; pwd )"
# Check python and pipenv installation
[ -z "$( command -v python3 )" ] && { echo "python3 not available."; exit 1; }
[ -z "$( command -v pipenv )" ] && { echo "pipenv not available. \
Please run 'python3 -m pip install pipenv'."; exit 1; }

# Suppress warning if pipenv is started inside .venv
export PIPENV_VERBOSITY=${PIPENV_VERBOSITY:--1}
# Use relative .venv folder instead of home-folder based
export PIPENV_VENV_IN_PROJECT=${PIPENV_VENV_IN_PROJECT:-1}
# Ignore existing venvs (required for travis)
export PIPENV_IGNORE_VIRTUALENVS=${PIPENV_IGNORE_VIRTUALENVS:-1}
# Setup python path
export PYTHONPATH=${PYTHONPATH:-.}
# Make sure we are running with an explicit encoding
export LC_ALL=${PYPE_ENCODING:-${LC_ALL}}
export LANG=${PYPE_ENCODING:--${LANG}}

init() {
    # Initialize virtualenv, i.e., install required packages etc.
	pip3 install pipenv --upgrade
	pipenv install --dev --skip-lock
}

shell() {
    # Initialize virtualenv and open a new shell using it
    init
    pipenv shell
}

clean() {
    # Clean project base by deleting any non-VC files
	git clean -fdx
}

test() {
    # Run all tests in default virtualenv
    pipenv run py.test $@
}

testall() {
    # Run all tests against all virtualenvs defined in tox.ini
    pipenv run detox $@
}

coverage() {
    # Run test coverage checks
    pipenv run py.test -c .coveragerc --verbose tests $@
}

lint() {
    # Run linter / code formatting checks against source code base
    pipenv run flake8 $PROJECT_NAME $@
}

build() {
    # Run setup.py-based build process to package application
    rm -fr build dist .egg *.egg-info
    pipenv run python setup.py bdist_wheel $@
}

publish() {
    sudo -H pip install 'twine>=1.5.0'
    build && twine upload dist/*
}

all() {
    # Full build toolchain
    init && test && lint && coverage && build
}

# -----------------------------------------------------------------------------

coms=$( cat $0 | egrep "\(\) {" |tr "(" " " |awk '{print $1}' |tr "\n" " " )
if [ -z "$1" ]; then
    echo "Select command: $coms"
    exit 1
fi
if [ -z "$( echo $coms | grep $1 )" ]; then
    echo "Unknown command. options: $coms"
    exit 1
fi
command=$1
shift
$command $@
