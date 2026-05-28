COMPOSE = docker compose
CONSOLE = $(COMPOSE) exec minecraft rcon-cli

.PHONY: up down stop start restart logs console whitelist-add

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

stop:
	$(COMPOSE) stop

start:
	$(COMPOSE) start

restart:
	$(COMPOSE) restart

logs:
	$(COMPOSE) logs -f minecraft

console:
	$(CONSOLE)

test-console:
	$(COMPOSE) exec minecraft-test rcon-cli

# uso: make whitelist-add NICK=fulano
whitelist-add:
	$(CONSOLE) whitelist add $(NICK)

whitelist-remove:
	$(CONSOLE) whitelist remove $(NICK)

whitelist-list:
	$(CONSOLE) whitelist list

# uso: make op NICK=fulano
op:
	$(CONSOLE) op $(NICK)

test-regen-world:
	$(COMPOSE) stop minecraft-test
	rm -rf data-test/world
	$(COMPOSE) up -d minecraft-test
