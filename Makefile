# Define variables
DOCKER_COMPOSE = docker-compose
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

# Default target
.PHONY: all
all: build up

# Build the Docker images
.PHONY: build
build:
	@echo "Building Docker images..."
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build

# Start the containers
.PHONY: up
up:
	@echo "Starting containers..."
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d

# Stop and remove containers, networks, and volumes
.PHONY: down
down:
	@echo "Stopping and removing containers..."
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

# View logs of the services
.PHONY: logs
logs:
	@echo "Viewing logs..."
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) logs -f

# Clean up unused images and volumes
.PHONY: clean
clean:
	@echo "Cleaning up unused images and volumes..."
	docker system prune -f
	docker volume prune -f

# Restart the containers
.PHONY: restart
restart: down up

# Show help
.PHONY: help
help:
	@echo "Makefile commands:"
	@echo "  make all       - Build and start the containers"
	@echo "  make build     - Build the Docker images"
	@echo "  make up        - Start the containers"
	@echo "  make down      - Stop and remove containers"
	@echo "  make logs      - View logs of the services"
	@echo "  make clean     - Clean up unused images and volumes"
	@echo "  make restart   - Restart the containers"
	@echo "  make help      - Show this help message"
