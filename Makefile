SHELL := /bin/bash

.PHONY: help

.DEFAULT_GOAL := help

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z\._-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

run: ## Run the playbook
	ansible-galaxy install -r requirements.yml
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventories/development site.yml --vault-password-file=../.vault-password -u root