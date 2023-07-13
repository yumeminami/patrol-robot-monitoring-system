#!/usr/bin/env python3
#coding:utf-8
 
import rospy
import sys
sys.path.append('../../../devel/lib/python3/dist-packages/')
import os
import numpy as np
from common.srv import *
import time
ns=""
launch_flag=0

def patrol_control_callback(req):
    global ns,launch_flag
    resp=PatrolControlResponse()
    print("收到数据")
    if req.patrol_command==0:
        if launch_flag==1:
            os.system("rosnode kill "+ns+"normal_patrol_node")
            print("关闭状态机节点")
            launch_flag=0
        else:
            print("无需关闭")

        resp.status_code=1

    if req.patrol_command==1:
        print("开启状态机节点")
        if launch_flag==0:
            #此节点已经在命名空间内，在此节点开启的launch文件不需要添加ns
            os.system("roslaunch zj_robot  normal_patrol.launch &")
            launch_flag=1

        else:
            print("已经开启状态机，无需重复开启")



        #xml文件更新
        rospy.wait_for_service('xml_data')

        server = rospy.ServiceProxy('xml_data', XmlData)
        xml_req = XmlDataRequest()
        #msg = UInt8MultiArray(data=list(data))
        xml_req.data=req.xml_data
        resp1=server.call(xml_req)


        print("resp1.status_code")
        print(resp1.status_code)
        if resp1.status_code==1:
            print("xml文件更新成功")
            #启动状态机
            rospy.set_param("patrol_state",1)
            print("启动状态机")
            resp.status_code=1
        else:
            resp.status_code=0
    else:
        resp.status_code=1
    return resp


if __name__ == "__main__":
    rospy.init_node("patrol_control_srv")
    server = rospy.Service("patrol_control",PatrolControl,patrol_control_callback)
    os.system("roslaunch zj_robot  normal_patrol.launch &")
    launch_flag=1
    ns=rospy.get_namespace()
    time.sleep(3)
    print("命名空间")
    print(ns)
    rospy.spin()




