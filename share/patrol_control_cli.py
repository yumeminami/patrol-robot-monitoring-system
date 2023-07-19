#!/usr/bin/env python
#coding:utf-8
 
import rospy
import sys
sys.path.append('../../../devel/lib/python3/dist-packages/')
import rospy
from common.srv import *
import sys
#此文件必须在source bashrc下的终端执行:为了找到libcv_bridge.so


xml="""
<patrolpoints Intro="new patrol params">
<!-- 巡检点:巡检位置 单位mm 巡检速度 单位mm/s -->
    <patrolpoint index="1" position="-1000" velocity="200">
        <!-- 云台位置定义 云台位置定义 预置点序号-->
        <gimbalpoint index="1" presetpoint = "2">
            <takepicture index = "1" param = "pictureparam1"></takepicture>
            <takevideo   index = "1" param = "videoparam1"></takevideo>
            <recordvoice index = "1" param = "voiceparam1"></recordvoice>
        </gimbalpoint>
        <gimbalpoint index="2" presetpoint = "1">
            <takepicture index = "1" param = "pictureparam2"></takepicture>
            <takevideo   index = "1" param = "videoparam2"></takevideo>
            <recordvoice index = "1" param = "voiceparam2"></recordvoice>
        </gimbalpoint>

    <patrolpoint index="1" position="-1000" velocity="200">
        <!-- 云台位置定义 云台位置定义 预置点序号-->
        <gimbalpoint index="1" presetpoint = "2">
            <takepicture index = "1" param = "pictureparam1"></takepicture>
            <takevideo   index = "1" param = "videoparam1"></takevideo>
            <recordvoice index = "1" param = "voiceparam1"></recordvoice>
        </gimbalpoint>
        <gimbalpoint index="2" presetpoint = "1">
            <takepicture index = "1" param = "pictureparam2"></takepicture>
            <takevideo   index = "1" param = "videoparam2"></takevideo>
            <recordvoice index = "1" param = "voiceparam2"></recordvoice>
        </gimbalpoint>
    </patrolpoint>



    <patrolpoint index="2" position="500" velocity="200">
        <!-- 云台位置定义 云台位置定义 预置点序号-->
        <gimbalpoint index="1" presetpoint = "4">
            <takepicture index = "1" param = "pictureparam3"></takepicture>
            <takevideo   index = "1" param = "videoparam3"></takevideo>
            <recordvoice index = "1" param = "voiceparam3"></recordvoice>
        </gimbalpoint>
        <gimbalpoint index="2" presetpoint = "1">
            <takepicture index = "1" param = "pictureparam4"></takepicture>
            <takevideo   index = "1" param = "videoparam4"></takevideo>
            <recordvoice index = "1" param = "voiceparam4"></recordvoice>
        </gimbalpoint>
    </patrolpoint>
</patrolpoints>
"""

if __name__ == "__main__":
    rospy.init_node("patrol_control_cli")
    client = rospy.ServiceProxy("/zj_robot/patrol_control",PatrolControl)
    req = PatrolControlRequest()
    req.patrol_command=1
    req.xml_data=xml
    resp = client.call(req)
    rospy.loginfo("响应结果:%d",resp.status_code)
