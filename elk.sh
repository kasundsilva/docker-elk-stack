#!/bin/bash
set -e
arg=$1

if [[ "" == "$1" ]]; then
    sudo sysctl -w vm.max_map_count=262144
    docker-compose -f compose/docker-compose.yml up
elif [[ "$1" == "start" ]]; then
    sudo sysctl -w vm.max_map_count=262144
    docker-compose -f compose/docker-compose.yml up -d
elif [[ "$1" == "stop" ]]; then
    docker-compose -f compose/docker-compose.yml down
elif [[ "$1" == "logs" ]]; then
    docker-compose -f compose/docker-compose.yml logs -f
else
    echo -e
    echo "Usage: elk {COMMAND}"
    echo -e
    echo "Commads:"
    echo "    start        Starts the ELK docker stack."
    echo "    stop         Stops the ELK docker stack."
    echo "    logs         Tail logs for the ELK stack."
    echo -e	
fi

