import xml.etree.ElementTree as ET
from app.schemas.checkpoints import CheckPoint
from app.schemas.gimbalpoints import GimbalPoint
from app.schemas.tasks import TaskType
from app.crud.checkpoints import checkpoint as checkpoint_crud
from app.crud.gimbalpoints import gimbal_point as gimbal_point_crud
from fastapi import HTTPException
import rospy
import subprocess


def indent(elem, level=0):
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


async def create_task_xml(task_create, db):
    # check type
    if task_create.type == TaskType.AUTO.value:
        return
    root = ET.Element("partrolpoints")
    root.set("Intro", "new patrol params")

    # get checkpoints from task_create.checkpoint_ids
    checkpoint_list = []
    for id in task_create.checkpoint_ids:
        checkpoint = await checkpoint_crud.get(db, id)
        if checkpoint is None:
            raise HTTPException(
                status_code=400,
                detail="checkpoint is not exist",
            )
        checkpoint = CheckPoint.from_orm(checkpoint)
        checkpoint_list.append(checkpoint)

    # Add patrol points with their corresponding gimbal points and actions
    for checkpoint in checkpoint_list:
        # add patrol points
        patrolpoint = ET.SubElement(root, "patrolpoint")
        patrolpoint.set("index", str(checkpoint.id))
        patrolpoint.set("position", str(checkpoint.position))
        patrolpoint.set("velocity", str(checkpoint.speed))

        # get patrol point's corresponding gimbal points
        gimbalpoint_list = []
        for id in checkpoint.gimbal_points:
            gimbal_point = await gimbal_point_crud.get(db, id)
            if gimbal_point is None:
                raise HTTPException(
                    status_code=400,
                    detail="gimbalpoint is not exist",
                )
            gimbal_point = GimbalPoint.from_orm(gimbal_point)
            gimbalpoint_list.append(gimbal_point)

        for gimbalpoint in gimbalpoint_list:
            # add gimbalpoint
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
    # TODO confirm the file name and path
    tree.write("output.xml", encoding="utf-8", xml_declaration=True)


def run_node():
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
    # TODO Now is hard code, need to be changed
    command = "rosparam set /patrol_state 1"

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
    print("Parameter updated")


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
