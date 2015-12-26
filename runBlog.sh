#!/bin/bash
# To Start

DENV=$1
NAME=$2
PORT=$3

docker run -d \
  -p $PORT:$PORT \
    --name $NAME \
    --volumes-from blogcontent \
    blog \
    server \
        --buildDrafts \
        --buildFuture \
        --logFile=/var/log/hugo/server.log \
        --theme=current\
        --bind=0.0.0.0 \
        --baseURL=http://$(docker-machine ip $DENV) \
        --appendPort=true \
        --port=$PORT
