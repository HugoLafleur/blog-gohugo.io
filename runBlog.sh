#!/bin/bash
# To Start

DENV=$1
NAME=$2
THEME=$3
PORT=$4

docker run -d \
  -p $PORT:$PORT \
    --name $NAME \
    --volumes-from blogcontent \
    --volumes-from blogthemes \
    blog \
    server \
        --buildDrafts \
        --theme=$THEME \
        --bind=0.0.0.0 \
        --baseURL=http://$(docker-machine ip $DENV) \
        --appendPort=true \
        --port=$PORT