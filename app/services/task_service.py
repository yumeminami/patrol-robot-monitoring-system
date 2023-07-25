import base64
import os
import time
import uuid
import xml.etree.ElementTree as ET
from ast import literal_eval
from datetime import datetime

import cv2
import numpy as np
import rospy
from fastapi import HTTPException

from app.crud.alarm_logs import alarm_log as alarm_log_crud
from app.crud.checkpoints import checkpoint as checkpoint_crud
from app.crud.gimbalpoints import gimbal_point as gimbal_point_crud
from app.crud.patrol_images import patrol_image as patrol_image_crud
from app.crud.robots import robot as robot_crud
from app.crud.tasks import task as task_crud
from app.db.database import SessionLocal
from app.db.redis import redis_client
from app.schemas.alarm_logs import (
    AlarmLogCreate,
    AlarmLogLevel,
    AlarmLogStatus,
)
from app.schemas.checkpoints import CheckPoint
from app.schemas.gimbalpoints import GimbalPoint
from app.schemas.patrol_images import PatrolImageCreate
from app.schemas.tasks import Task, TaskStatus, TaskType
from app.settings import config
from app.utils.images import ROS_Image_to_cv2
from app.utils.log import logger
from app.vision_algorithm.vision_algorithm import vision_algorithm as vs


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


def create_task_xml(task, db):
    # Check the task type
    if task.type == TaskType.AUTO.value:
        return

    root = ET.Element("patrolpoints")
    root.set("Intro", f"{task.id}")

    # Get checkpoints from task.checkpoint_ids
    checkpoint_list = []
    for id in task.checkpoint_ids:
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
        patrolpoint.set("velocity", str(checkpoint.velocity))

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
            gimbalpoint_.set("presetpoint", str(gimbalpoint.preset_index))

            for k, action in enumerate(
                ["takepicture", "takevideo", "recordvoice"], start=1
            ):
                action_elem = ET.SubElement(gimbalpoint_, action)
                action_elem.set("index", str(k))
                action_elem.set("param", f"{action}param{k}")

    indent(root)
    # Save the XML to the file with encoding and XML declaration
    tree = ET.ElementTree(root)
    file_name = "{}.xml".format(datetime.now().strftime("%Y%m%d%H%M%S"))
    tree.write(file_name, encoding="utf-8", xml_declaration=True)
    return file_name


def monitor_sensor_data(task: Task):
    """
    Continually monitor sensor data throughout the task's runtime.

    Steps:
    1. Fetch the most recent sensor data from the cache.
    2. Validate whether the sensor data exceeds the defined thresholds.
    3. In case of threshold violation, initiate an alarm.
    4. Monitoring stops when the task or robot status changes to 'finished'.

    """
    logger.error("Sensor data monitoring initiated...")
    while True:
        db = SessionLocal()

        robot = robot_crud.get(db, task.robot_id)
        if robot is None:
            logger.error("Robot does not exist in the database.")
            break

        patrol_state = rospy.get_param(f"/{robot.name}/patrol_state")
        if patrol_state == 0:
            logger.error(
                "Task completed, terminating sensor data monitoring..."
            )
            task = task_crud.get(db, task.id)
            if task is None:
                logger.error("Task does not exist in the database.")
                break
            task_crud.update(
                db,
                db_obj=task,
                obj_in={"status": TaskStatus.COMPLETED.value},
            )
            db.close()
            break

        # Fetch the latest sensor data from the cache
        sensor_data = redis_client.hget(robot.name, "sensor_data")
        sensor_data = literal_eval(sensor_data)
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
                alarm_log = AlarmLogCreate(
                    level=AlarmLogLevel.FATAL.value,
                    task_id=task.id,
                    status=AlarmLogStatus.UNPROCESSED.value,
                    location=robot.position,
                    type=sensor_name,
                    detail=f"Sensor: {sensor_name}, Lower Limit: {sensor.lower_limit}, Upper Limit: {sensor.upper_limit}, Current Value: {sensor_data[sensor_name]}",
                )

                alarm_log_crud.create(db, obj_in=alarm_log)

        db.close()
        time.sleep(5)


