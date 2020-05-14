default: help

help:
	@echo 
	@echo "available commands"
	@echo "  - add-namespaces"
	@echo "  - rm-namespaces"
	@echo "  - add-database"
	@echo "  - rm-database"
	@echo "  - add-server"
	@echo "  - rm-server"
	@echo "  - add-ingress (i.e: reverse proxy)" 
	@echo "  - rm-ingress (i.e: reverse proxy)"
	@echo

add-namespaces:
	@kubectl create ns production

rm-namespaces:
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
