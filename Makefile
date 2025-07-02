all: uv download-galaxy-roles download-galaxy-collections up

.PHONY: uv
uv: ## Sync uv
	@echo "Synchronizing uv ..."
	@uv sync

.PHONY: download-galaxy-roles
download-galaxy-roles: ## Download Ansible roles from galaxy
	@echo "Download ansible galaxy roles ..."
	@uv run ansible-galaxy role install --force -r ./ansible/requirements.yml -p ./ansible/galaxy_roles

.PHONY: download-galaxy-collections
download-galaxy-collections: ## Download Ansible collections
	@echo "Download ansible collections ..."
	@uv run ansible-galaxy collection install --force -r ./ansible/requirements.yml

.PHONY: lint
lint: ## Run ansible-lint
	@echo "Running ansible-lint"
	@uv run ansible-lint

.PHONY: up
up: ## Run vagrant up
	@echo "Running vagrant up..."
	@uv run vagrant up

.PHONY: provision
provision: ## Run vagrant provision
	@echo "Running vagrant provision..."
	@uv run vagrant provision

.PHONY: halt
halt: ## Run vagrant halt
	@echo "Running vagrant halt..."
	@vagrant halt

.PHONY: destroy
destroy: ## Run vagrant destroy
	@echo "Running vagrant destroy..."
	@vagrant destroy -f

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
