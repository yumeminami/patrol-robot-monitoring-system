#!/usr/bin/env python3
#coding:utf-8
#此文件必须在source bashrc下的终端执行:为了找到libcv_bridge.so
 
import rospy
import sys
sys.path.append('../../../devel/lib/python3/dist-packages/')
import cv2
import os
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from common.srv import TakePicture,TakePictureRequest,TakePictureResponse
def take_picture(req):
    rospy.loginfo("开始拍照")
    rospy.set_param("camera_state",1)
    camera_state=rospy.get_param("camera_state")
    while rospy.get_param("camera_state")==1:
        pass

    while rospy.get_param("camera_state")==2:
        pass

    resp=TakePictureResponse()
    if rospy.get_param("camera_state")==0:
        resp.status_code=0
        resp.err_msg="img capture failed"
    else:
        bridge = CvBridge()
        image = cv2.imread(rospy.get_param("img_path"))
        resp.img=bridge.cv2_to_imgmsg(image,"bgr8")
        resp.status_code=1

    return resp


if __name__ == "__main__":
    rospy.init_node("take_picture_srv")
    server = rospy.Service("take_picture",TakePicture,take_picture)
    rospy.spin()




