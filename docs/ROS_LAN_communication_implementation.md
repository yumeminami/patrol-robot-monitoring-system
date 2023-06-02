ROS LAN communication implementation

1. Confirm the IP address of the both computers are in the same LAN. For example, the IP address of the ROS Master machine is `192.168.2.43` and the IP address of the ROS Slave machine is `192.168.2.144`.
   
2. Now, we need to set the ROS Master machine to be the ROS Master. Open a terminal and type the following command:
    ```
    export ROS_MASTER_URI=http://192.168.2.43:11311
    export ROS_IP=192.168.2.43
    export ROS_HOSTNAME=192.168.2.43
    ```

3. Now, we need to set the ROS Slave machine to be the ROS Slave. Open a terminal and type the following command:
    ```
    export ROS_MASTER_URI=http://192.168.2.43.11311
    export ROS_IP=192.168.2.144
    export ROS_HOSTNAME=192.168.2.144
    ```
4. Run the ROS Master machine first. Open a terminal and type the following command:
    ```
    roscore
    ```
5. Run the command `rosnode list` in Slave Machine to check if the ROS Master machine is running. If the ROS Master machine is running, you will see the following output:
    ```
    /rosout
    ```
This output indicates that the ROS master is running and the slaves can connect to the ROS master, but at the same time, you need to make sure that the firewall settings do not block the communication between the ROS nodes.

---

If you want to run the ROS in ***Docker container***, please pay attention on the port mapping.

1. The ROS Master machine should expose the port `11311` to the host machine for the `roscore`.

2. The ROS Node you run that you need to specify the Node port like this:
    ```python
    rospy.init_node("test_node",xmlrpc_port=45100, tcpros_port=45101)
    ```
3. The Docker container should expose the port `45100` and `45101` to the host machine.

[Reference](https://medium.com/@yasuhirachiba/specifying-port-to-be-used-by-ros1-node-bd9dfd8643c6)