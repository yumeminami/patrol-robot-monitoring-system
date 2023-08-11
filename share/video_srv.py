#!/usr/bin/env python
import rospy
import sys
sys.path.append('../../../devel/lib/python3/dist-packages/')
from common.srv import *


def video_data_callback(req):
    print("收到视频")
    video_data = bytes(req.video_data.data)
    with open('/home/zj/script/test.avi', 'wb') as f:
        f.write(video_data)

    resp=VideoDataResponse()
    resp.status_code=1
    print("接收完毕")
    return resp


if __name__ == '__main__':
    rospy.init_node("video_srv")
    server = rospy.Service("/zj_robot/video_data",VideoData,video_data_callback)
    rospy.spin()
