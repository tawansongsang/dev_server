#!/usr/bin/bash
if [[ $1 = "start" ]];
then
    docker-compose -f ./docker-compose-notion-next.yml $1;
elif [[ $1 = "stop" ]];
then
    docker-compose -f ./docker-compose-notion-next.yml $1;
elif [[ $1 = "up" ]];
then
    docker-compose -f ./docker-compose-notion-next.yml $1 -d;
elif [[ $1 = "down" ]];
then
    docker-compose -f ./docker-compose-notion-next.yml $1;
else
    echo "qr_dev.sh [COMMAND]";
    echo "COMMAND";
    echo "    up:";
    echo "        Creatine notion next docker dev server images then start the server.";
    echo "    down:";
    echo "        Stopping and remove notion next form docker dev server containers.";
    echo "    start:";
    echo "        Starting notion next docker dev server.";
    echo "    stop:";
    echo "        Stopping notion next docker dev server.";
fi