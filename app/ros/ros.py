import json
import logging
import multiprocessing
import threading
from multiprocessing import Queue

import cv2
from cv_bridge import CvBridge

import rospy
from sensor_msgs.msg import Image
from common.msg import robot_real_time_info, sensor_data
from common.srv import (
    PatrolPicture,
    PatrolPictureResponse,
    VideoData,
    VideoDataResponse,
    RecordPosition,
    RecordPositionResponse,
)

from app.crud.robots import robot as robot_crud
from app.db.database import SessionLocal
from app.db.redis import redis_client
from app.schemas.robots import Robot
from app.services.task_service import image_detection, video_detection
from app.services.ros_service import handle_panorama_video
from app.utils.log import log_queue, logger

PANORAMA_VIDEO_TIME_DICT_PATH = "app/json_file/panorama_video_time_dict.json"

available_ports = Queue()
for i in range(45159, 45200):
    available_ports.put(i)


video_data = Queue()

topic_list = {
    "robot_real_time_info": robot_real_time_info,
    "sensor_data": sensor_data,
    "video_stream": Image,
}

service_list = {
    "patrol_picture": PatrolPicture,
    "video_data": VideoData,
    "record_position": RecordPosition,
}


class Node:
    def __init__(self, nodename, xmlrpc_port, tcpros_port):
        """Initialize the node

        We need to explicitly assign the xmlrpc_port and tcpros_port because we could not
        dynamic assign the port number in the docker container. If we do not configure the
        port mapping when running the docker container, the ROS node could not communicate
        with each other.

        :param nodename: the name of the node. It should be the same as the robot name and
        the name of the corresponding ROS node
        :param xmlrpc_port: the port number of the xmlrpc server
        :param tcpros_port: the port number of the tcpros server

        """

        rospy.init_node(
            name=nodename,
            xmlrpc_port=xmlrpc_port,
            tcpros_port=tcpros_port,
        )
        self.subscribers = {}
        handler = logging.handlers.QueueHandler(log_queue)
        logger.addHandler(handler)
        logger.setLevel(level=logging.INFO)

    def initialize(self):
        self.create_subscribers()
        self.create_service()

    def create_subscribers(self):
        """Establishes ROS topic subscriptions for the node.

        This node subscribes to the topics published by a specific robot. These topics encompass:
            - Real-time robot data (position, velocity, etc.)
            - Sensor readings (temperature, humidity, etc.)

        Each topic subscription is preceded by a waiting period until the topic becomes available.
        The robot name is inferred from the node name.
        """

        db = SessionLocal()
        robot_name = rospy.get_name().strip("/").replace("_subscriber", "")
        db.close()

        for topic_name, topic_type in topic_list.items():
            try:
                msg_class = topic_type

                callback_method = getattr(self, f"{topic_name}_callback")

                callback_args = {"robot_name": robot_name}
                rospy.Subscriber(
                    name=f"/{robot_name}/{topic_name}",
                    data_class=msg_class,
                    callback=callback_method,
                    callback_args=callback_args,
                    queue_size=20,
                )
            except KeyError:
                logger.error(f"Topic type '{topic_type}' is not defined")
            except AttributeError:
                logger.error(
                    f"Callback function for topic type '{topic_name}' is not defined"
                )

    def create_service(self):
        db = SessionLocal()
        robot_name = rospy.get_name().strip("/").replace("_subscriber", "")
        db.close()

        for service_name, service_type in service_list.items():
            try:
                srv_class = service_type

                callback_method = getattr(self, f"{service_name}_callback")

                rospy.Service(
                    name=f"/{robot_name}/{service_name}",
                    service_class=srv_class,
                    handler=callback_method,
                )

            except KeyError:
                logger.error(f"Service type '{service_type}' is not defined")
            except AttributeError:
                logger.error(
                    f"Callback function for service type '{service_name}' is not defined"
                )

    def robot_real_time_info_callback(self, message, args):
        """Callback function for handling robot real-time info.

        This function is called whenever a new message is published on the robot's real-time info topic.
        It parses the message, updates the data in the cache, and logs the operation.

        :param message: the ROS message received from the topic.
        :param args: additional arguments passed to the callback (e.g., robot name).
        """
        try:
            robot_name = args.get("robot_name")

            if not robot_name:
                logger.error("Robot name not found in callback arguments.")
                return

            info = {
                field: message.__getattribute__(field)
                for field in message.__slots__
            }

            redis_client.hset(robot_name, "robot_real_time_info", str(info))

            # logger.info(f"Received message from topic: \n{message}")
            # logger.info(f"Updated real-time info for robot: {robot_name}")

        except Exception as e:
            logger.error(
                f"Error occurred while processing real-time info: {e}"
            )

    def sensor_data_callback(self, message, args):
        """Callback function for handling sensor data.

        This function is called whenever a new message is published on the robot's sensor data topic.
        It parses the message, updates the data in the cache, and logs the operation.

        :param message: the ROS message received from the topic.
        :param args: additional arguments passed to the callback (e.g., robot name).
        """
        try:
            robot_name = args.get("robot_name")
            if not robot_name:
                logger.error("Robot name not found in callback arguments.")
                return

            info = {
                field: message.__getattribute__(field)
                for field in message.__slots__
            }

            redis_client.hset(robot_name, "sensor_data", str(info))

            # logger.info(f"Received message from topic: \n{message}")
            # logger.info(f"Updated sensor data for robot: {robot_name}")

        except Exception as e:
            logger.error(f"Error occurred while processing sensor data: {e}")

    def video_stream_callback(self, message, args):
        bridge = CvBridge()
        img = bridge.imgmsg_to_cv2(message, desired_encoding="bgr8")
        resized_img = cv2.resize(img, (640, 480))
        _, img_encoded = cv2.imencode(
            ".jpg", resized_img, [cv2.IMWRITE_JPEG_QUALITY, 80]
        )
        frame_bytes = img_encoded.tobytes()
        video_data.put(frame_bytes)

    def patrol_picture_callback(self, req):
        task_id = int(req.patrol_task_name)
        checkpoint_id = req.patrol_point_index
        image = req.img

        thread = threading.Thread(
            target=image_detection, args=(image, task_id, checkpoint_id)
        )
        thread.start()

        response = PatrolPictureResponse()
        response.status_code = 1

        return response

    def video_data_callback(self, req):
        task_id = int(req.patrol_task_name)
        video_data = bytes(req.video_data.data)

        thread = threading.Thread(
            target=video_detection, args=(task_id, video_data)
        )
        thread.start()

        response = VideoDataResponse()
        response.status_code = 1

        return response

    def record_position_callback(self, req):
        """
        Receive the position to time JSON data from the client
        """
        data = json.loads(req.data.data)
        file_name = PANORAMA_VIDEO_TIME_DICT_PATH
        with open(file_name, "w") as json_file:
            json.dump(data, json_file, indent=4)

        logger.info(f"Received position data: {data}")
        response = RecordPositionResponse()
        response.status_code = 1

        thread = threading.Thread(target=handle_panorama_video)
        thread.start()

        return response


