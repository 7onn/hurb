default: help

help:
	@echo 
	@echo "available commands"
	@echo "  - minikube-start"
	@echo "  - minikube-stop"
	@echo "  - minikube-addons-enabled"
	@echo "  - minikube-addons-disabled"
	@echo "  - artifacts"
	@echo "  - run"
	@echo "  - stop"
	@echo "  - list-packages"
	@echo "  - add-package [text=]"
	@echo "  - rm-package [id=]"
	@echo
	@echo "  - print-logs (print stdout and stderr from ingress container)"
	@echo

minikube-start:
	@minikube start
	@kubectl config use-context minikube

minikube-stop:
	@minikube stop

PHONY: minikube-addons-enabled
minikube-addons-enabled: minikube-addons-disabled
	@minikube addons enable ingress-dns
	@minikube addons enable helm-tiller
	@helm init --wait --upgrade

minikube-addons-disabled:
	@minikube addons disable ingress-dns
	@minikube addons disable helm-tiller

artifacts:
	@docker-compose build --no-cache

run:
	@docker-compose up -d
	@sleep 10
	@docker ps

stop:
	@docker-compose down
	@docker ps

list-packages:
	@curl -L localhost/packages

add-package:
ifdef text
	@curl -L -X POST localhost/packages -d $(text)
else
	@echo 'parameter text is not defined'
	@echo 'e.g: make add-package text=DESCRIPTION'
endif

rm-package:
ifdef id
	@curl -L -X DELETE localhost/packages/$(id)
else
	@echo 'parameter id not defined'
	@echo 'e.g: make rm-package id=ID'
endif

print-logs:
	@docker logs $(shell docker ps | grep package-ingress | awk '{print $$1}')
