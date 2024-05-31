#!/bin/bash

set -e

# Get hostname from enviromant variable
HOSTNAME=`env hostname`
echo "Starting RabbitMQ Server For host: " $HOSTNAME
/usr/local/bin/docker-entrypoint.sh rabbitmq-server &
sleep 5
rabbitmqctl wait /var/lib/rabbitmq/mnesia/rabbit\@$HOSTNAME.pid

if [ -n "$JOIN_CLUSTER_HOST" ]; then
    echo "Starting RabbitMQ Server For host: " $HOSTNAME
    rabbitmqctl wait /var/lib/rabbitmq/mnesia/rabbit\@$HOSTNAME.pid
    rabbitmqctl stop_app
    rabbitmqctl join_cluster rabbit@$JOIN_CLUSTER_HOST
    rabbitmqctl start_app
fi

# Keep foreground process active ...
sleep infinity