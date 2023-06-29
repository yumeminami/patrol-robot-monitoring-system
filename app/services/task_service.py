from datetime import datetime
import time
import subprocess
import xml.etree.ElementTree as ET

import rospy
from fastapi import HTTPException

from app.db.database import SessionLocal
from app.db.redis import redis_client
from app.schemas.checkpoints import CheckPoint
from app.schemas.gimbalpoints import GimbalPoint
from app.schemas.tasks import TaskType, TaskStatus, Task
from app.schemas.alarm_logs import (
    AlarmLogCreate,
    AlarmLogLevel,
    AlarmLogStatus,
    AlarmLogType,
)
from app.crud.robots import robot as robot_crud
from app.crud.checkpoints import checkpoint as checkpoint_crud
from app.crud.gimbalpoints import gimbal_point as gimbal_point_crud
from app.crud.tasks import task as task_crud
from app.crud.alarm_logs import alarm_log as alarm_log_crud
from app.utils.log import logger


def indent(elem, level=0):
    """Indent the XML file recursively"""
    i = "\n" + level * "  "
    if len(elem):
        if not elem.text or not elem.text.strip():
            elem.text = i + "  "
        if not elem.tail or not elem.tail.strip():
            elem.tail = i
        for elem in elem:
            indent(elem, level + 1)
        if not elem.tail or not elem.tail.strip():
            elem.tail = i
    else:
        if level and (not elem.tail or not elem.tail.strip()):
            elem.tail = i


def create_task_xml(task_create, db):
    # Check the task type
    if task_create.type == TaskType.AUTO.value:
        return

    root = ET.Element("patrolpoints")
    root.set("Intro", "new patrol params")

    # Get checkpoints from task_create.checkpoint_ids
    checkpoint_list = []
    for id in task_create.checkpoint_ids:
        checkpoint = checkpoint_crud.get(db, id)
        if checkpoint is None:
            raise HTTPException(
                status_code=400,
                detail="Checkpoint does not exist",
            )
        checkpoint = CheckPoint.from_orm(checkpoint)
        checkpoint_list.append(checkpoint)

    # Add patrol points with their corresponding gimbal points and actions
    for checkpoint in checkpoint_list:
        # Add patrol point
        patrolpoint = ET.SubElement(root, "patrolpoint")
        patrolpoint.set("index", str(checkpoint.id))
        patrolpoint.set("position", str(checkpoint.position))
        patrolpoint.set("velocity", str(checkpoint.speed))

        # Get patrol point's corresponding gimbal points
        gimbalpoint_list = []
        for id in checkpoint.gimbal_points:
            gimbal_point = gimbal_point_crud.get(db, id)
            if gimbal_point is None:
                raise HTTPException(
                    status_code=400,
                    detail="Gimbal point does not exist",
                )
            gimbal_point = GimbalPoint.from_orm(gimbal_point)
            gimbalpoint_list.append(gimbal_point)

        for gimbalpoint in gimbalpoint_list:
            # Add gimbal point
            gimbalpoint_ = ET.SubElement(patrolpoint, "gimbalpoint")
            gimbalpoint_.set("index", str(gimbalpoint.id))
            gimbalpoint_.set("presetpoint", str(gimbalpoint.preset_point))

            for k, action in enumerate(
                ["takepicture", "takevideo", "recordvoice"], start=1
            ):
                action_elem = ET.SubElement(gimbalpoint_, action)
                action_elem.set("index", str(k))
                action_elem.set("param", f"{action}param{k}")

    indent(root)
    # Save the XML to the file with encoding and XML declaration
    tree = ET.ElementTree(root)
    # TODO: Confirm the file name and path
    tree.write("output.xml", encoding="utf-8", xml_declaration=True)


def run_node():
    """Run the robot ros node.(Deprecated)

    At the first design, this step was belong to this system. But now, after the
    discussion with the team, we decide to run the ros node in the robot.

    """

    # TODO Now is hard code, need to be changed
    command = "rosrun zj_robot normal_patrol_state_machine"

    process = subprocess.Popen(
        command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE
    )

    output, error = process.communicate()

    if output:
        print("Command output:")
        print(output.decode("utf-8"))
    if error:
        print("Command error:")
        print(error.decode("utf-8"))


def update_parameter():
    try:
        rospy.set_param("/patrol_state", 1)
    except Exception as e:
        logger.error(e)


def kill_node():
    # TODO Now is hard code, need to be changed
    command = "rosnode kill /normal_patrol_state_machine"

    process = subprocess.Popen(
        command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE
    )
    output, error = process.communicate()

    if output:
        print("Command output:")
        print(output.decode("utf-8"))
    if error:
        print("Command error:")
        print(error.decode("utf-8"))


def monitor_sensor_data(task: Task):
    """
    Continually monitor sensor data throughout the task's runtime.

    Steps:
    1. Fetch the most recent sensor data from the cache.
    2. Validate whether the sensor data exceeds the defined thresholds.
    3. In case of threshold violation, initiate an alarm.
    4. Monitoring stops when the task or robot status changes to 'finished'.

    """
    logger.info("Sensor data monitoring initiated...")
    while True:
        db = SessionLocal()
        patrol_state = rospy.get_param("/patrol_state")
        if patrol_state == 3 or patrol_state == 2:
            logger.info(
                "Task completed, terminating sensor data monitoring..."
            )
            task = task_crud.get(db, task.id)
            if task is None:
                logger.error("Task does not exist in the database.")
                break
            task_crud.update(
                db, db_obj=task, obj_in={"status": TaskStatus.COMPLETED.value}
            )
            db.close()
            break
        robot = robot_crud.get(db, task.robot_id)
        if robot is None:
            logger.error("Robot does not exist in the database.")
            break

        # Fetch the latest sensor data from the cache
        sensor_data = redis_client.hget(robot.name, "sensor_data")
        sensor_data = eval(sensor_data)
        if sensor_data is None:
            logger.error("No sensor data found in the cache.")
            break

        sensors = task.sensors
        for sensor in sensors:
            sensor_name = sensor.name.strip()
            if (
                sensor.lower_limit > sensor_data[sensor_name]
                or sensor.upper_limit < sensor_data[sensor_name]
            ):
                logger.error(
                    f"Threshold violation detected at {datetime.now()}"
                )
                logger.error(
                    f"Sensor: {sensor_name}, Lower Limit: {sensor.lower_limit}, Upper Limit: {sensor.upper_limit}, Current Value: {sensor_data[sensor_name]}"
                )
                # Initiate the alarm
                TYPENAME = sensor_name.upper()
                alarm_log_type = (
                    AlarmLogType[TYPENAME].value
                    if TYPENAME in AlarmLogType.__members__
                    else AlarmLogType.DEVICE.value
                )
                alarm_log = AlarmLogCreate(
                    level=AlarmLogLevel.FATAL.value,
                    task_id=task.id,
                    status=AlarmLogStatus.UNPROCESSED.value,
                    location=robot.position,
                    type=alarm_log_type,
                )
                print(alarm_log)

                alarm_log_crud.create(db, obj_in=alarm_log)

        db.close()
        time.sleep(5)
