APPLICATION_MODULE=pclean
TEST_MODULE=$(APPLICATION_MODULE)_tests

# @see http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.DEFAULT_GOAL := help
.PHONY: help
help: ## provides cli help for this makefile (default)
	@grep -E '^[a-zA-Z_0-9-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: dist
dist:
	. venv3/bin/activate; python setup.py sdist

.PHONY: tests
tests: ## run automatic tests
	. venv3/bin/activate; python -u -m unittest discover "$(TEST_MODULE)"

.PHONY: lint
lint: ## run pylint
	. venv3/bin/activate; pylint --rcfile=.rcfile $(APPLICATION_MODULE)

.PHONY: coverage
coverage: coverage_run coverage_report # run the code coverage

coverage_run :
	. venv/bin/activate; coverage run --omit test_*.py,**/test_*.py,**/__init__.py,/usr/local/lib/python2.7/** -m unittest discover $(TEST_MODULE)

coverage_report:
	. venv/bin/activate; coverage report

.PHONY: clean
clean :
	rm -rf dist
	rm -rf venv3
	rm -f .coverage
	rm -rf *.egg-info
	rm -f MANIFEST
	find -name __pycache__ -print0 | xargs -0 rm -rf

.PHONY: freeze
freeze: ## freeze the dependencies version in requirements.txt
	. venv3/bin/activate; pip freeze | grep -v "$(APPLICATION_MODULE)" > requirements.txt

.PHONY: update_requirements
update_requirements: ## update the project dependencies based on setup.py declaration
	rm -rf venv3
	$(MAKE) venv3
	. venv3/bin/activate; pip install .
	$(MAKE) freeze

.PHONY: install_requirements_dev
install_requirements_dev: venv3 ## install pip requirements for development
	. venv3/bin/activate; pip install -r requirements.txt
	. venv3/bin/activate; pip install -r requirements_dev.txt

.PHONY: install_requirements
install_requirements: ## install pip requirements based on requirements.txt
	. venv3/bin/activate; pip install -r requirements.txt

.PHONY: venv3
venv3: ## build a virtual env for python 3 in ./venv3
	virtualenv venv3 -p python3
	@echo "\"source venv3/bin/activate\" to activate the virtual env"
