import logging
from datetime import datetime
from enum import Enum
from multiprocessing import Queue

import cv2
import rospy
from common.srv import *
from cv_bridge import CvBridge
from sensor_msgs.msg import Image

from app.crud.gimbalpoints import gimbal_point as gimbal_point_crud
from app.db.database import SessionLocal
from app.db.redis import redis_client
from app.ros.ros import ros_port_queue
from app.schemas.gimbalpoints import GimbalPointCreate
from app.utils.log import log_queue, logger

latest_img_queue = Queue()


class PositionControlType(Enum):
    ABSOLUTE = 0
    RELATIVE = 1


class StopControlType(Enum):
    NORMAL = 0
    EMERGENCY = 1
    FREE = 2


class CameraCommand(Enum):
    STOP = 0
    COLOR = 1
    COLORANDSAVE = 2
    IR = 3
    IRANDSAVE = 4


class GimbalControlCommand(Enum):
    GOTO = 1
    SET = 2
    CLEAR = 3


class GimbalMotionControlCommand(Enum):
    UP_LEFT = 1
    TILI_UP = 2
    UP_RIGHT = 3
    PAN_LEFT = 4
    PAN_RIGHT = 6
    DOWN_LEFT = 7
    TILT_DOWN = 8
    DOWN_RIGHT = 9


def validate_enum_value(value, enum_type):
    try:
        value = int(value)
        if value in [member.value for member in enum_type]:
            return
        else:
            raise ValueError("Invalid enum value")
    except (ValueError, AttributeError):
        raise ValueError("Invalid enum value")


def velocity_control(robot_name, **kwargs):
    """
    Controls the velocity of the specified robot.

    :param robot_name: The name of the robot to control.
    :return: None
    """

    try:
        service_name = "/{robot_name}/velocity_command".format(
            robot_name=robot_name
        )
        rospy.wait_for_service(service_name, timeout=1)
        velocity_control = rospy.ServiceProxy(service_name, VelocityControl)

        request = VelocityControlRequest()
        request.velocity_f = float(kwargs.get("velocity_f"))

        response = velocity_control(request)
        if response.status_code == 0:
            logger.info("velocity control failed")
            return False

        # Update the velocity to redis manually(FOR TEST ONLY)
        info = redis_client.hget(robot_name, "robot_real_time_info")
        info = eval(info)
        info["velocity"] = request.velocity_f
        redis_client.hset(robot_name, "robot_real_time_info", str(info))

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
        service_name = "/{robot_name}/position_command".format(
            robot_name=robot_name
        )
        rospy.wait_for_service(service_name, timeout=1)
        position_control = rospy.ServiceProxy(service_name, PositionControl)

        request = PositionControlRequest()
        request.position_control_type = int(
            kwargs.get("position_control_type")
        )
        # validate_enum_value(request.position_control_type, PositionControlType)
        request.target_position_f = float(kwargs.get("target_position_f"))
        request.velocity_f = float(kwargs.get("velocity_f"))

        response = position_control(request)
        if response.status_code == 0:
            logger.error(response.err_msg)
            return False

        # Update the velocity to redis manually(FOR TEST ONLY)
        info = redis_client.hget(robot_name, "robot_real_time_info")
        info = eval(info)
        info["velocity"] = request.velocity_f
        redis_client.hset(robot_name, "robot_real_time_info", str(info))

        return True
    except rospy.ROSException as e:
        logger.error(f"Error: {e}")
        return False
    except ValueError as e:
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
        service_name = "/{robot_name}/stop_command".format(
            robot_name=robot_name
        )
        rospy.wait_for_service(service_name, timeout=1)
        stop_control = rospy.ServiceProxy(service_name, StopControl)

        request = StopControlRequest()
        request.stop_type = int(kwargs.get("stop_type"))
        # validate_enum_value(request.stop_type, StopControlType)

        response = stop_control(request)
        if response.status_code == 0:
            logger.error(response.err_msg)
            return False

        # Update the velocity to redis manually(FOR TEST ONLY)
        info = redis_client.hget(robot_name, "robot_real_time_info")
        info = eval(info)
        info["velocity"] = 0
        redis_client.hset(robot_name, "robot_real_time_info", str(info))

        return True
    except rospy.ROSException as e:
        logger.error(f"Error: {e}")
        return False
    except ValueError as e:
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
        if response.status_code == 0 and response.img is not None:
            logger.error(response.err_msg)
            return False
        file_name = datetime.now().strftime("%Y%m%d%H%M%S") + ".jpg"
        bridge = CvBridge()
        img = bridge.imgmsg_to_cv2(response.img, "bgr8")
        cv2.imwrite("app/images/{file_name}".format(file_name=file_name), img)
        return file_name
    except rospy.ROSException as e:
        logger.error(f"Error: {e}")
        return False
    except Exception as e:
        logger.error(f"Error: {e}")
        return False


