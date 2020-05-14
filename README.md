# hurb
this project is meant to accomplish the [delta challenge](https://github.com/hurbcom/challenge-delta)

### orchestrating
if you do not have minikube installed already, follow [these](https://kubernetes.io/docs/tasks/tools/install-minikube/) instructions to get it running in your machine; my current setup is:
- minikube v1.10.0 
- kubectl (server) v1.18.1

#### helm, ingress, dns
if you dont have helm installed, have a look how to [get it](https://helm.sh/docs/intro/install/)

start the local cluster and enable the following addons
```bash
minikube start
# minikube addons enable ingress
minikube addons enable ingress-dns
minikube addons enable helm-tiller

helm init --wait --upgrade
```
append the following command output in your `/etc/hosts`
```bash
echo $(minikube ip) minikube
```
e.g:
```
127.0.0.1 localhost
192.168.64.2 minikube
```

#### local registry
run the following command to set docker registry context to minikube's VM allowing it to pull the images produced by docker-compose
```bash
eval $(minikube docker-env)
```

#### build
build all artifacts by running:
```bash
docker-compose build
```

#### running at kubernetes
once every image above is successfully built, you might follow [this](https://github.com/devbytom/hurb/tree/master/kubernetes) in order to install the application charts in their wishful namespaces

#### running at docker
since we are running mysql inside a container, I'll just assume its data might be ephemeral as well;
to have mysql listening at port 3306 along with nodejs server at 3000, run:
```bash
docker-compose up
```
