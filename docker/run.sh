#!/bin/bash

set -e

PKG_NAME=ModularBot_6DOF

nvidia-docker run --rm -it \
 -u $(id -u):$(id -g) \
 --env="DISPLAY=$DISPLAY" \
 --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
 --name modularbots_fhi \
 --publish 8080:8080 \
 --publish 8888:8888 \
 --volume $(pwd)/docker/setup_catkin_ws.sh:/home/user/setup_catkin_ws.sh \
 --volume $(pwd)/$PKG_NAME:/home/user/catkin_ws/src/$PKG_NAME \
 arturolaurenzi/xbot2:examples \
 bash -c "./setup_catkin_ws.sh; bash"

