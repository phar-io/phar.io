# Local Development

You can use Docker as alternative for the locally installed tools. 
There is a [Dockerfile](Dockerfile) provided for the calling of shell scripts.

**Pre conditions:**
- Docker should be installed.
- You familiar and can to call shell scripts.

First of all, you have to build container locally.

```shell
docker build -t phario:local .
```

The next step. Run container.

```shell
docker run -ti phario:local bash
```

## Updating of Repositories List

1. Provide an alias of your project when it's composer name don't match pattern `<user-name-on-github>/<repository-name>`.
   Add it into file of [repository](data/repositories.xml). 
2. It should be added it alphabetical order. So, you can just add it in any place 
   and then call [script](scripts/order-repos/order) which order repositories for you.
