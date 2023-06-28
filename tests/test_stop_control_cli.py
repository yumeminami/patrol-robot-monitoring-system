import rospy
from common.srv import *


def stop_control_client():
    try:
        rospy.wait_for_service("/zj_robot/stop_control", timeout=1)
        stop_control = rospy.ServiceProxy(
            "/zj_robot/stop_control", StopControl
        )
        request = StopControlRequest()
        request.stop_type = 1
        response = stop_control(request)
        if response.status_code == 1:
            print("stop control success")
    except Exception as e:
        print("error: %s" % e)


if __name__ == "__main__":
    stop_control_client()
