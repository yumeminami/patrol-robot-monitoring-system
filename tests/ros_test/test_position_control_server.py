import rospy
from common.srv import *


def hanlde_position_control(req):
    print(
        "control type is {position_control_type}".format(
            position_control_type=req.position_control_type
        )
    )
    print(
        "tartget position is {target_position_f}".format(
            target_position_f=req.target_position_f
        )
    )
    print("velocity is {velocity_f}".format(velocity_f=req.velocity_f))
    print("control success")
    response = PositionControlResponse()
    response.status_code = 1
    return response


def position_control_server():
    rospy.init_node(
        "position_control_server", xmlrpc_port=45171, tcpros_port=45172
    )
    s = rospy.Service(
        "/zj_robot/position_command", PositionControl, hanlde_position_control
    )
    rospy.spin()


if __name__ == "__main__":
    position_control_server()
