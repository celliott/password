include .env

export

validate :
	docker-compose config --quiet

build : validate
	docker-compose build

push :
	docker-compose push

up :
	docker-compose up -d

down :
	docker-compose down

tail :
	docker tail -f $(CONTAINER)

shell :
	docker exec -ti $(CONTAINER) /bin/bash

reset : set-pass down up

get-pass :
	curl http://$(AUTH_USER):$(AUTH_PASS)@127.0.0.1

get-json :
	curl http://$(AUTH_USER):$(AUTH_PASS)@127.0.0.1/json
