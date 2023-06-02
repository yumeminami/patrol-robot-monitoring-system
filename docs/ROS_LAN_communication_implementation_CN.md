ROS局域网通信实现

1. 确保两台计算机的IP地址在同一个局域网中。例如，ROS主机的IP地址是192.168.2.43，ROS从机的IP地址是192.168.2.144。
   
2. 现在，我们需要将一台电脑设置为ROS主机。打开终端并输入以下命令：
    ```
    export ROS_MASTER_URI=http://192.168.2.43:11311
    export ROS_IP=192.168.2.43
    export ROS_HOSTNAME=192.168.2.43
    ```

3. 现在，我们需要将另一台电脑设置为ROS从机。打开终端并输入以下命令:
    ```
    export ROS_MASTER_URI=http://192.168.2.43.11311
    export ROS_IP=192.168.2.144
    export ROS_HOSTNAME=192.168.2.144
    ```
4. 首先运行ROS主机。打开终端并输入以下命令:
    ```
    roscore
    ```
5.在从机运行命令 rosnode list 检查ROS主机是否运行。如果ROS主机正在运行，你将看到以下输出:
    ```
    /rosout
    ```

该输出表示ROS主机正在运行，并且从机可以连接到ROS主机, 但是同时，你需要确保防火墙设置不会阻止ROS节点之间的通信。

---

如果你想在***Docker容器***中运行ROS，请注意端口映射，否则无法实现ROS局域网通信。

1. ROS主机应将端口11311暴露给主机用于`roscore`。


2. 无论在主机还是从机上运行的ROS节点，都需要指定节点端口，如下所示:
    ```python
    rospy.init_node("test_node",xmlrpc_port=45100, tcpros_port=45101)
    ```
3. 相应的Docker容器应将端口45100和45101暴露给主机。

[Reference](https://medium.com/@yasuhirachiba/specifying-port-to-be-used-by-ros1-node-bd9dfd8643c6)