# hurb
this project is meant to accomplish the [delta challenge](https://github.com/hurbcom/challenge-delta)

#### my setup
- [docker](https://www.docker.com/get-started) 19.03.5 (633a0ea)
- [docker-compose](https://docs.docker.com/compose/install/) 1.25.4 (8d51620a)
- [minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/) v1.10.0 
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) (server) v1.18.1
- [helm](https://helm.sh/docs/intro/install/) v2.16.7

## get started
are you going to run the application with [minikube](#minikube) or [docker-compose](#docker-compose)?
either way, check the helper:
```bash
make
```

### docker-compose
```bash
make artifacts
make run
# make stop
make list-packages
make add-package text=myfirstpackage
#make rm-package id=1
```

### minikube
```bash
make minikube-start
make minikube-addons-enabled
make artifacts
```

append the following command's output in your `/etc/hosts`
```bash
echo $(minikube ip) minikube
```
e.g:
```
127.0.0.1 localhost
192.168.64.2 minikube
```

once every artifact is successfully built and the minikube is identified as a HOST in your computer, you might follow [this](https://github.com/devbytom/hurb/tree/master/kubernetes) in order to install the application charts
```bash
cd ./kubernetes
```
