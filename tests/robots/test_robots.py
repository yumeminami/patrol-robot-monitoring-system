from app.schemas.robots import Robot
import json


def test_create_robot(test_app):
    robot_data = {"name": "Test Robot"}
    response = test_app.post("/api/robots/", json=robot_data)
    assert response.status_code == 200
    robot = Robot(**json.loads(response.text))
    assert robot.name == robot_data["name"]
    # Clean up the robot after the test
    test_app.delete(f"/api/robots/{robot.id}")


def test_read_robot(test_app):
    robot_data = {"name": "Test Robot"}
    robot_response = test_app.post("/api/robots/", json=robot_data)
    robot = Robot(**json.loads(robot_response.text))

    # Read the robot
    read_response = test_app.get(f"/api/robots/{robot.id}")
    read_robot = Robot(**json.loads(robot_response.text))

    assert read_response.status_code == 200
    assert read_robot.id == robot.id
    assert read_robot.name == robot_data["name"]

    test_app.delete(f"/api/robots/{robot.id}")


def test_update_robot(test_app):
    robot_data = {"name": "Test Robot"}
    robot_response = test_app.post("/api/robots/", json=robot_data)
    robot = Robot(**json.loads(robot_response.text))

    # Update the robot
    update_data = {
        "name": "Updated Robot",
        "speed": robot.speed,
        "position": robot.position,
        "status": robot.status,
    }
    update_response = test_app.put(f"/api/robots/{robot.id}", json=update_data)
    updated_robot = Robot(**json.loads(update_response.text))

    assert update_response.status_code == 200
    assert updated_robot.id == robot.id
    assert updated_robot.name == update_data["name"]
    test_app.delete(f"/api/robots/{robot.id}")
