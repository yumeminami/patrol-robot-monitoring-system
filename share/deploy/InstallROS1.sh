#! /bin/bash

echo -e "\033[45;37m---------安装ROS---------\033[0m"
echo -e "\033[45;37m---------设置安装源---------\033[0m"
 sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list'
echo -e "\033[45;37m---------设置key---------\033[0m"
 sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
echo -e "\033[45;37m---------更新apt---------\033[0m"
 sudo apt update
echo -e "\033[45;37m---------安装ROS---------\033[0m" 
 sudo apt install -y ros-noetic-desktop-full
echo -e "\033[45;37m---------上述操作可能会在最后一步失败，需要多次update多次安装---------\033[0m" 
echo -e "\033[45;37m---------配置环境变量---------\033[0m" 
 echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
 source ~/.bashrc
