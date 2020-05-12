## kubernetes
I am personally using [Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/) (with kubernetes enabled), but there are several ways of starting a minimal kubernetes cluster locally (e.g: [minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/))


to firstly setup the cluster:
```
$ helm init --wait --upgrade
$ kubectl create ns development && \
  kubectl create ns staging && \
  kubectl create ns production

```

to install charts
```
$ helm upgrade -i package-database-pr-1 \
  --namespace development \
  --values ./values/package-database/development.yaml \
  ./charts/package-database

$ helm upgrade -i package-database-staging \
  --namespace staging \
  --values ./values/package-database/staging.yaml \
  ./charts/package-database

$ helm upgrade -i package-database-production \
  --namespace production \
  --values ./values/package-database/production.yaml \
  ./charts/package-database
```

to remove charts
```
$ helm del --purge package-database-pr-1
$ helm del --purge package-database-staging
$ helm del --purge package-database-production
```