def image_detection(image, task_id, checkpoint_id):
    """
    Detect the image and save the result to database

    1. Check if the task and checkpoint exist in the database.

    2. Call the corresponding HTTP API to detect the image.

    3. Save the detection result to the database.

    4. Create alarm if the detection result is abnormal.
    """

    db = SessionLocal()
    task = task_crud.get(db, task_id)
    if task is None:
        logger.error("Task does not exist in the database.")
        return

    checkpoint = checkpoint_crud.get(db, checkpoint_id)
    if checkpoint is None:
        logger.error("Checkpoint does not exist in the database.")
        return

    image_id = str(uuid.uuid4())
    image_cv = ROS_Image_to_cv2(image)
    image_cv = cv2.resize(image_cv, (640, 480))  # Resize image
    image_file_path = f"{config.IMAGE_DIR}/{image_id}.jpg"

    patrol_image = PatrolImageCreate(
        image_url=os.path.relpath(image_file_path, "app"),
        task_id=task_id,
        uuid=image_id,
    )
    patrol_image_crud.create(db, obj_in=patrol_image)
    cv2.imwrite(image_file_path, image_cv)

    task = Task.from_orm(task)
    vision_algorithms = task.vision_algorithms

    # Detect
    _, img_encoded = cv2.imencode(".jpg", image_cv)
    image_base64 = base64.b64encode(img_encoded).decode()
    for vision_algorithm in vision_algorithms:
        print(vision_algorithm.name)
        if vision_algorithm.sensitivity == 0:
            continue
        try:
            detected_alarms, detected_image_base64 = vs.detect(
                image_id=image_id,
                image_base64=image_base64,
                algorithm=vision_algorithm.name,
                sensitivity=vision_algorithm.sensitivity,
            )
            detected_image_file_path = (
                f"{config.IMAGE_DIR}/{image_id}_{vision_algorithm.name}.jpg"
            )
            detected_image_data = base64.b64decode(detected_image_base64)
            detected_image_cv = cv2.imdecode(
                np.fromstring(detected_image_data, dtype=np.uint8),
                cv2.IMREAD_COLOR,
            )
            detected_image_cv = cv2.resize(
                detected_image_cv, (640, 480)
            )  # Resize image
            cv2.imwrite(detected_image_file_path, detected_image_cv)
            patrol_image_detected = PatrolImageCreate(
                image_url=os.path.relpath(detected_image_file_path, "app"),
                task_id=task_id,
                uuid=image_id,
            )
            patrol_image_crud.create(db, obj_in=patrol_image_detected)
            if (len(detected_alarms)) > 0:
                logger.error(f"Alarms detected: {detected_alarms}")
                alarm_log = AlarmLogCreate(
                    level=AlarmLogLevel.WARNING.value,
                    task_id=task_id,
                    status=AlarmLogStatus.UNPROCESSED.value,
                    location=checkpoint.position,
                    type=vision_algorithm.name,
                    img_url=os.path.relpath(detected_image_file_path, "app"),
                    detail=f"Alarms detected: {detected_alarms}",
                )
                alarm_log_crud.create(db, obj_in=alarm_log)
        except Exception as e:
            logger.error(e)
            return

    # Merge
    merge_image_base64 = vs.merge(image_id, image_base64)
    if merge_image_base64 is None:
        logger.error("Nothing Detected.")
        return

    merge_image_file_path = f"{config.IMAGE_DIR}/{image_id}_merge.jpg"
    merge_image_data = base64.b64decode(merge_image_base64)
    merge_image_cv = cv2.imdecode(
        np.fromstring(merge_image_data, dtype=np.uint8), cv2.IMREAD_COLOR
    )
    merge_image_cv = cv2.resize(merge_image_cv, (640, 480))  # Resize image
    cv2.imwrite(merge_image_file_path, merge_image_cv)
    patrol_image_merge = PatrolImageCreate(
        image_url=os.path.relpath(merge_image_file_path, "app"),
        task_id=task_id,
        uuid=image_id,
    )
    patrol_image_crud.create(db, obj_in=patrol_image_merge)

    db.close()
    return
