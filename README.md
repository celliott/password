# password
A repo for a go http password generator

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
