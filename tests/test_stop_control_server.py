import rospy
from common.srv import *


def hanlde_stop_control(req):
    print("stop type is {stop_type}".format(stop_type=req.stop_type))
    print("control success")
    response = StopControlResponse()
    response.status_code = 1
    return response


def stop_control_server():
    rospy.init_node(
        "stop_control_server", xmlrpc_port=45173, tcpros_port=45174
    )
    s = rospy.Service(
        "/zj_robot/stop_control", StopControl, hanlde_stop_control
    )
    rospy.spin()


if __name__ == "__main__":
    stop_control_server()
