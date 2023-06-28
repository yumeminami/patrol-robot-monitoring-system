import rospy
from common.srv import *


def hanlde_vector_control(req):
    print("velocity is %d" % req.velocity_f)
    print("control success")
    response = VelocityControlResponse()
    response.status_code = 1
    return response


def velocity_control_server():
    rospy.init_node(
        "velocity_control_server", xmlrpc_port=45169, tcpros_port=45170
    )
    s = rospy.Service(
        "velocity_control", VelocityControl, hanlde_vector_control
    )
    rospy.spin()


if __name__ == "__main__":
    velocity_control_server()
