#!/usr/bin/bash

if [[ $1 = "start" ]];
then
    podman compose -f ./docker-compose-surreal-axum.yml $1;
elif [[ $1 = "stop" ]];
then
    podman compose -f ./docker-compose-surreal-axum.yml $1;
elif [[ $1 = "up" ]];
then
    podman compose -f ./docker-compose-surreal-axum.yml $1 -d;
elif [[ $1 = "down" ]];
then
    podman compose -f ./docker-compose-surreal-axum.yml $1;
else
    echo "qr_dev.sh [COMMAND]";
    echo "COMMAND";
    echo "    up:";
    echo "        Creatine surreal axum docker dev server images then start the server.";
    echo "    down:";
    echo "        Stopping and remove surreal axum form docker dev server containers.";
    echo "    start:";
    echo "        Starting surreal axum docker dev server.";
    echo "    stop:";
    echo "        Stopping surreal axum docker dev server.";
fi