# kubernetes

#### namespace
to firstly setup the cluster, run:
```bash
make
make add-namespace
#make rm-namespace
#"sudo rm -rf /" equivalent commented above
```

#### database
then install the database charts
```bash
make add-database
#make rm-database
```

#### server
once database container is healthy, install server charts
```bash
make add-server
# make rm-server
```

#### ingress
now the nginx service to handle and forward requests to server
```bash
make add-yxorp
#make rm-yxorp
```
