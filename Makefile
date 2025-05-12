# Variables
COMPOSE=docker-compose
PROFILE_ARG=--profile

# Commands
create:
	UID=$$(id -u) GID=$$(id -g) $(COMPOSE) $(PROFILE_ARG) create up --build

dev:
	$(COMPOSE) $(PROFILE_ARG) dev up --build

prod:
	$(COMPOSE) $(PROFILE_ARG) build up --build

stop:
	$(COMPOSE) down

clean:
	$(COMPOSE) down --volumes --remove-orphans
	rm -rf node_modules package-lock.json

logs:
	$(COMPOSE) logs -f

rebuild:
	$(COMPOSE) down --volumes --remove-orphans
	$(COMPOSE) up --build

install:
	docker compose --profile dev exec react-app-dev npm install $(pkg)

install-dev:
	docker compose --profile dev exec react-app-dev npm install --save-dev $(pkg)