import logging
import multiprocessing
from multiprocessing import Queue
from datetime import datetime

import rospy

from app.utils.log import logger, log_queue
from app.db.database import SessionLocal
from app.db.redis import redis_client
from app.crud.sensors import sensor as sensor_crud
from app.crud.robots import robot as robot_crud
from app.schemas.robots import Robot

from common.msg import robot_real_time_info
from common.msg import sensor_data
from common.msg import *

ros_port_queue = Queue()
for i in range(45159, 45200):
    ros_port_queue.put(i)


topic_list = ["robot_real_time_info", "sensor_data"]


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
        logger.setLevel(level=logging.DEBUG)

    def initialize(self):
        logger.info("Initializing node...")
        self.create_subscribers()

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

        for topic in topic_list:
            topic = "/{robot_name}/{topic}".format(
                robot_name=robot_name, topic=topic
            )
            self.wait_for_topic(robot_name, topic)

    def wait_for_topic(self, robot_name, topic):
        """Ensures a topic is available before creating a subscription.

        This function periodically checks if a given topic is being published. Once the topic
        is available, it creates a subscriber that listens to the topic. The callback function
        for each subscriber is determined by the topic type.

        :param robotname: The name of the robot that publishes the topic
        :param topic: The topic to subscribe to
        """

        published_topics = [
            toptics_types[0] for toptics_types in rospy.get_published_topics()
        ]
        while topic not in published_topics:
            current_time = datetime.now().strftime("%H:%M:%S")
            logger.debug(
                f"Waiting for topic '{topic}' to become available... time: {current_time}"
            )
            rospy.sleep(5)
            published_topics = [
                toptics_types[0]
                for toptics_types in rospy.get_published_topics()
            ]

        topic_type = rospy.get_published_topics()[
            published_topics.index(topic)
        ][1].split("/")[-1]

        try:
            msg_class = globals()[topic_type]

            callback_method = getattr(self, f"{topic_type}_callback")

            callback_args = {"robot_name": robot_name}
            self.subscribers[topic] = rospy.Subscriber(
                name=topic,
                data_class=msg_class,
                callback=callback_method,
                callback_args=callback_args,
                queue_size=20,
            )
        except KeyError:
            logger.error(f"Topic type '{topic_type}' is not defined")
        except AttributeError:
            logger.error(
                f"Callback function for topic type '{topic_type}' is not defined"
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
            logger.info(f"Updated real-time info for robot: {robot_name}")

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
            logger.info(f"Updated sensor data for robot: {robot_name}")

            db = SessionLocal()
            robot = robot_crud.get_by_name(db=db, name=robot_name)
            sensors = sensor_crud.get_multi_by_robot_id(
                db=db, robot_id=robot.id
            )
            for sensor in sensors:
                try:
                    if sensor.name in info:
                        sensor_crud.update(
                            db,
                            db_obj=sensor,
                            obj_in={"value": info[sensor.name]},
                        )
                    else:
                        logger.warning(
                            f"Sensor '{sensor.name}' not found in message."
                        )
                except Exception as e:
                    logger.error(
                        f"Error occurred while updating sensor '{sensor.name}': {e}"
                    )

        except Exception as e:
            logger.error(f"Error occurred while processing sensor data: {e}")


def initialize_all_robots_corresponding_nodes():
    """Spawn ROS nodes for each registered robot.

    This function initializes a dedicated ROS node for each robot in the database,
    spawning a separate process for each. These ROS nodes subscribe to the relevant
    topics published by their associated robots.

    :return: List of multiprocessing.Process objects for each spawned ROS node.
    """

    db = SessionLocal()
    robots = robot_crud.get_multi(db)
    process_list = []
    for robot in robots:
        robot = Robot.from_orm(robot)
        process = multiprocessing.Process(
            target=run_node, args=(robot.name, ros_port_queue)
        )
        process_list.append(process)
        process.start()

    return process_list


def run_node(robotname, ros_port_queue):
    """Execute a ROS node subscribing to a specific robot's topics.

    This function creates and initializes a ROS node that listens to the topics
    published by a given robot. The ports for ROS communications are retrieved from
    a shared queue.

    :param robotname: The name of the robot for which the node is being created.
    :param ros_port_queue: A multiprocessing.Queue instance storing available ports.
                           Two ports (for XML-RPC and TCPROS, respectively) are retrieved
                           per node. The function checks the queue's availability
                           before proceeding.
    """

    if ros_port_queue.empty():
        logger.error("No available port for ROS node")
        return
    xmlrpc_port = ros_port_queue.get()
    tcpros_port = ros_port_queue.get()
    nodename = f"{robotname}_subscriber"
    logger.debug(f"Creating node: {nodename}")
    logger.debug(f"xmlrpc_port: {xmlrpc_port}")
    logger.debug(f"tcpros_port: {tcpros_port}")
    node = Node(nodename, xmlrpc_port, tcpros_port)
    node.initialize()
    while not rospy.is_shutdown():
        rospy.spin()
