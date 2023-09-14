from ast import literal_eval
from datetime import datetime
from enum import Enum

import cv2
import rospy
from common.srv import (
    VelocityControl,
    VelocityControlRequest,
    PositionControl,
    PositionControlRequest,
    StopControl,
    StopControlRequest,
    CameraControl,
    CameraControlRequest,
    TakePicture,
    TakePictureRequest,
    GimbalControl,
    GimbalControlRequest,
    GimbalMotionControl,
    GimbalMotionControlRequest,
    PatrolControl,
    PatrolControlRequest,
    Upgrade,
    UpgradeRequest,
)

from app.crud.tasks import task as task_crud
from app.crud.robots import robot as robot_crud
from app.crud.checkpoints import checkpoint as checkpoint_crud
from app.crud.gimbalpoints import gimbal_point as gimbal_point_crud
from app.db.database import SessionLocal
from app.db.redis import redis_client
from app.schemas.gimbalpoints import GimbalPointCreate
from app.settings import config
from app.utils.images import ROS_Image_to_cv2
from app.utils.log import logger


class PositionControlType(Enum):
    ABSOLUTE = 0
    RELATIVE = 1


class StopControlType(Enum):
    NORMAL = 0
    EMERGENCY = 1
    FREE = 2


class CameraCommandType(Enum):
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


class PatrolControlCommand(Enum):
    STOP_NORMAL = 0
    NORMAL_TYPE = 1
    RESUME_NORMAL = 2
    AUTO_TYPE = 3
    RESUM_AUTO = 4
    STOP_AUTO = 5


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
    :return: result(bool)
    """

    try:
        result = False
        err_msg = ""
        service_name = "/{robot_name}/velocity_command".format(
            robot_name=robot_name
        )
        rospy.wait_for_service(service_name, timeout=1)
        velocity_control = rospy.ServiceProxy(service_name, VelocityControl)

        request = VelocityControlRequest()
        request.velocity_f = float(kwargs.get("velocity_f"))

        response = velocity_control(request)
        if response.status_code == 0:
            logger.info(f"velocity control failed: {response.err_msg}")
            err_msg = response.err_msg
        else:
            info = redis_client.hget(robot_name, "robot_real_time_info")
            info = literal_eval(info)
            info["velocity"] = request.velocity_f
            redis_client.hset(robot_name, "robot_real_time_info", str(info))

            result = True

    except Exception as e:
        logger.error(f"Error: {e}")
        err_msg = f"Error: {e}"

    return result, err_msg


def position_control(robot_name, **kwargs):
    """
    Controls the position of the specified robot.

    :param robot_name: The name of the robot to control.
    :return: result(bool)
    """

    try:
        result = False
        err_msg = ""
        service_name = "/{robot_name}/position_command".format(
            robot_name=robot_name
        )
        rospy.wait_for_service(service_name, timeout=1)
        position_control = rospy.ServiceProxy(service_name, PositionControl)

        request = PositionControlRequest()
        request.position_control_type = int(
            kwargs.get("position_control_type")
        )
        validate_enum_value(request.position_control_type, PositionControlType)
        request.target_position_f = float(kwargs.get("target_position_f"))
        request.velocity_f = float(kwargs.get("velocity_f"))

        response = position_control(request)
        if response.status_code == 0:
            logger.error(f"position control failed: {response.err_msg}")
            err_msg = response.err_msg
        else:
            info = redis_client.hget(robot_name, "robot_real_time_info")
            info = literal_eval(info)
            info["velocity"] = request.velocity_f
            redis_client.hset(robot_name, "robot_real_time_info", str(info))

            result = True

    except Exception as e:
        logger.error(f"Error: {e}")
        err_msg = f"Error: {e}"

    return result, err_msg


def stop_control(robot_name, **kwargs):
    """
    Sends a stop command to the specified robot.

    :param robot_name: The name of the robot to control.
    :return: result
    """

    try:
        result = False
        err_msg = ""
        service_name = "/{robot_name}/stop_command".format(
            robot_name=robot_name
        )
        rospy.wait_for_service(service_name, timeout=1)
        stop_control = rospy.ServiceProxy(service_name, StopControl)

        request = StopControlRequest()
        request.stop_type = int(kwargs.get("stop_type"))
        validate_enum_value(request.stop_type, StopControlType)

        response = stop_control(request)
        if response.status_code == 0:
            logger.error(f"stop control failed: {response.err_msg}")
            err_msg = response.err_msg
        else:
            info = redis_client.hget(robot_name, "robot_real_time_info")
            info = literal_eval(info)
            info["velocity"] = 0
            redis_client.hset(robot_name, "robot_real_time_info", str(info))

            result = True

    except Exception as e:
        logger.error(f"Error: {e}")
        err_msg = f"Error: {e}"

    return result, err_msg


def take_picture(robot_name):
    """
    Takes a picture using the specified robot's camera.

    :param robot_name: The name of the robot to control.
    :return: file_name
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
            logger.error(f"take picture failed: {response.err_msg}")
            return False, response.err_msg
        file_name = datetime.now().strftime("%Y%m%d%H%M%S") + ".jpg"
        file_path = config.IMAGE_DIR + file_name
        img = ROS_Image_to_cv2(response.img)
        cv2.imwrite(file_path, img)
        return file_path

    except Exception as e:
        logger.error(f"Error: {e}")
        return False


