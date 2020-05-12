# hurb
this project is meant to accomplish this [challenge](https://github.com/hurbcom/challenge-delta)

### docker composing
##### database
since we are running mysql inside a container, I'll just assume its data might be ephemeral as well;
have it listening at port 3306 by running:

```
$ docker-compose build database
$ docker-compose up database

```

### kubernetes
once every image above is successfully built, you might follow [this](https://github.com/devbytom/hurb/tree/master/kubernetes)
