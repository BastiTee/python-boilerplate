.PHONY: docs
init:
	pip3 install pipenv --upgrade
	pipenv install --dev --skip-lock
test:
	pipenv run py.test

flake8:
	pipenv run flake8 acme

coverage:
	# pipenv run py.test --cov-config .coveragerc --verbose --cov-report term --cov-report xml --cov=requests tests

publish:
	# pip install 'twine>=1.5.0'
	# python setup.py sdist bdist_wheel
	# twine upload dist/*
	# rm -fr build dist .egg requests.egg-info

docs:
	# cd docs && make html
	# @echo "\033[95m\n\nBuild successful! View the docs homepage at docs/_build/html/index.html.\n\033[0m"