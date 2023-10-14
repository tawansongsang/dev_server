#!/bin/sh

if [[ $1 = "start" ]];
then
    # docker compose -f ./docker-compose-qr.yml $1
    docker compose -f ./docker-compose-qr.yml $1 qr_rust;
    # docker compose -f ./docker-compose-qr.yml $1 vue3
elif [[ $1 = "stop" ]];
then
    docker compose -f ./docker-compose-qr.yml $1;
else
    echo "qr_dev.sh [COMMAND]";
    echo "COMMAND";
    echo "    start:";
    echo "        Starting qr docker dev server";
    echo "    stop:";
    echo "        Stopping rq docker dev server";
fi