def initialize_all_robots_corresponding_nodes():
    """Spawn ROS nodes for each registered robot.

    This function initializes a dedicated ROS node for each robot in the database,
    spawning a separate process for each. These ROS nodes subscribe to the relevant
    topics published by their associated robots.

    :return: List of multiprocessing.Process objects for each spawned ROS node.
    """

    logger.info("Initializing ROS node...")
    db = SessionLocal()
    robots = robot_crud.get_all(db)
    db.close()
    process_list = []
    for robot in robots:
        robot = Robot.from_orm(robot)
        process = multiprocessing.Process(
            target=run_node, args=(robot.name, available_ports)
        )
        process_list.append(process)
        process.start()
    logger.info("ROS node initialized.")

    return process_list


def run_node(robotname, available_ports):
    """Execute a ROS node subscribing to a specific robot's topics.

    This function creates and initializes a ROS node that listens to the topics
    published by a given robot. The ports for ROS communications are retrieved from
    a shared queue.

    :param robotname: The name of the robot for which the node is being created.
    :param available_ports: A multiprocessing.Queue instance storing available ports.
                           Two ports (for XML-RPC and TCPROS, respectively) are retrieved
                           per node. The function checks the queue's availability
                           before proceeding.
    """

    if available_ports.empty():
        logger.error("No available port for ROS node")
        return
    xmlrpc_port = available_ports.get()
    tcpros_port = available_ports.get()
    nodename = f"{robotname}_subscriber"
    logger.debug(f"Creating node: {nodename}")
    logger.debug(f"xmlrpc_port: {xmlrpc_port}")
    logger.debug(f"tcpros_port: {tcpros_port}")
    node = Node(nodename, xmlrpc_port, tcpros_port)
    node.initialize()
    while not rospy.is_shutdown():
        rospy.spin()
