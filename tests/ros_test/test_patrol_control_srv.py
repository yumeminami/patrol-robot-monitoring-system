import rospy
from common.srv import *


def callback(req):
    if req.patrol_command == 1:
        print(req.xml_data)
        file_name = "output_recieved.xml"
        msg = str(req.xml_data)
        with open(file_name, "w") as f:
            f.write(msg)
    response = PatrolControlResponse()
    response.status_code = 1
    rospy.set_param("/zj_robot/patrol_state", 2)
    print(req.patrol_command)
    print("patrol control success")
    return response


def patrol_control_server():
    rospy.init_node(
        "patrol_control_server", xmlrpc_port=45173, tcpros_port=45174
    )
    rospy.Service("/zj_robot/patrol_control", PatrolControl, callback)
    rospy.spin()


if __name__ == "__main__":
    patrol_control_server()
