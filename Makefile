#!make
.SILENT:
.DEFAULT_GOAL:= help

COLOR_DEFAULT=\033[0m
COLOR_RED=\033[31m
COLOR_GREEN=\033[32m
COLOR_YELLOW=\033[33m
CONTAINER_NAME=php-fpm

ifneq ($(shell docker compose version 2>/dev/null),)
  DOCKER_COMPOSE=docker compose
else
  DOCKER_COMPOSE=docker-compose
endif

.PHONY: help
help: ## Shows the help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' | awk 'BEGIN {FS = ":"}; {printf "$(COLOR_YELLOW)%s:$(COLOR_DEFAULT)%s\n\n", $$1, $$2}'

###---------------------------------------------------------------------------------------------

.PHONY: down
down: ##Stop
	$(DOCKER_COMPOSE) down --remove-orphans

.PHONY: join
join: ##Join to php container
	$(DOCKER_COMPOSE) exec $(CONTAINER_NAME) bash

.PHONY: up
up: ##Start
	$(DOCKER_COMPOSE) up -d
