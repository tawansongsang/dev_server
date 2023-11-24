#!/usr/bin/bash

if [[ $1 = "start" ]];
then
    docker-compose -f ./docker-compose-vue3-form.yml $1;
elif [[ $1 = "stop" ]];
then
    docker-compose -f ./docker-compose-vue3-form.yml $1;
elif [[ $1 = "up" ]];
then
    docker-compose -f ./docker-compose-vue3-form.yml $1 -d;
elif [[ $1 = "down" ]];
then
    docker-compose -f ./docker-compose-vue3-form.yml $1;
else
    echo "qr_dev.sh [COMMAND]";
    echo "COMMAND";
    echo "    up:";
    echo "        Creatine qr docker dev server images then start the server.";
    echo "    down:";
    echo "        Stopping and remove vue3 form docker dev server containers.";
    echo "    start:";
    echo "        Starting qr docker dev server.";
    echo "    stop:";
    echo "        Stopping rq docker dev server.";
fi