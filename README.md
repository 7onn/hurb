# hurb
this project is meant to accomplish the [delta challenge](https://github.com/hurbcom/challenge-delta)

### orchestrating
- [minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/) v1.10.0 
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) (server) v1.18.1
- [helm](https://helm.sh/docs/intro/install/)  v2.14.2

### get started
```bash
make
make minikube-start
make minikube-addons-enabled
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

#### build
run the following command to get all project images ready to be used at your registry
```bash
make artifacts-build
```

#### running at docker-compose
```bash
make run
make list-packages
make add-package text=myfirstpackage
#make rm-package id=1
```

#### running at kubernetes
once every image artifact is successfully built, you might follow [this](https://github.com/devbytom/hurb/tree/master/kubernetes) in order to install the application charts
