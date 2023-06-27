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
#此文件必须在source bashrc下的终端执行:为了找到libcv_bridge.so

if __name__ == "__main__":
    rospy.init_node("take_picture_cli")
    client = rospy.ServiceProxy("take_picture",TakePicture)
    client.wait_for_service()
    req = TakePictureRequest()
    req.take_picture="yes"
    resp = client.call(req)
    rospy.loginfo("响应结果:%d",resp.status_code)
    bridge = CvBridge()
    cv_image = bridge.imgmsg_to_cv2(resp.img,"bgr8")
    cv2.imshow("lala",cv_image)
    cv2.waitKey(0)
