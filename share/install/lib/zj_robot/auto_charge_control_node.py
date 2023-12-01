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
sys.path.append('/home/zj/Project/zj-robot/src/zjrobot/scripts')
from motion import *
from common.msg import *


import socket



def write_positon():
    #写入位置
    with open('/home/zj/Project/zj-robot/src/zjrobot/current_position.txt', 'w') as f:
        cur_pos=rospy.get_param("current_position")
        f.write(str(cur_pos))

def read_position():
    text=None
    with open("/home/zj/Project/zj-robot/src/zjrobot/current_position.txt", 'r') as read_file:
        text = [line.strip() for line in read_file]

    pos=float(text[0])

    pub = rospy.Publisher("setposition_command",setposition_control,queue_size=10)
    msg = setposition_control()
    print("开始")
    #特殊的发送格式
    msg.target_position_f=pos
    pub.publish(msg)
    time.sleep(1)
    pub.publish(msg)
    print("位置更新成功！")
    



def get_local_ip():
    try:
        # 创建一个连接到公共 DNS 服务器的 UDP 套接字
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(('8.8.8.8', 80))  # 连接到 Google 的公共 DNS 服务器

        # 获取本机的 IP 地址
        local_ip = s.getsockname()[0]

        return local_ip
    except Exception as e:
        print("获取本机IP地址时出现错误:", e)
        return None
    finally:
        s.close()


#vlc自启动
import psutil
def is_vlc_running():
    for process in psutil.process_iter(attrs=["pid","name"]):
        if process.info["name"]=='vlc':
            return True
    return False
if __name__ == "__main__":
    rospy.init_node("auto_charge_control_node")
    rospy.set_param("is_robot_idle",0)#机器人是否空闲
    rospy.set_param("is_robot_low_power",0)#机器人是否低电量
    time.sleep(5)
    os.system("pactl set-sink-volume 0 50% &")


    # rospy.wait_for_service('stop_command')
    # server = rospy.ServiceProxy('stop_command', StopControl)
    # resp1 = server(2)#锁死
    os.system('mpg123 /home/zj/Project/zj-robot/audio/机器人节点已启动.mp3')

    os.system('mpg123 /home/zj/Project/zj-robot/audio/机器人当前电量为.mp3')
    bl=rospy.get_param("battery_level")
    play_number(str(bl))

    os.system('mpg123 /home/zj/Project/zj-robot/audio/机器人ip地址为.mp3')
    local_ip = get_local_ip()
    play_number(local_ip)



    i=0
    os.system("rosclean purge -y")
    while not rospy.is_shutdown():
        write_positon()
        time.sleep(1)
        i+=1
        if i%2000==0:
            os.system("rosclean purge -y")
            i=0

        if is_vlc_running():
            print("进程存在")
        else:
            print("进程不存在")
            os.system('cvlc -R rtsp://admin:zj123456@10.92.36.1/h264/ch1/main/av_stream --sout "#transcode{vcodec=mjpg,vb=25,scale=1.0,fps=10,acodec=none}:standard{access=http{mime=multipart/x-mixed-replace; boundary=7b3cc56e5f51db803f790dad720ed50a},mux=mpjpeg,dst=0.0.0.0:8888/videostream.cgi}" >/dev/null 2>&1 &')
            os.system('cvlc -R rtsp://admin:zj123456@10.92.36.1/h264/ch2/main/av_stream --sout "#transcode{vcodec=mjpg,vb=25,scale=1.0,fps=10,acodec=none}:standard{access=http{mime=multipart/x-mixed-replace; boundary=7b3cc56e5f51db803f790dad720ed50a},mux=mpjpeg,dst=0.0.0.0:8889/videostream.cgi}" >/dev/null 2>&1 &')

        try:

            # rospy.set_param("is_robot_low_power",1)#机器人是否低电量
            if rospy.get_param("battery_level")<20:
                rospy.set_param("is_robot_low_power",1)#机器人是否低电量
                rospy.set_param("charge_state",1)#开启必须充电下的自动充电节点
                os.system('mpg123 /home/zj/Project/zj-robot/audio/警报：电量低于20%，请充电.mp3')
            else:
                rospy.set_param("is_robot_low_power",0)#机器人是否低电量

            if rospy.get_param("patrol_state")==0 and rospy.get_param("continuous_patrol_state")==0:
                #巡检结束
                rospy.set_param("is_robot_idle",1)
                

                #充电关闭不可以设置状态
                # rospy.set_param("charge_state",0)#空闲时间下的自动充电节点 默认关闭

            else:
                rospy.set_param("is_robot_idle",0)
        except Exception:
            pass


