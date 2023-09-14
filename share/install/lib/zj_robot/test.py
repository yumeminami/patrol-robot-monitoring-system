#!/usr/bin/env python3
#coding:utf-8
 
import rospy
import sys
sys.path.append('../../../devel/lib/python3/dist-packages/')
import os
import numpy as np
from common.srv import *
import time

rospy.set_param("if_passing_fire_door",0)#用于打断：如果这变量为1表示正在开关防火门

#控制防火门开关
def fire_door(command):#0关闭 1开启
    rospy.wait_for_service('fire_door_control')
    server = rospy.ServiceProxy('fire_door_control', FireDoorControl)
    if command==1:
        while rospy.get_param("fire_door_state")!=2:
            
            resp1 = server(1)
            print("开启防火门中")
            time.sleep(1)
            print(rospy.get_param("fire_door_state"))

        print("已开启")
        rospy.set_param("fire_door_state",0)

    elif command==0:
        while rospy.get_param("fire_door_state")!=5:
            resp1 = server(0)
            print("关闭防火门中")
            time.sleep(1)
            print(rospy.get_param("fire_door_state"))

        print("已关闭")
        rospy.set_param("fire_door_state",0)




# 机器人运动直到结束
def move_to_target_position(control_type,target_position,target_velocity):
    pos_ctrl_cli = rospy.ServiceProxy('position_command', PositionControl)
    resp1 = pos_ctrl_cli(control_type,target_position,target_velocity)
    current_pos=rospy.get_param("current_position")#防止机器人静止的问题
    position_error=current_pos-target_position
    print("position_error:",position_error)
    while(rospy.get_param("position_control_state")==1):
        current_pos=rospy.get_param("current_position")
        position_error=current_pos-target_position
        print("机器刚启动")
        print("position_error:",abs(position_error))
        if abs(position_error)<10:
            break
        time.sleep(0.5)

    while(rospy.get_param("position_control_state")==0):
        print("机器运动中")
        time.sleep(0.5)

    print("机器运动结束")




# fire_door_position_list=[-2314,-1115]

offset=-1092
fire_door_position_list=[624,1828]


def mach(direction):
    while True:
        print("往前走")
        pos_ctrl_cli = rospy.ServiceProxy('position_command', PositionControl)
        resp1 = pos_ctrl_cli(1,direction*200,50)
        rospy.sleep(1)
        print("往前走中")
        while(rospy.get_param("position_control_state")==1):
            time.sleep(0.5)
            print("机器刚启动")
            pass

        print("机器运动中")
        while(rospy.get_param("position_control_state")==0):
            if rospy.get_param("metal_sensor_state1")==0:
                print("检测到金属传感器")
                print("停止")
                stop_ctrl_cli = rospy.ServiceProxy('stop_command', StopControl)
                resp = stop_ctrl_cli(2)
                return 'dock_completed'

        time.sleep(1)
        print("往后走")
        pos_ctrl_cli = rospy.ServiceProxy('position_command', PositionControl)
        resp1 = pos_ctrl_cli(1,-200*direction,50)
        rospy.sleep(1)
        print("往前走中")
        while(rospy.get_param("position_control_state")==1):
            time.sleep(0.5)
            print("机器刚启动")
            pass

        print("机器运动中")
        while(rospy.get_param("position_control_state")==0):
            if rospy.get_param("metal_sensor_state1")==0:
                print("检测到金属传感器")
                print("停止")
                stop_ctrl_cli = rospy.ServiceProxy('stop_command', StopControl)
                resp = stop_ctrl_cli(2)
                return 'dock_completed'



# fire_door_position_list=[500,1000]

def move(target_position,target_velocity):
    front_door=fire_door_position_list[0]
    rear_door=fire_door_position_list[1]

    if target_position>front_door and target_position <rear_door:
        print("在防火门间，无法通过")
    else:
        current_pos=rospy.get_param("current_position")
        # current_pos=2000
        current_to_target=abs(current_pos-target_position)
        current_to_door=min(abs(current_pos-front_door),abs(current_pos-rear_door))

        if (target_position<front_door and current_pos <front_door) or (target_position>rear_door and current_pos>rear_door):#若目标位置和当前位置都在防火门同侧 则无需经过防火门
            print("无需经过防火门")
            move_to_target_position(0,target_position,target_velocity)
        else:
            print("需经过防火门")
            #计算第一个经过的门和第二个
            first_door=0
            second_door=0
            a=abs(current_pos-front_door)
            b=abs(current_pos-rear_door)
            if a<b:
                first_door=front_door
                second_door=rear_door
                print("第一个门:{0},第二个门:{1}".format(first_door,second_door))
            else:
                first_door=rear_door
                second_door=front_door
                print("第一个门:{0},第二个门:{1}".format(first_door,second_door))

            # 获取方向
            direction=1
            if current_pos-first_door>0:
                direction=-1
            else:
                direction=1
            # 运动到门前方
            #先去第一个门
            move_to_target_position(0,first_door+(-direction*100),target_velocity)
            rospy.set_param("if_passing_fire_door",1)

            #对齐防火门
            mach(direction)


            #开启防火门
            fire_door(1)

            move_to_target_position(0,second_door+(direction*100),100)

            #关闭防火门
            fire_door(0)
            rospy.set_param("if_passing_fire_door",0)

            #移动到目标位置
            move_to_target_position(0,target_position,100)



# if __name__ == "__main__":
#     move(0,100)
#     # move(0,100)




