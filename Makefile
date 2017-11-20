include .env
export

.PHONY: up

set-pass :
	@if [ -z $(AUTH_PASS) ]; then \
		echo "AUTH_PASS must be set"; exit 10; \
	fi

validate :
	docker-compose config --quiet

build : validate set-pass
	docker-compose build

up : set-pass
	docker-compose up -d

down :
	docker-compose down

tail :
	docker tail -f $(CONTAINER)

shell :
	docker exec -ti $(CONTAINER) /bin/bash

reset : set-pass down up

get-pass :
	@curl http://$(AUTH_USER):$(AUTH_PASS)@127.0.0.1

get-json :
	@curl http://$(AUTH_USER):$(AUTH_PASS)@127.0.0.1/json