# camera control
def camera_control(robot_name, **kwargs):
    """
    Controls the camera of the specified robot.

    :param robot_name: The name of the robot to control.
    :return: result(bool)
    """

    try:
        result = False
        err_msg = ""
        service_name = "/{robot_name}/camera_control".format(
            robot_name=robot_name
        )
        rospy.wait_for_service(service_name, timeout=1)
        camera_control = rospy.ServiceProxy(service_name, CameraControl)

        request = CameraControlRequest()
        request.camera_command = int(kwargs.get("camera_command"))
        validate_enum_value(request.camera_command, CameraCommandType)

        response = camera_control(request)
        if response.status_code == 0:
            err_msg = "camera control failed"
        else:
            result = True

    except Exception as e:
        logger.error(f"Error: {e}")
        err_msg = f"Error: {e}"

    return result, err_msg


def gimbal_control(robot_name, **kwargs):
    """
    Set, clear or move the gimbal of the specified robot.
    If the operation is CLEAR, we need to check if the gimbal point is being used by a task. If so, we cannot clear it.

    :param robot_name: The name of the robot to control.
    :return: result(bool)
    """

    try:
        result = False
        err_msg = ""
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
            err_msg = "gimbal control failed"
        else:
            db = SessionLocal()
            if request.command == GimbalControlCommand.SET.value:
                if (
                    gimbal_point_crud.get_by_preset_index(
                        db=db, preset_index=request.preset_index
                    )
                ) is None:
                    robot = robot_crud.get_by_name(db=db, name=robot_name)
                    gimbal_point = GimbalPointCreate(
                        robot_id=robot.id, preset_index=request.preset_index
                    )
                    gimbal_point_crud.create(db=db, obj_in=gimbal_point)
                result = True
            elif request.command == GimbalControlCommand.CLEAR.value:
                gimbal_point = gimbal_point_crud.get_by_preset_index(
                    db=db, preset_index=request.preset_index
                )
                if gimbal_point is None:
                    return True, err_msg

                checkpoints = checkpoint_crud.get_multi(
                    db=db, gimbal_points__any=gimbal_point.id
                )
                if checkpoints is not None:
                    for checkpoint in checkpoints:
                        tasks = task_crud.get_multi(
                            db=db,
                            checkpoint_ids__any=checkpoint.id,
                        )
                        if tasks is not None:
                            err_msg = (
                                "This gimbal point is being used by a task"
                            )
                            return result, err_msg
                gimbal_point_crud.remove_by_preset_index(
                    db=db, preset_index=request.preset_index
                )
                result = True
            elif request.command == GimbalControlCommand.GOTO.value:
                result = True

    except Exception as e:
        logger.error(f"Error: {e}")
        err_msg = f"Error: {e}"

    return result, err_msg


def gimbal_motion_control(robot_name, **kwargs):
    """
    Controls the gimbal of the specified robot.

    :param robot_name: The name of the robot to control.
    :return: result(bool)
    """

    try:
        result = False
        err_msg = ""
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
            err_msg = "gimbal motion control failed"
        else:
            result = True

    except Exception as e:
        logger.error(f"Error: {e}")
        err_msg = f"Error: {e}"

    return result, err_msg


def upgrade_robot(robot_name, **kwargs):
    """
    Transfer upgrade file to robot.
    """

    try:
        err_msg = ""
        service_name = "/{robot_name}/upgrade".format(
            robot_name=robot_name
        )
        rospy.wait_for_service(service_name, timeout=1)
        upgrade = rospy.ServiceProxy(service_name, Upgrade)

        request = UpgradeRequest()
        request.upgrade_file.data=list(bytes(kwargs.get("data")))
        request.board_type = int(kwargs.get("board_type"))

        response = upgrade(request)
        if response.status_code == 0:
            err_msg = "upgrade file failed"
        else:
            result = True

    except Exception as e:
        logger.error(f"Error: {e}")
        err_msg = f"Error: {e}"

    return result, err_msg


def patrol_control(robot_name, **kwargs):
    """
    Control the robot to patrol with the XML data.

    :param robot_name: The name of the robot to control.
    :return: result(bool)
    """
    try:
        service_name = "/{robot_name}/patrol_control".format(
            robot_name=robot_name
        )
        rospy.wait_for_service(service_name, timeout=1)
        patrol_control = rospy.ServiceProxy(service_name, PatrolControl)

        request = PatrolControlRequest()
        request.patrol_command = int(kwargs.get("patrol_command"))
        validate_enum_value(request.patrol_command, PatrolControlCommand)

        if (
            request.patrol_command == PatrolControlCommand.NORMAL_TYPE.value
            or request.patrol_command == PatrolControlCommand.AUTO_TYPE.value
        ):
            request.xml_data = kwargs.get("xml_data")

        response = patrol_control(request)
        if response.status_code == 0:
            return False
        return True

    except Exception as e:
        logger.error(f"Error: {e}")
        return False
