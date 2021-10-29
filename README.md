# modularbots_fraunhofer

This repository contains a few instances of ModularBot models, which replicate the output of our automatic discovery tool as applied to the corresponding ModularBot topologies.

## Running the simulation
Given a particular configuration of choice (say `ModularBot_6DOF`), the simulation environment is executed as follows:
 - [terminal #1] run the simulator
   - `mon launch ModularBot_6DOF ModularBot_gazebo.launch` *(or `roslaunch` if you haven't installed its better sibling `ros-$ROS_DISTRO-rosmon` :P)*
 - [terminal #2] run xbot2 (attaches to simulation time)
   - `xbot2-core --simtime --config $(rospack find ModularBot_6DOF)/config/ModularBot.yaml`

## Running the hardware
On the real robot, the following steps must be followed:
  - release the emergency stop and wait 5 seconds.
  - [terminal #1] run the EtherCat master (starts the boards)
    - `ecat_master` 
    - wait for it to stop printing
 - [terminal #2] run xbot2 (starts motors in impedance mode)
   - `xbot2-core --hw ec_imp --config $(rospack find ModularBot_6DOF)/config/ModularBot.yaml`

To connect to the robot with uncontrolled motors (read-only mode), change the `--hw` flag to `--hw ec_idle`. Note that this will stop the motors if needed.

## Monitoring & playing with joint sliders
 - Run the `xbot2-gui` command inside a terminal
 - Enable the `ros_ctrl` plugin (left panel)
 - Make sure reference filtering is enabled (top panel) and set to **safe**
 - Enable the slider panel (top right panel) and move the joint sliders

More on joint space control can be found at our [examples repository](https://github.com/ADVRHumanoids/xbot2_examples/blob/master/src/ros_api/README.md).

## Cartesian control
Run *CartesIO* after making sure that the `ros_ctrl` plugin is active:
```
mon launch ModularBot_6DOF ModularBot_cartesio_IK.launch
```
Then, use RViz interactive markers or the Python/C++ API to send references to CartesIO's ROS API (see the [tuturial](https://advrhumanoids.github.io/CartesianInterface/quickstart.html#get-started-with-the-tutorial)).


