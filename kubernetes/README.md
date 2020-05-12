# kubernetes

#### namespaces
to firstly setup the cluster, run:
```bash
kubectl create ns development && \
  kubectl create ns staging && \
  kubectl create ns production
```

#### databases
then install the database charts
```bash
helm upgrade -i package-database-staging \
  --namespace staging \
  --values ./values/package-database/staging.yaml \
  ./charts/package-database

helm upgrade -i package-database-production \
  --namespace production \
  --values ./values/package-database/production.yaml \
  ./charts/package-database
```

if you need to remove these, run:
```bash
helm del --purge package-database-staging
helm del --purge package-database-production
```

#### servers
once database container is healthy, install server charts
```bash
helm upgrade -i package-server-staging \
  --namespace staging \
  --values ./values/package-server/staging.yaml \
  ./charts/package-server

helm upgrade -i package-server-production \
  --namespace production \
  --values ./values/package-server/production.yaml \
  ./charts/package-server
```

if you need to remove these, run:
```bash
helm del --purge package-server-staging
helm del --purge package-server-production
```
