include default.mk
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

deploy :
	helm init --client-only
	-kubectl create namespace $(SERVICE)
	helm upgrade -i $(SERVICE) helm/$(SERVICE) \
		--namespace $(SERVICE) \
		--set ingress.hostname=$(SERVICE).$(DOMAIN) \
		--set ingress.enabled=true

delete :
	helm del --purge $(SERVICE)
