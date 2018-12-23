.PHONY: init
init:
	pip3 install pipenv --upgrade
	PIPENV_VENV_IN_PROJECT=1 pipenv install --dev --skip-lock

run:
	FLASK_APP=acme FLASK_DEBUG=1 pipenv run flask run

shell: init
	pipenv shell

test:
	pipenv run py.test

flake8:
	pipenv run flake8 acme

coverage:
	pipenv run py.test -c .coveragerc --verbose tests

publish:
	pipenv run python setup.py sdist bdist_wheel
	# publish somewhere... 
	rm -fr build dist .egg acme.egg-info
