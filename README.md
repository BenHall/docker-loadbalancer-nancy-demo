## Boot The App

From the root of the repository:

```shell
docker-compose pull && docker-compose build
docker-compose up -d
```

## Inspection
### Consul Registered Services

```shell
curl http://`boot2docker ip 2>/dev/null`:8500/v1/catalog/services
```

## Adding/Removing Backend Containers

```shell
docker-compose scale app=4
docker-compose scale app=1
```

## Test

Curl LB /machine end-point
