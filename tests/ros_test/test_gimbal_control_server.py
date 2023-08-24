import rospy
from common.srv import *
from cv_bridge import CvBridge
import cv2


def hanlde(req):
    response = GimbalControlResponse()
    response.status_code = 1
    return response


def gimbal_control_server():
    rospy.init_node(
        "gimbal_control_server", xmlrpc_port=45169, tcpros_port=45170
    )
    rospy.Service("/zj_robot/gimbal_control", GimbalControl, hanlde)
    rospy.spin()


if __name__ == "__main__":
    gimbal_control_server()
