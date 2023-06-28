#!/usr/bin/env python
#coding:utf-8
 
import rospy
import sys
sys.path.append('../../../devel/lib/python3/dist-packages/')
import cv2
import rospy
from cv_bridge import CvBridge, CvBridgeError
from common.srv import *
import sys
import time
#此文件必须在source bashrc下的终端执行:为了找到libcv_bridge.so

if __name__ == "__main__":
    rospy.init_node("camera_control_cli")
    client = rospy.ServiceProxy("camera_control",CameraControl)
    client.wait_for_service()
    req = CameraControlRequest()
    req.camera_command=1
    resp = client.call(req)
    rospy.loginfo("开启是否成功:%d",resp.status_code)
    time.sleep(20)

    req.camera_command=0
    resp = client.call(req)
    rospy.loginfo("关闭是否成功:%d",resp.status_code)


