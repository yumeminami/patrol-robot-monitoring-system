import rospy


from app.utils.log import logger

from common.srv import *
from sensor_msgs.msg import Image


def velocity_control(robot_name, **kwargs):
    """
    Controls the velocity of the specified robot.

    :param robot_name: The name of the robot to control.
    :return: None
    """

    try:
        service_name = "/{robot_name}/velocity_control".format(
            robot_name=robot_name
        )
        rospy.wait_for_service(service_name, timeout=1)
        velocity_control = rospy.ServiceProxy(service_name, VelocityControl)

        request = VelocityControlRequest()
        request.velocity_f = kwargs.get("velocity_f")

        response = velocity_control(request)
        if response.status_code == 0:
            logger.info("velocity control failed")
            return False
        return True
    except rospy.ROSException as e:
        logger.error(f"Error: {e}")
        return False
    except Exception as e:
        logger.error(f"Error: {e}")
        return False


def position_control(robot_name, **kwargs):
    """
    Controls the position of the specified robot.

    :param robot_name: The name of the robot to control.
    :return: None
    """

    try:
        service_name = "/{robot_name}/position_control".format(
            robot_name=robot_name
        )
        rospy.wait_for_service(service_name, timeout=1)
        position_control = rospy.ServiceProxy(service_name, PositionControl)

        request = PositionControlRequest()
        request.position_control_type = kwargs.get("position_control_type")
        request.target_position_f = kwargs.get("target_position_f")
        request.velocity_f = kwargs.get("velocity_f")

        response = position_control(request)
        if response.status_code == 0:
            logger.error(response.err_msg)
            return False
        return True
    except rospy.ROSException as e:
        logger.error(f"Error: {e}")
        return False
    except Exception as e:
        logger.error(f"Error: {e}")
        return False


def stop_control(robot_name, **kwargs):
    """
    Sends a stop command to the specified robot.

    :param robot_name: The name of the robot to control.
    :return: None
    """

    try:
        service_name = "/{robot_name}/stop_control".format(
            robot_name=robot_name
        )
        rospy.wait_for_service(service_name, timeout=1)
        stop_control = rospy.ServiceProxy(service_name, StopControl)

        request = StopControlRequest()
        request.stop_type = kwargs.get("stop_type")

        response = stop_control(request)
        if response.status_code == 0:
            logger.error(response.err_msg)
            return False
        return True
    except rospy.ROSException as e:
        logger.error(f"Error: {e}")
        return False
    except Exception as e:
        logger.error(f"Error: {e}")
        return False


def take_picture(robot_name):
    """
    Takes a picture using the specified robot's camera.

    :param robot_name: The name of the robot to control.
    :return: None
    """

    try:
        service_name = "/{robot_name}/take_picture".format(
            robot_name=robot_name
        )
        rospy.wait_for_service(service_name, timeout=1)
        take_picture = rospy.ServiceProxy(service_name, TakePicture)

        request = TakePictureRequest()

        response = take_picture(request)
        if response.status_code == 0:
            logger.error(response.err_msg)
            return False
        # TODO save image
        return True
    except rospy.ROSException as e:
        logger.error(f"Error: {e}")
        return False
    except Exception as e:
        logger.error(f"Error: {e}")
        return False
