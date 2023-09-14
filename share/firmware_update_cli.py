#!/usr/bin/env python
import rospy
import sys
sys.path.append('../../../devel/lib/python3/dist-packages/')
from common.srv import *

def firmware_update():
    rospy.init_node('firmware_update_cli', anonymous=True)
    client = rospy.ServiceProxy("/zj_robot/Upgrade",Upgrade)
    req = UpgradeRequest()

    # bin_path = '/home/zj/zj_sensor.bin'  # Replace with your video file
    bin_path = '/home/zj/zj_sensor.bin'  # Replace with your video file

    with open(bin_path, 'rb') as f:
        bin_data = f.read()

    req.board_type=0
    req.upgrade_file.data=list(bin_data)
    resp = client.call(req)
    rospy.loginfo("响应结果:%d",resp.status_code)

if __name__ == '__main__':
    firmware_update()
