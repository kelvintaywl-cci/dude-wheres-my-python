# KW Data Lake - Deep Blue - project automation commands

.PHONY: help setup clean test run-ci-tests setup-orc clean-orc test-orc run-ci-tests-orc

venv/bin/activate:
	python3 -m venv venv

setup: venv/bin/activate
	@echo "# Env setup started."
	. venv/bin/activate; pip install --upgrade pip==21.0.1
	. venv/bin/activate; pip install --editable ./data-pipelines"[dev]"
	. venv/bin/activate; pip install --editable ."[dev,test]"
	. venv/bin/activate; pre-commit install
	@echo "# Env setup complete."

clean:
	@echo "# Env clean up started."
	@rm -rf venv/
	@echo "# Env clean up complete."

# Orchestration
venv_orc/bin/activate:
	python3 -m venv venv_orc

setup-orc: venv_orc/bin/activate
	@echo "# Orchestration env setup started."
	. venv_orc/bin/activate; pip install --upgrade pip && \
	. venv_orc/bin/activate; pip install -r orchestration/requirements.txt && \
	. venv_orc/bin/activate; pip install -r orchestration/test-requirements.txt
	@echo "# Env setup complete."

clean-orc:
	@echo "# Orchestration env clean up started."
	@rm -rf venv_orc/
	@echo "# Orchestration env clean up complete."
