#!/usr/bin/bash

if [[ $1 = "start" ]];
then
    podman compose -f ./docker-compose-zero2prod.yml $1;
elif [[ $1 = "stop" ]];
then
    podman compose -f ./docker-compose-zero2prod.yml $1;
elif [[ $1 = "up" ]];
then
    podman compose -f ./docker-compose-zero2prod.yml $1 -d;
elif [[ $1 = "down" ]];
then
    podman compose -f ./docker-compose-zero2prod.yml $1;
else
    echo "qr_dev.sh [COMMAND]";
    echo "COMMAND";
    echo "    up:";
    echo "        Creatine qr docker dev server images then start the server.";
    echo "    down:";
    echo "        Stopping and remove zero2prod docker dev server containers.";
    echo "    start:";
    echo "        Starting qr docker dev server.";
    echo "    stop:";
    echo "        Stopping rq docker dev server.";
fi