#! /bin/bash

echo -e "\033[45;37m=========TSARI 开发环境配置==========\033[0m"

echo -e "\033[45;37m---------安装开发环境---------\033[0m"
 sudo apt install -y terminator
echo -e "\033[45;37m---------安装dolphin环境---------\033[0m"
 sudo apt-get install -y dolphin
 sudo apt-get install -y konsole
echo -e "\033[45;37m---------安装git环境---------\033[0m"
 sudo apt-get install -y git
 
echo -e "\033[45;37m---------安装硬盘分区工具---------\033[0m" 
 sudo apt-get install -y gparted 

