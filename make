#!/bin/bash
cd "$( cd "$( dirname "$0" )"; pwd )"

TARGET_PORT=9690
PROJECT_NAME="acme"
IMAGE_TAG="$PROJECT_NAME/$PROJECT_NAME:latest"

export PIPENV_VERBOSITY=-1  # suppress warning if pipenv is started inside venv
export PYTHONPATH=.

function init {
	pip3 install pipenv --upgrade
	PIPENV_VENV_IN_PROJECT=1 pipenv install --dev --skip-lock
}

function run {
	FLASK_APP=$PROJECT_NAME.api FLASK_DEBUG=1 pipenv run flask run
}

function shell {
    init
    pipenv shell
}

function test {
    pipenv run py.test
}

function lint {
    pipenv run flake8 $PROJECT_NAME
}

function coverage {
    pipenv run py.test -c .coveragerc --verbose tests
}

function build {
    pipenv run python setup.py sdist bdist_wheel
}

function clean {
	rm -fr build dist .egg $PROJECT_NAME.egg-info .pytest_cache
}

function dockerbuild {
    all
    docker build -t "$IMAGE_TAG" . || exit 1
}

function dockerrun {
    dockerbuild
    docker run --rm -it -p $TARGET_PORT:80 --name acme-nginx "$IMAGE_TAG"
}

function commit {
    all
    git commit
}

function all {
    clean
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
$1
