# kubernetes
this directory contains essential schema and values files to run every service expected by [delta challenge](https://github.com/hurbcom/challenge-delta)


## TL;DR;
```bash
make add-production
# make rm-production
```

#### namespace
first we need somewhere to install our charts in minikube 
```bash
make
make add-namespace
#make rm-namespace
#"sudo rm -rf /" equivalent commented above
```

#### database
then setup mysql internal service (this is not available from outside the cluster context)
```bash
make add-database
#make rm-database
```

#### server
once database container is healthy, install server charts (also intangible for outside requesters)
```bash
make add-server
# make rm-server
```

#### ingress
now the nginx service to handle and forward requests to server
```bash
make add-ingress
#make rm-ingress
```
