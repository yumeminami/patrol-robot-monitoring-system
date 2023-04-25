from app.schemas.robots import RobotCreate, RobotUpdate, Robot
from app.crud.robots import robot as crud
from app.api.api import create_generic_router


def customize_robot_response(robot):
    robot_data = robot.__dict__
    tasks = robot.tasks.all()
    if tasks:
        # TODO Make sure that the last task is the current task
        task = tasks[-1]
        robot_data['task_id'] = task.id
        robot_data['task_status'] = task.status
    return robot_data

router = create_generic_router(crud,RobotCreate,RobotUpdate,Robot,custom_read=customize_robot_response,custom_read_multi=customize_robot_response)

