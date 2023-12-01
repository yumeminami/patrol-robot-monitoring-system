#! /bin/bash

echo -e "\033[45;37m=========TSARI 开发环境配置==========\033[0m"

echo -e "\033[45;37m---------安装串口通信包---------\033[0m"
 sudo apt install -y ros-noetic-serial 
echo -e "\033[45;37m---------安装串口调试工具---------\033[0m"
 sudo apt-get install -y minicom
echo -e "\033[45;37m---------安装行为树依赖---------\033[0m"
 sudo apt-get install -y libzmq3-dev libboost-dev
echo -e "\033[45;37m---------Git clone 行为树---------\033[0m"
 cd ..
 git clone https://ghproxy.com/https://github.com/BehaviorTree/BehaviorTree.CPP
 cd BehaviorTree.CPP
 mkdir build
 cd build
echo -e "\033[45;37m---------生成make file---------\033[0m"
 cmake -DCMAKE_MODULE_PATH=/home/zj/BehaviorTree.CPP/cmake ..
 cmake ..
echo -e "\033[45;37m---------行为树包编译---------\033[0m"
 make -j8
 sudo make install
