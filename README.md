# password
A container to a http password generator

## Requirements
* [Docker for Mac](https://www.docker.com/docker-mac)

## Usage
* Build and run container

```
$ make build
$ make up
```

* Get password

#### plaintext

```
$ make get-pass
# or
$ curl http://127.0.0.1
HiEN-l0Dz-VQ8b-QdLu
```

#### json

```
$ make get-json
# or
$ curl http://127.0.0.1/json
{
  "password": "HiEN-l0Dz-VQ8b-QdLu"
}
```

### Helm chart
NOTE depends on [nginx-ingress](https://github.com/kubernetes/charts/tree/master/stable/nginx-ingress), [external-dns](https://github.com/kubernetes/charts/tree/master/stable/external-dns), and [kube-lego](https://github.com/kubernetes/charts/tree/master/stable/kube-lego)

#### Deploy

```bash
$ make deploy
```

#### Delete

```bash
$ make delete
```
