#!/bin/bash

echo "This will stop and remove all your docker images. Continue ?"
read

docker stop $(docker ps -a -q)
#docker system prune -a
docker rm $(docker ps -a -q)
#docker images purge
docker volume prune
