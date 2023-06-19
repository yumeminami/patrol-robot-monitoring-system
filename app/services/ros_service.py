import rospy

# from common.msg import position_command
# from common.msg import velocity_command
# from common.msg import stop_command

from app.utils.log import logger


def check_topic(topic_name):
    """
    Verifies the availability of a specific ROS topic.

    This function checks if the specified topic exists among the published topics.
    If the topic does not exist, it logs an error message.

    :param topic_name: The name of the ROS topic to check.
    :return: True if the topic is available, otherwise False.
    """

    topic_name_list = [
        topic_items[0] for topic_items in rospy.get_published_topics()
    ]
    if topic_name not in topic_name_list:
        logger.error(f"Topic: '{topic_name}' is not available")
        return False
    return True


def velocity_control(robot_name):
    """
    Controls the velocity of the specified robot.

    This function publishes velocity commands to a designated ROS topic associated with the robot.
    The velocity_command message should contain a single float32 field indicating the desired velocity.

    :param robot_name: The name of the robot to control.
    :return: None
    """

    topic_name = robot_name + "/velocity_command"
    if not check_topic(topic_name):
        return

    try:
        # TODO: Implement velocity control logic
        pass
    except Exception as e:
        logger.error(f"Error: {e}")


def position_control(robot_name):
    """
    Controls the position of the specified robot.

    This function publishes position commands to a designated ROS topic associated with the robot.
    The position_command message should contain:
        - an int32 field for position control type (0: absolute, 1: relative),
        - a float32 field for the target position,
        - a float32 field for the velocity.

    :param robot_name: The name of the robot to control.
    :return: None
    """

    topic_name = robot_name + "/position_command"
    if not check_topic(topic_name):
        return

    try:
        # TODO: Implement position control logic
        pass
    except Exception as e:
        logger.error(f"Error: {e}")


def stop_control(robot_name):
    """
    Sends a stop command to the specified robot.

    This function publishes a stop command to a designated ROS topic associated with the robot.
    The stop_command message should contain an int32 field for stop type (0: stop, 1: kill).

    :param robot_name: The name of the robot to control.
    :return: None
    """

    topic_name = robot_name + "/stop_command"
    if not check_topic(topic_name):
        return

    try:
        # TODO: Implement stop control logic
        pass
    except Exception as e:
        logger.error(f"Error: {e}")
