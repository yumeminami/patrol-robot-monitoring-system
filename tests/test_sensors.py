# test_sensors.py
from app.schemas.sensors import Sensor
import json


def test_create_sensor(test_app):
    sensor_data = {"name": "Test Sensor", "value": "42", "robot_id": 1}
    response = test_app.post("/api/sensors/", json=sensor_data)
    assert response.status_code == 200
    sensor = Sensor(**json.loads(response.text))
    assert sensor.name == sensor_data["name"]
    assert sensor.value == sensor_data["value"]
    assert sensor.robot_id == sensor_data["robot_id"]
    # Clean up the sensor after the test
    test_app.delete(f"/api/sensors/{sensor.id}")


def test_read_sensor(test_app):
    sensor_data = {"name": "Test Sensor", "value": "42", "robot_id": 1}
    sensor_response = test_app.post("/api/sensors/", json=sensor_data)
    sensor = Sensor(**json.loads(sensor_response.text))

    # Read the sensor
    read_response = test_app.get(f"/api/sensors/{sensor.id}")
    read_sensor = Sensor(**json.loads(sensor_response.text))

    assert read_response.status_code == 200
    assert read_sensor.id == sensor.id
    assert read_sensor.name == sensor_data["name"]
    assert read_sensor.value == sensor_data["value"]
    assert read_sensor.robot_id == sensor_data["robot_id"]

    test_app.delete(f"/api/sensors/{sensor.id}")


def test_update_sensor(test_app):
    sensor_data = {"name": "Test Sensor", "value": "42", "robot_id": 1}
    sensor_response = test_app.post("/api/sensors/", json=sensor_data)
    sensor = Sensor(**json.loads(sensor_response.text))

    # Update the sensor
    update_data = {"name": "Updated Sensor", "value": "84", "robot_id": 1}
    update_response = test_app.put(
        f"/api/sensors/{sensor.id}", json=update_data)
    updated_sensor = Sensor(**json.loads(update_response.text))

    assert update_response.status_code == 200
    assert updated_sensor.id == sensor.id
    assert updated_sensor.name == update_data["name"]
    assert updated_sensor.value == update_data["value"]
    assert updated_sensor.robot_id == sensor_data["robot_id"]
    test_app.delete(f"/api/sensors/{sensor.id}")
