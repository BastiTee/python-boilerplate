#!/bin/bash
cd "$( cd "$( dirname "$0" )"; pwd )"

TARGET_PORT=9690
PROJECT_NAME="acme"
IMAGE_TAG="$PROJECT_NAME/$PROJECT_NAME:latest"

export PIPENV_VERBOSITY=-1  # suppress warning if pipenv is started inside venv
export PYTHONPATH=.

function init {
    # Initialize virtualenv, i.e., install required packages etc.
	pip3 install pipenv --upgrade
	PIPENV_VENV_IN_PROJECT=1 pipenv install --dev --skip-lock
}

function shell {
    # Initialize virtualenv and open a new shell using it
    init
    pipenv shell
}

function clean {
    # Clean project base by deleting any non-VC files
	git clean -fdx
}

function run {
    # Run application / flask development server
	FLASK_APP=$PROJECT_NAME FLASK_DEBUG=1 pipenv run \
    flask run --host 0.0.0.0 --port $TARGET_PORT $@
}

function test {
    # Run all tests in default virtualenv
    pipenv run py.test $@
}

function testall {
    # Run all tests against all virtualenvs defined in tox.ini
    pipenv run detox $@
}

function coverage {
    # Run test coverage checks
    pipenv run py.test -c .coveragerc --verbose tests $@
}
function lint {
    # Run linter / code formatting checks against source code base
    pipenv run flake8 $PROJECT_NAME $@
}

function build {
    # Run setup.py-based build process to package application
    rm -fr build dist .egg *.egg-info
    pipenv run python setup.py bdist_wheel $@
}

function publish {
    build
    sudo -H pip install 'twine>=1.5.0'
	twine upload dist/*
}

function dockerbuild {
    # Run full build toolchain and create a docker image for publishing
    all
    docker build -t "$IMAGE_TAG" . || exit 1
}

function dockerrun {
    # Run docker build process and run a new container using the latest image
    dockerbuild
    docker run --rm -it -p $TARGET_PORT:80 --name acme-nginx "$IMAGE_TAG"
}

function commit {
    # Run full build toolchain before executing a git commit
    all
    git commit
}

function all {
    # Full build toolchain
    init
    test
    lint
    coverage
    build
}

# -----------------------------------------------------------------------------

coms=$( cat $0 | egrep "^function" | awk '{print $2}' | tr "\n" " " )
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
