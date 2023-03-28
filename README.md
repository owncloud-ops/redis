# redis

[![Build Status](https://drone.owncloud.com/api/badges/owncloud-ops/redis/status.svg)](https://drone.owncloud.com/owncloud-ops/redis/)
[![Docker Hub](https://img.shields.io/badge/docker-latest-blue.svg?logo=docker&logoColor=white)](https://hub.docker.com/r/owncloudops/redis)
[![Quay.io](https://img.shields.io/badge/quay-latest-blue.svg?logo=docker&logoColor=white)](https://quay.io/repository/owncloudops/redis)

Custom container image for [Redis](https://redis.io/docs/) DB.

## Ports

- 6379

## Volumes

- /data

## Environment Variables

```Shell
REDIS_TCP_BACKLOG=511
REDIS_TCP_KEEPALIVE=300

REDIS_TIMEOUT=0
REDIS_LOG_LEVEL=notice

REDIS_DATABASES=16
REDIS_MAX_CLIENTS=10000
REDIS_NOTIFY_KEYSPACE_EVENTS=Elg
```

## Build

You could use the `BUILD_VERSION` to specify the target version.

```Shell
docker build -f Dockerfile -t redis:latest .
```

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](https://github.com/owncloud-ops/redis/blob/main/LICENSE) file for details.
