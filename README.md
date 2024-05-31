# RabbitMQ Cluster Docker

Setup a RabbitMQ Cluster environment on your device using the pure [RabbitMQ](https://hub.docker.com/_/rabbitmq/) official docker image with Docker Compose.

## Features

- Super easy setup, config and expand
- Use a purely official RabbitMQ image
- Support latest version, optimized for Erlang cookie config
- Build-in HAProxy load balancing

## Quick start

```con
docker compose up
```

Open <http://localhost:15672> to login RabbitMQ dashboard.

> Username: `guest`  
> Password: `guest`

## Configuration

### `docker-compose.yml`

Docker [compose](https://docs.docker.com/compose/compose-file/) config file, including 5 RabbitMQ service cluster and a HAProxy.

| Service     | Description               |
| ----------- | ------------------------- |
| `rabbitmq1` | RabbitMQ (cluster)        |
| `rabbitmq2` | RabbitMQ (cluster member) |
| `rabbitmq3` | RabbitMQ (cluster member) |
| `rabbitmq4` | RabbitMQ (cluster member) |
| `rabbitmq5` | RabbitMQ (cluster member) |
| `haproxy`   | Load Balancer             |

#### Default expose ports

| Host              | Description                                         |
| ----------------- | --------------------------------------------------- |
| `localhost:5672`  | AMQP 0-9-1 and AMQP 1.0 clients                     |
| `localhost:15672` | HTTP API clients, management UI and `rabbitmqadmin` |
| `localhost:1936`  | HAProxy statistics |

### `.env`

| Name                     | Default |
| ------------------------ | ------- |
| `RABBITMQ_DEFAULT_USER`  | guest   |
| `RABBITMQ_DEFAULT_PASS`  | guest   |
| `RABBITMQ_ERLANG_COOKIE` | 12345   |

### `.erlang.cookie`

Put your custom [Erlang Cookie](https://www.rabbitmq.com/clustering.html#erlang-cookie) value in the `RABBITMQ_ERLANG_COOKIE` environment variable file (`.env`).

### `haproxy.cfg`

Load balancer [HA Proxy](http://www.haproxy.org/) config. Including the load balancing config and the hostnames of the nodes in cluster.

## References

- [docker-rabbitmq-cluster](https://github.com/pardahlman/docker-rabbitmq-cluster)
- [rabbitmq-cluster](https://github.com/JohnnyVicious/rabbitmq-cluster)

## LICENSE

MIT
