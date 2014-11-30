## Boot The App

From the root of the repository:

```shell
fig pull && fig build
fig up -d
```

## Inspection
### Consul Registered Services

```shell
curl http://`boot2docker ip 2>/dev/null`:8500/v1/catalog/services
```

## Adding/Removing Backend Containers

```shell
fig scale app=4
fig scale app=1
```
