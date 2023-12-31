#!/usr/bin/bash

if [[ $1 = "start" ]];
then
    podman compose -f ./docker-compose-qr.yml $1
    # docker compose -f ./docker-compose-qr.yml $1 qr_rust;
    # docker compose -f ./docker-compose-qr.yml $1 qr_rust qr_db;
    # docker compose -f ./docker-compose-qr.yml $1 qr_react;
elif [[ $1 = "stop" ]];
then
    podman compose -f ./docker-compose-qr.yml $1;
elif [[ $1 = "up" ]];
then
    podman compose -f ./docker-compose-qr.yml $1 -d;
    # docker compose -f ./docker-compose-qr.yml $1 qr_rust;
    # docker compose -f ./docker-compose-qr.yml $1 -d qr_rust qr_db;
    # docker compose -f ./docker-compose-qr.yml $1 qr_react;
elif [[ $1 = "down" ]];
then
    podman compose -f ./docker-compose-qr.yml $1;
else
    echo "qr_dev.sh [COMMAND]";
    echo "COMMAND";
    echo "    up:";
    echo "        Creatine qr docker dev server images then start the server.";
    echo "    down:";
    echo "        Stopping and remove qr docker dev server containers.";
    echo "    start:";
    echo "        Starting qr docker dev server.";
    echo "    stop:";
    echo "        Stopping qr docker dev server.";
fi