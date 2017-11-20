# passgen-go
A repo for a http GO password generator

# Next Steps
* Add letsencrypt support

## Requirements
* [Docker for Mac](https://www.docker.com/docker-mac)

## Usage
* Update AUTH_USER and AUTH_PASS in .env
* Build and run container

```
$ export AUTH_PASS=<auth_pass>
$ make build
$ make up
```

* Get password

#### plaintext

```
$ make get-pass
# or
$ curl http://admin:$AUTH_PASS@127.0.0.1
HiEN-l0Dz-VQ8b-QdLu
```

#### json

```
$ make get-json
# or
$ curl http://admin:$AUTH_PASS@127.0.0.1/json
{
  "password": "HiEN-l0Dz-VQ8b-QdLu"
}
```
