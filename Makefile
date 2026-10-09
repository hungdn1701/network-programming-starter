.PHONY: help init up down logs client smoke server-shell clean

help: ## Show available commands
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-18s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

init: ## Create .env from .env.example
	@bash scripts/init.sh

up: ## Build and start the server in the background
	docker compose up --build -d

down: ## Stop and remove containers
	docker compose down

logs: ## Follow logs of running containers
	docker compose logs -f

client: ## Run one interactive client (repeat in other terminals)
	docker compose run --rm client

smoke: ## Check that the server accepts TCP connections
	@bash scripts/smoke-test.sh

server-shell: ## Open a shell inside the running server container
	docker compose exec server sh

clean: ## Remove containers, volumes and built images
	docker compose --profile client down -v --rmi local --remove-orphans
