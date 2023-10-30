#!/usr/bin/env python3
#coding:utf-8
# 根据空闲和低电量，确定是否开启自动充电节点
 
import rospy
import sys
sys.path.append('../../../devel/lib/python3/dist-packages/')
import os
import numpy as np
from common.srv import *
import time


#ffmpeg自启动
import psutil
def is_ffmpeg_running():
    for process in psutil.process_iter(attrs=["pid","name"]):
        if process.info["name"]=='ffmpeg':
            return True
    return False
if __name__ == "__main__":
    rospy.init_node("auto_charge_control_node")
    rospy.set_param("is_robot_idle",0)#机器人是否空闲
    rospy.set_param("is_robot_low_power",0)#机器人是否低电量
    time.sleep(5)
    os.system("pactl set-sink-volume 0 50% &")


    rospy.wait_for_service('stop_command')
    server = rospy.ServiceProxy('stop_command', StopControl)
    resp1 = server(2)#锁死


    while not rospy.is_shutdown():
        time.sleep(1)

        if is_ffmpeg_running():
            print("进程存在")
        else:
            print("进程不存在")
            os.system("ffmpeg -i rtsp://admin:zj123456@10.92.36.1/h264/ch1/main/av_stream -vcodec copy -acodec copy -max_delay 300 -s 672x380 -preset ultrafast -tune zerolatency -an  -b:v  700000 -f flv rtmp://192.168.3.47:1935/live/zj_robot_1 &")
            os.system("ffmpeg -i rtsp://admin:zj123456@10.92.36.1/h264/ch2/main/av_stream -vcodec copy -acodec copy -max_delay 300 -s 672x380 -preset ultrafast -tune zerolatency -an  -b:v  700000 -f flv rtmp://192.168.3.47:1935/live/zj_robot_2 &")

        try:

            # rospy.set_param("is_robot_low_power",1)#机器人是否低电量
            # rospy.set_param("charge_state",1)#开启必须充电下的自动充电节点
            if rospy.get_param("battery_level")<10:
                rospy.set_param("is_robot_low_power",1)#机器人是否低电量
                rospy.set_param("charge_state",1)#开启必须充电下的自动充电节点
            else:
                rospy.set_param("is_robot_low_power",0)#机器人是否低电量

            if rospy.get_param("patrol_state")==0 and rospy.get_param("continuous_patrol_state")==0:
                #巡检结束
                rospy.set_param("is_robot_idle",1)
                rospy.set_param("charge_state",1)#空闲时间下的自动充电节点 默认关闭
            else:
                rospy.set_param("is_robot_idle",0)
        except Exception:
            pass


