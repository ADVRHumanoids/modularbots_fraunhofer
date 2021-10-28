#!/bin/bash

echo 'user' | sudo -S chown $(whoami) -R catkin_ws

cd $HOME 
cd catkin_ws/src
catkin_init_workspace
cd ..
catkin_make
source devel/setup.bash 
echo "source $HOME/catkin_ws/devel/setup.bash --extend" >> $HOME/.bashrc
