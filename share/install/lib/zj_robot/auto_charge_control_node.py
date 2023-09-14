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
if __name__ == "__main__":
    rospy.init_node("auto_charge_control_node")
    rospy.set_param("is_robot_idle",0)#机器人是否空闲
    rospy.set_param("is_robot_low_power",0)#机器人是否低电量
    time.sleep(5)
    os.system("ffmpeg -i rtsp://admin:zj123456@10.92.36.1/h264/ch1/main/av_stream -vcodec copy -acodec copy -max_delay 300 -s 672x380 -preset ultrafast -tune zerolatency -an  -b:v  700000 -f flv rtmp://192.168.3.47:1935/live/zj_robot &")


    while not rospy.is_shutdown():
        time.sleep(1)
        try:

            # rospy.set_param("is_robot_low_power",1)#机器人是否低电量
            # rospy.set_param("charge_state",1)#开启必须充电下的自动充电节点
            if rospy.get_param("battery_level")<20:
                rospy.set_param("is_robot_low_power",1)#机器人是否低电量
                rospy.set_param("charge_state",1)#开启必须充电下的自动充电节点
            else:
                rospy.set_param("is_robot_low_power",0)#机器人是否低电量

            if rospy.get_param("patrol_state")==0 and rospy.get_param("continuous_patrol_state")==0:
                rospy.set_param("is_robot_idle",1)
                rospy.set_param("charge_state",1)#开启空闲时间下的自动充电节点
            else:
                rospy.set_param("is_robot_idle",0)
        except Exception:
            pass

