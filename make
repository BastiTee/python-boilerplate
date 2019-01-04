#!/bin/sh
cd "$( cd "$( dirname "$0" )"; pwd )"

TARGET_PORT=9690
PROJECT_NAME="my_module"
IMAGE_TAG="$PROJECT_NAME/$PROJECT_NAME:latest"

export PIPENV_VERBOSITY=-1  # suppress warning if pipenv is started inside venv
export PYTHONPATH=.  # include source code in any python subprocess
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

init() {
    # Initialize virtualenv, i.e., install required packages etc.
    if [ -z "$( command -v pip3 )" ]; then
        echo "Install python and pip first. See README.md for details."
        exit 1
    fi 
	pip3 install pipenv --upgrade
	PIPENV_VENV_IN_PROJECT=1 pipenv install --dev --skip-lock
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

run() {
    # Run application / flask development server
	FLASK_APP=$PROJECT_NAME FLASK_DEBUG=1 pipenv run \
    flask run --host 0.0.0.0 --port $TARGET_PORT $@
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

dockerbuild() {
    # Run full build toolchain and create a docker image for publishing
    all && docker build -t "$IMAGE_TAG" . || exit 1
}

dockerrun() {
    # Run docker build process and run a new container using the latest image
    dockerbuild && \
    docker run --rm -it -p $TARGET_PORT:80 --name my_module-nginx "$IMAGE_TAG"
}

installmint() {
    # Simulate full build chain of project running on a fresh Ubuntu copy
    cp .gitignore .dockerignore
    echo ".git" >> .dockerignore
    docker build -t "python3-boilerplate-mint" -f - . << EOF
FROM nginx:stable-alpine
RUN apk update && apk add alpine-sdk linux-headers python3 python3-dev
COPY . /src/
WORKDIR /src
RUN /src/make all
EOF
    docker rmi "python3-boilerplate-mint" 2> /dev/null
}

commit() {
    # Run full build toolchain before executing a git commit
    all && git commit
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
