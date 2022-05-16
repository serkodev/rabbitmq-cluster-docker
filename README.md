# RabbitMQ Cluster Docker

Setup a RabbitMQ Cluster environment on your device using the pure [RabbitMQ](https://hub.docker.com/_/rabbitmq/) official docker image with Docker Compose.

## Features

- Super easy setup, config and expand
- Use a purely official RabbitMQ image
- Support latest version, optimized for Erlang cookie config
- Build-in HAProxy load balancing

## Quick start

```
docker compose up
```

Open http://localhost:15672 to login RabbitMQ dashboard.

> Username: `guest`  
> Password: `guest`

## Configuration

### `docker-compose.yml`

Docker [compose](https://docs.docker.com/compose/compose-file/) config file, including 3 RabbitMQ service cluster and a HAProxy.

| Service     | Description               |
| ----------- | ------------------------- |
| `rabbitmq1` | RabbitMQ (cluster)        |
| `rabbitmq2` | RabbitMQ (cluster member) |
| `rabbitmq3` | RabbitMQ (cluster member) |
| `haproxy`   | Load Balancer             |

#### Default expose ports

| Host              | Description                                         |
| ----------------- | --------------------------------------------------- |
| `localhost:5672`  | AMQP 0-9-1 and AMQP 1.0 clients                     |
| `localhost:15672` | HTTP API clients, management UI and `rabbitmqadmin` |

### `.env`

| Name                     | Default |
| ------------------------ | ------- |
| `RABBITMQ_DEFAULT_USER`  | guest   |
| `RABBITMQ_DEFAULT_PASS`  | guest   |
| `RABBITMQ_DEFAULT_VHOST` | /       |

### `.erlang.cookie`

Put your custom [Erlang Cookie](https://www.rabbitmq.com/clustering.html#erlang-cookie) inside this file (default: `12345`) for the nodes in cluster communicate with each other.

### `haproxy.cfg`

Load balancer [HA Proxy](http://www.haproxy.org/) config. Including the load balancing config and the hostnames of the nodes in cluster.

## References

- [docker-rabbitmq-cluster](https://github.com/pardahlman/docker-rabbitmq-cluster)
- [rabbitmq-cluster](https://github.com/JohnnyVicious/rabbitmq-cluster)

## LICENSE

MIT
