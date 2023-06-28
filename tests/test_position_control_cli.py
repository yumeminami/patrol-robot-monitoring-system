import rospy
from common.srv import *


def position_control_client():
    try:
        rospy.wait_for_service("/zj_robot/position_control", timeout=1)
        position_control = rospy.ServiceProxy(
            "/zj_robot/position_control", PositionControl
        )
        request = PositionControlRequest()
        request.position_control_type = 1
        request.target_position_f = 100.00
        request.velocity_f = 100.00
        response = position_control(request)
        if response.status_code == 1:
            print("position control success")

    except Exception as e:
        print("error: %s" % e)


if __name__ == "__main__":
    position_control_client()
