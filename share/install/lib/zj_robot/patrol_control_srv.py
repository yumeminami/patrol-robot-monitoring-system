#!/usr/bin/env python3
#coding:utf-8
 
import rospy
import sys
sys.path.append('../../../devel/lib/python3/dist-packages/')
import os
import numpy as np
from common.srv import *
from common.msg import *
import time
ns=""
launch_flag=0
continuous_launch_flag=0

def patrol_control_callback(req):
    global ns,launch_flag,continuous_launch_flag
    resp=PatrolControlResponse()
    print("收到数据")
    if req.patrol_command==0:

        #如果通过防火门中，则等待
        while(rospy.get_param("if_passing_fire_door")==1):
            pass

        #打断正常巡检节点
        #先看是否拍照中 如果是则等待拍照完毕
        while(rospy.get_param("gimbal_state")==2):
            pass

        #机器人停止
        server = rospy.ServiceProxy('stop_command', StopControl)
        r = server(1)#锁死

        if launch_flag==1:
            os.system("rosnode kill "+ns+"normal_patrol_node")
            print("关闭状态机节点")
            launch_flag=0
        else:
            print("无需关闭")

        rospy.set_param("is_robot_normal_patroling",2)

        resp.status_code=1

    elif req.patrol_command==1:
        if rospy.get_param("charge_state")==2 or rospy.get_param("charge_state")==1:#充电中
            if rospy.get_param("is_robot_low_power"):
                #如果是低电量引起，则不执行任务，返回2
                resp.status_code=2
            elif rospy.get_param("is_robot_idle"):#机器人是空闲中
                #打断自动充电节点
                #-----------------------------------
                #如果在充电，就结束充电
                if rospy.get_param("battery_state")==0:
                    charge_pub = rospy.Publisher("charge_command",charge_control,queue_size=10)
                    msg = charge_control()  #创建 msg 对象
                    msg.charge_command=2
                    charge_pub.publish(msg)
                    print("关闭充电")
                    time.sleep(1)
                    while True:
                        #检测中
                        print("检测中")
                        battery_state=rospy.get_param("battery_state")
                        if battery_state==1:
                            print("确定关闭充电")
                            break
                        charge_pub.publish(msg)
                        time.sleep(10)
                time.sleep(1)
                #如果通过防火门中，则等待
                while(rospy.get_param("if_passing_fire_door")==1):
                    pass
                #机器人停止
                server = rospy.ServiceProxy('stop_command', StopControl)
                r = server(1)#锁死
                #杀死自动充电节点
                os.system("rosnode kill "+ns+"auto_charge_node")
                time.sleep(5)
                #-----------------------------------


                #===================================
                #执行任务
                print("开启状态机节点并传输xml文件")
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

                rospy.set_param("is_robot_normal_patroling",1)

                #===================================
                #充电请求置于0
                rospy.set_param("charge_state",0)
                #重启自动充电节点
                time.sleep(3)
                os.system("roslaunch zj_robot  auto_charge.launch &")



            else:#高电量，但是正在执行任务
                #不执行任务，返回0
                resp.status_code=3
        else:#机器人不充电中
            if rospy.get_param("is_robot_normal_patroling")!=1 or rospy.get_param("is_robot_continuous_patroling")!=1:#机器不是执行任务中
                #执行任务
                #===================================
                #执行任务
                print("开启状态机节点并传输xml文件")
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

                rospy.set_param("is_robot_normal_patroling",1)


                rospy.set_param("continuous_patrol_state",0)#解决任务转换的问题

                #===================================
            else:#机器人忙碌
                resp.status_code=0




    elif req.patrol_command==2:
        print("开启状态机节点 不传输xml")#恢复巡检状态
        if launch_flag==0:
            #此节点已经在命名空间内，在此节点开启的launch文件不需要添加ns
            os.system("roslaunch zj_robot  normal_patrol.launch &")
            launch_flag=1

        else:
            print("已经开启状态机，无需重复开启")

        rospy.set_param("is_robot_normal_patroling",1)
        resp.status_code=1

    elif req.patrol_command==3:
        if rospy.get_param("charge_state")==2 or rospy.get_param("charge_state")==1:#如果充电中
            if rospy.get_param("is_robot_low_power"):
                #如果是低电量引起，则不执行任务，返回2
                resp.status_code=2
            elif rospy.get_param("is_robot_idle"):#机器人是空闲中
                #打断自动充电节点
                #-----------------------------------
                #如果在充电，就结束充电
                if rospy.get_param("battery_state")==0:
                    charge_pub = rospy.Publisher("charge_command",charge_control,queue_size=10)
                    msg = charge_control()  #创建 msg 对象
                    msg.charge_command=2
                    charge_pub.publish(msg)
                    print("关闭充电")
                    time.sleep(1)
                    while True:
                        #检测中
                        print("检测中")
                        battery_state=rospy.get_param("battery_state")
                        if battery_state==1:
                            print("确定关闭充电")
                            break
                        charge_pub.publish(msg)
                        time.sleep(10)

                time.sleep(1)
                #如果通过防火门中，则等待
                while(rospy.get_param("if_passing_fire_door")==1):
                    pass
                #机器人停止
                server = rospy.ServiceProxy('stop_command', StopControl)
                r = server(1)#锁死
                #杀死自动充电节点
                os.system("rosnode kill "+ns+"auto_charge_node")
                time.sleep(5)
                #-----------------------------------

                #=================开启连续巡检任务
                print("开启连续巡检模式")
                if continuous_launch_flag==0:
                    #此节点已经在命名空间内，在此节点开启的launch文件不需要添加ns
                    os.system("roslaunch zj_robot  continuous_patrol.launch &")
                    continuous_launch_flag=1

                else:
                    print("已经开启状态机，无需重复开启")
                #xml文件更新
                rospy.wait_for_service('continuous_xml_data')

                server = rospy.ServiceProxy('continuous_xml_data', ContinousXmlData)
                xml_req = ContinousXmlDataRequest()
                #msg = UInt8MultiArray(data=list(data))
                xml_req.data=req.xml_data
                resp1=server.call(xml_req)
                print("resp1.status_code")
                print(resp1.status_code)
                if resp1.status_code==1:
                    print("xml文件更新成功")
                    #启动状态机
                    rospy.set_param("continuous_patrol_state",1)
                    print("启动状态机")
                    resp.status_code=1
                else:
                    resp.status_code=0

                rospy.set_param("is_robot_continuous_patroling",1)
                #=================开启连续巡检任务
                #充电请求置于0
                rospy.set_param("charge_state",0)
                #重启自动充电节点
                time.sleep(3)
                os.system("roslaunch zj_robot  auto_charge.launch &")

            else:#高电量，但是正在执行任务
                #不执行任务，返回3
                resp.status_code=3
        else:#机器人不充电中
            if rospy.get_param("is_robot_normal_patroling")!=1 or rospy.get_param("is_robot_continuous_patroling")!=1:#机器不是执行任务中
                #=================开启连续巡检任务
                print("开启连续巡检模式")
                if continuous_launch_flag==0:
                    #此节点已经在命名空间内，在此节点开启的launch文件不需要添加ns
                    os.system("roslaunch zj_robot  continuous_patrol.launch &")
                    continuous_launch_flag=1

                else:
                    print("已经开启状态机，无需重复开启")
                #xml文件更新
                rospy.wait_for_service('continuous_xml_data')

                server = rospy.ServiceProxy('continuous_xml_data', ContinousXmlData)
                xml_req = ContinousXmlDataRequest()
                #msg = UInt8MultiArray(data=list(data))
                xml_req.data=req.xml_data
                resp1=server.call(xml_req)
                print("resp1.status_code")
                print(resp1.status_code)
                if resp1.status_code==1:
                    print("xml文件更新成功")
                    #启动状态机
                    rospy.set_param("continuous_patrol_state",1)
                    print("启动状态机")
                    resp.status_code=1
                else:
                    resp.status_code=0

                rospy.set_param("is_robot_continuous_patroling",1)
                #=================开启连续巡检任务
                rospy.set_param("patrol_state",0)#解决任务转换的问题

            else:#机器人忙碌
                resp.status_code=0



    elif req.patrol_command==4:
        print("开启连续节点 不传输xml")#恢复连续巡检状态
        if continuous_launch_flag==0:
            #此节点已经在命名空间内，在此节点开启的launch文件不需要添加ns
            os.system("roslaunch zj_robot  continuous_patrol.launch &")
            continuous_launch_flag=1

        else:
            print("已经开启状态机，无需重复开启")

        rospy.set_param("is_robot_continuous_patroling",1)
        resp.status_code=1


    elif req.patrol_command==5:#终止连续巡检节点

        #如果通过防火门中，则等待
        while(rospy.get_param("if_passing_fire_door")==1):
            pass
        #打断连续巡检节点前先看是否拍照中 如果是则等待拍照完毕
        while(rospy.get_param("gimbal_state")==2):
            pass
        #打断连续巡检节点前先看是否在不可停止任务中，是则等待
        while(rospy.get_param("continuous_camera_task")==1):
            pass

        #机器人停止
        server = rospy.ServiceProxy('stop_command', StopControl)
        r = server(1)#锁死

        #关闭相机
        client = rospy.ServiceProxy("camera_control",CameraControl)
        req = CameraControlRequest()
        req.camera_command=0# 0:停止
        resp2=client.call(req)
        rospy.loginfo("相机服务调用结果:%d",resp2.status_code)


        if continuous_launch_flag==1:
            os.system("rosnode kill "+ns+"continuous_patrol_node")
            print("关闭连续巡检节点")
            continuous_launch_flag=0
        else:
            print("无需关闭")

        rospy.set_param("is_robot_continuous_patroling",2)
        resp.status_code=1


    else:
        resp.status_code=1
    return resp


if __name__ == "__main__":
    rospy.init_node("patrol_control_srv")
    server = rospy.Service("patrol_control",PatrolControl,patrol_control_callback)
    os.system("roslaunch zj_robot  normal_patrol.launch &")#正常巡检
    os.system("roslaunch zj_robot  continuous_patrol.launch &")#连续巡检
    os.system("roslaunch zj_robot  auto_charge.launch &")#自动充电


    rospy.set_param("is_robot_normal_patroling",0)#是否巡检中
    rospy.set_param("is_robot_continuous_patroling",0)#是否巡检中

    launch_flag=1
    continuous_launch_flag=1
    ns=rospy.get_namespace()
    time.sleep(3)
    print("命名空间")
    print(ns)
    rospy.spin()