# camera control
def camera_control(robot_name, **kwargs):
    """
    Controls the camera of the specified robot.

    :param robot_name: The name of the robot to control.
    :return: None
    """

    try:
        service_name = "/{robot_name}/camera_command".format(
            robot_name=robot_name
        )
        rospy.wait_for_service(service_name, timeout=1)
        camera_control = rospy.ServiceProxy(service_name, CameraCommand)

        request = CameraCommandRequest()
        request.camera_command = int(kwargs.get("camera_command"))
        # validate_enum_value(request.camera_command, CameraCommandType)

        response = camera_control(request)
        if response.status_code == 0:
            return False
        return True
    except rospy.ROSException as e:
        logger.error(f"Error: {e}")
        return False
    except ValueError as e:
        logger.error(f"Error: {e}")
        return False
    except Exception as e:
        logger.error(f"Error: {e}")
        return False


def video_streamer(robot_name):
    def callback(data):
        bridge = CvBridge()
        img = bridge.imgmsg_to_cv2(data, desired_encoding="bgr8")
        latest_img_queue.put(img)

    handler = logging.handlers.QueueHandler(log_queue)
    logger.addHandler(handler)
    xmlrpc_port = ros_port_queue.get()
    tcpros_port = ros_port_queue.get()
    logger.info(f"xmlrpc_port: {xmlrpc_port}")
    logger.info(f"tcpros_port: {tcpros_port}")
    rospy.init_node(
        f"{robot_name}_video_stream_subscriber",
        xmlrpc_port=xmlrpc_port,
        tcpros_port=tcpros_port,
    )
    topic_name = f"/{robot_name}/video_stream"
    rospy.Subscriber(topic_name, Image, callback)
    while not rospy.is_shutdown():
        rospy.spin()


def gimbal_control(robot_name, **kwargs):
    """
    Set, clear or move the gimbal of the specified robot.

    :param robot_name: The name of the robot to control.
    :return: None
    """

    try:
        service_name = "/{robot_name}/gimbal_control".format(
            robot_name=robot_name
        )
        rospy.wait_for_service(service_name, timeout=1)
        gimbal_control = rospy.ServiceProxy(service_name, GimbalControl)

        request = GimbalControlRequest()
        request.command = int(kwargs.get("command"))
        request.preset_index = int(kwargs.get("preset_index"))
        validate_enum_value(request.command, GimbalControlCommand)

        response = gimbal_control(request)
        if response.status_code == 0:
            return False

        db = SessionLocal()
        if request.command == GimbalControlCommand.SET.value:
            if (
                gimbal_point_crud.get_by_preset_index(
                    db=db, preset_index=request.preset_index
                )
            ) is None:
                gimbal_point = GimbalPointCreate(
                    preset_index=request.preset_index
                )
                gimbal_point_crud.create(db=db, obj_in=gimbal_point)
        elif request.command == GimbalControlCommand.CLEAR.value:
            gimbal_point_crud.remove_by_preset_index(
                db=db, preset_index=request.preset_index
            )

        return True
    except rospy.ROSException as e:
        logger.error(f"Error: {e}")
        return False
    except ValueError as e:
        logger.error(f"Error: {e}")
        return False
    except Exception as e:
        logger.error(f"Error: {e}")
        return False


def gimbal_motion_control(robot_name, **kwargs):
    """
    Controls the gimbal of the specified robot.

    :param robot_name: The name of the robot to control.
    :return: None
    """

    try:
        service_name = "/{robot_name}/gimbal_motion_control".format(
            robot_name=robot_name
        )
        rospy.wait_for_service(service_name, timeout=1)
        gimbal_motion_control = rospy.ServiceProxy(
            service_name, GimbalMotionControl
        )

        request = GimbalMotionControlRequest()
        request.command = int(kwargs.get("command"))
        validate_enum_value(request.command, GimbalMotionControlCommand)

        response = gimbal_motion_control(request)
        if response.status_code == 0:
            return False
        return True
    except rospy.ROSException as e:
        logger.error(f"Error: {e}")
        return False
    except ValueError as e:
        logger.error(f"Error: {e}")
        return False
    except Exception as e:
        logger.error(f"Error: {e}")
        return False
