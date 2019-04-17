SHELL := /bin/bash

.PHONY: help

.DEFAULT_GOAL := help

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z\._-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

run: ## Run ansible-playbook to specified ips in the default file
	echo $(ips) > inventories/.temp
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventories/.temp site.yml --vault-password-file ../.vault-password -u root
	rm -v inventories/.temp