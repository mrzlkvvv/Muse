.PHONY: up-dev up-prod down-dev down-prod

COMPOSE      := docker compose -p muse

COMPOSE_BASE := -f ./deploy/compose.yml

DEV_FLAGS    := $(COMPOSE_BASE) -f ./deploy/compose.dev.yml
PROD_FLAGS   := $(COMPOSE_BASE)

up-dev:
	$(COMPOSE) $(DEV_FLAGS) up --build -d
	$(COMPOSE) $(DEV_FLAGS) logs -f backend

up-prod:
	$(COMPOSE) $(PROD_FLAGS) up --build -d

down-dev:
	$(COMPOSE) $(DEV_FLAGS) down --remove-orphans

down-prod:
	$(COMPOSE) $(PROD_FLAGS) down --remove-orphans
