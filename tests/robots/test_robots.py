from app.schemas.robots import Robot
import json


def get_test_token(test_app, username: str, password: str):
    login_data = {"username": username, "password": password}
    response = test_app.post("/token", data=login_data)
    assert response.status_code == 200
    token_data = response.json()
    assert "access_token" in token_data
    return token_data["access_token"]


def test_robot_module(test_app):
    token = get_test_token(test_app, "root", "secret")
    headers = {"Authorization": f"Bearer {token}"}
    robot_data = {"name": "Test Robot"}

    # Create
    response = test_app.post("/api/robots/", json=robot_data, headers=headers)
    assert response.status_code == 200
    created_robot = Robot(**json.loads(response.text))
    assert created_robot.name == robot_data["name"]  # type: ignore

    # Read
    response = test_app.get(f"/api/robots/{created_robot.id}", headers=headers)
    assert response.status_code == 200
    read_robot = Robot(**json.loads(response.text))
    assert read_robot.id == created_robot.id
    assert read_robot.name == robot_data["name"]

    # Update
    update_data = {
        "name": "Updated Robot",
        "velocity": read_robot.velocity,
        "position": read_robot.position,
        "status": read_robot.status,
    }
    response = test_app.put(
        f"/api/robots/{created_robot.id}", json=update_data, headers=headers
    )
    assert response.status_code == 200
    updated_robot = Robot(**json.loads(response.text))
    assert updated_robot.id == created_robot.id
    assert updated_robot.name == update_data["name"]

    # Delete
    response = test_app.delete(
        f"/api/robots/{created_robot.id}", headers=headers
    )
    assert (
        response.status_code == 200
    )  # or whatever status code you return for successful deletion
