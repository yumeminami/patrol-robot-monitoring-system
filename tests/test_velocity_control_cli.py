import rospy
from common.srv import *


def velocity_control_client():
    try:
        rospy.wait_for_service("velocity_control", timeout=1)
        velocity_control = rospy.ServiceProxy(
            "velocity_control", VelocityControl
        )
        request = VelocityControlRequest()
        request.velocity_f = 100
        response = velocity_control(request)
        if response.status_code == 1:
            print("velocity control success")

    except Exception as e:
        print("error: %s" % e)


if __name__ == "__main__":
    velocity_control_client()
