default: help

help:
	@echo 
	@echo "available commands"
	@echo "  - add-namespace"
	@echo "  - rm-namespace"
	@echo "  - add-database"
	@echo "  - rm-database"
	@echo "  - add-server"
	@echo "  - rm-server"
	@echo "  - add-ingress (i.e: reverse proxy)" 
	@echo "  - rm-ingress (i.e: reverse proxy)"
	@echo
	@echo "  - add-production (i.e: install namespace and charts)"
	@echo "  - rm-production (i.e: remove production namespace and it's content)"
	@echo
	@echo "  - list-packages"
	@echo "  - add-package [text=]"
	@echo "  - rm-package [id=]"
	@echo
	@echo "note: you might use add scripts to update charts here"

add-namespace:
	@kubectl create ns production

rm-namespace:
	@kubectl delete ns production

add-database:
	@helm upgrade -i package-database-production \
		--namespace production \
		--values ./values/package-database/production.yaml \
		./charts/package-database

rm-database:
	@helm del --purge package-database-production

add-server:
	@helm upgrade -i package-server-production \
		--namespace production \
		--values ./values/package-server/production.yaml \
		./charts/package-server

rm-server:
	@helm del --purge package-server-production

add-ingress:
	@helm upgrade -i package-ingress-production \
		--namespace production \
		--values ./values/package-ingress/production.yaml \
		./charts/package-ingress

rm-ingress:
	@helm del --purge package-ingress-production

.PHONY: add-production
add-production: add-namespace add-database add-server add-ingress

.PHONY: rm-production
rm-production: rm-ingress rm-server rm-database rm-namespace

print-logs:
	@kubectl -n production logs

list-packages:
	@curl -L minikube:32080/packages

add-package:
ifdef text
	@curl -L -X POST minikube:32080/packages -d $(text)
else
	@echo 'parameter text is not defined'
	@echo 'e.g: make add-package text=DESCRIPTION'
endif

rm-package:
ifdef id
	@curl -L -X DELETE minikube:32080/packages/$(id)
else
	@echo 'parameter id not defined'
	@echo 'e.g: make rm-package id=ID'
endif
