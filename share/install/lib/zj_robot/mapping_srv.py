#!/usr/bin/env python3
#coding:utf-8
#建图节点
 
import rospy
import sys
sys.path.append('../../../devel/lib/python3/dist-packages/')
import os
import numpy as np
from common.srv import *
from common.msg import *
import time
import json

long_path=25000

rospy.set_param("mapdata_state",0)
rospy.set_param("mapdata_code",0)
rospy.set_param("mapdata_card_num",0)
rospy.set_param("mapdata_position",0)

rospy.set_param("mapping_state",0)#没开始建图


def mapping_func():
    mapdata={}


    rospy.set_param("mapping_state",1)#开始建图


    #设置位置为0
    pub = rospy.Publisher("setposition_command",setposition_control,queue_size=10)
    msg = setposition_control()
    print("开始")
    #特殊的发送格式
    msg.target_position_f=0
    pub.publish(msg)
    time.sleep(1)
    pub.publish(msg)




    reset_map_srv = rospy.ServiceProxy('reset_map', ResetMap)
    resp1 = reset_map_srv("reset")
    print("reset调用结果：",resp1)
    time.sleep(5)
    pos_srv = rospy.ServiceProxy('position_command', PositionControl)
    resp1 = pos_srv(0,long_path,200)
    #等待标签出现
    while rospy.get_param("mapdata_state")!=1 and rospy.get_param("mapdata_code")!=1 and  not rospy.is_shutdown():
        pass

    rospy.set_param("mapdata_state",0)
    print("轨道起点")
    mapdata["start"]=rospy.get_param("mapdata_position")

    fire_door_ind=0
    charging_station_ind=0
    normal_point_ind=0
    mapdata["fire_door"]={}
    mapdata["fire_door"][fire_door_ind]=[]
    mapdata["charging_station"]={}
    mapdata["normal_point"]={}
    while rospy.get_param("mapdata_state")!=1 and rospy.get_param("mapdata_code")!=2 and not rospy.is_shutdown():#还没遇到终点之前
        while rospy.get_param("mapdata_state")!=1 and not rospy.is_shutdown():
            pass
        rospy.set_param("mapdata_state",0)
        if rospy.get_param("mapdata_code")==3:
            print("防火门前",rospy.get_param("mapdata_position"))
            if len(mapdata["fire_door"][fire_door_ind])==2:
                fire_door_ind+=1
                mapdata["fire_door"][fire_door_ind]=[]
                mapdata["fire_door"][fire_door_ind].append(rospy.get_param("mapdata_position"))
            else:
                mapdata["fire_door"][fire_door_ind].append(rospy.get_param("mapdata_position"))
        if rospy.get_param("mapdata_code")==4:
            print("防火门后",rospy.get_param("mapdata_position"))
            if len(mapdata["fire_door"][fire_door_ind])==2:
                fire_door_ind+=1
                mapdata["fire_door"][fire_door_ind]=[]
                mapdata["fire_door"][fire_door_ind].append(rospy.get_param("mapdata_position"))
            else:
                mapdata["fire_door"][fire_door_ind].append(rospy.get_param("mapdata_position"))
        if rospy.get_param("mapdata_code")==5:
            print("充电桩",rospy.get_param("mapdata_position"))
            mapdata["charging_station"][charging_station_ind]=rospy.get_param("mapdata_position")
            charging_station_ind+=1
        if rospy.get_param("mapdata_code")==6:
            print("常规点",rospy.get_param("mapdata_position"))
            mapdata["normal_point"][normal_point_ind]=rospy.get_param("mapdata_position")
            normal_point_ind+=1

    rospy.set_param("mapdata_state",0)
    rospy.set_param("mapping_state",0)
    mapdata["end"]=rospy.get_param("mapdata_position")
    print("轨道终点")

    server = rospy.ServiceProxy('stop_command', StopControl)
    resp1 = server(1)
    time.sleep(3)
    resp1 = pos_srv(0,0,200)
    print("回家")

    with open("/home/zj/Project/zj-robot/src/zjrobot/mapdata.json","w") as json_file:
        json.dump(mapdata,json_file)
    print("保存成功")

def mapping_callback(req):
    mapping_func()
    resp=MappingResponse()
    resp.status_code=1
    return resp





if __name__ == "__main__":
    rospy.init_node("mapping_node")
    server = rospy.Service("mapping",Mapping,mapping_callback)
    mapping_func()

    rospy.spin()
