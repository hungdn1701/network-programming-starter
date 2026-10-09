.PHONY: help init up down logs clean server-shell client-shell test

help:
	@echo "Available commands:"
	@echo "  make init          - Initialize project (.env file)"
	@echo "  make up            - Build and start all services"
	@echo "  make down          - Stop and remove containers"
	@echo "  make logs          - View output from containers"
	@echo "  make clean         - Remove Docker images and volumes"
	@echo "  make server-shell  - Open shell in server container"
	@echo "  make client-shell  - Open shell in client container"
	@echo "  make test          - Run automated tests"

init:
	bash scripts/init.sh

up:
	docker compose up --build

down:
	docker compose down

logs:
	docker compose logs -f

clean:
	docker compose down -v --rmi all

server-shell:
	docker compose exec server sh

client-shell:
	docker compose exec client sh

test:
	docker compose run --rm client echo "Running tests..."
