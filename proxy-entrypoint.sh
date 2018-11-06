#!/bin/sh
set -e
nohup ss-local -s $SERVER -p $PORT -m $METHOD -k $PASSWORD -t $TIMEOUT -l 1080 -u --fast-open &
nohup dockerd --host=unix:///var/run/docker.sock --host=tcp://0.0.0.0:2375 &

nohup docker pull hello-world &

exec "$@"

docker save $(docker images | sed '1d' | awk '{print $1 ":" $2}') -o images

