import queue
import logging
import multiprocessing
from multiprocessing import Queue
from datetime import datetime

import rospy
from std_msgs.msg import String

from app.utils.log import logger, log_queue
from app.db.database import SessionLocal
from app.crud.robots import robot as crud
from app.schemas.robots import Robot
from app.schemas.sensors import Sensor
from app.db.redis import redis_client

ros_port_queue = Queue()
for i in range(45159, 45200):
    ros_port_queue.put(i)


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
        """Create subscribers for the node

        The node will subscribe to the topics that the robot publishes. The topics are these
        aspects of the robot:
            - robot real-time data(position, velocity, etc.)
            - sensor data (temperature, humidity, etc.)

        """
        # Create a list of topics to subscribe robot's data
        db = SessionLocal()
        robot = crud.get_by_name(db, name=rospy.get_name().strip("/"))
        robot = Robot.from_orm(robot)
        sensors = robot.sensors
        for sensor in sensors:
            topic = "/{robot}/{sensor}".format(
                robot=robot.name, sensor=sensor.name
            )
            logger.info(f"Subscribing to topic: {topic}")
            self.wait_for_topic(topic)

    def wait_for_topic(self, topic):
        """Wait for the topic to become available

        :param topic: the topic to subscribe

        """
        published_topics = [t[0] for t in rospy.get_published_topics()]
        while topic not in published_topics:
            current_time = datetime.now().strftime("%H:%M:%S")
            # logger.debug(
            #     f"Waiting for topic '{topic}' to become available... time: {current_time}"
            # )
            rospy.sleep(5)
            published_topics = [t[0] for t in rospy.get_published_topics()]

        topic_type = rospy.get_published_topics()[
            published_topics.index(topic)
        ][1]
        self.subscribers[topic] = rospy.Subscriber(
            name=topic, data_class=String, callback=self.callback
        )

    def callback(self, message):
        """Callback function for the subscriber

        :param message: the message received from the topic

        We will parse the message and update the data in the cache.
        """
        logger.info(f"Received message from topic: {message}")


def initialize_all_robots_corresponding_nodes():
    """Initialize all the robots' corresponding nodes when the server starts.

    The function will create a process for each robot. Each process will create a ROS node
    and subscribe to the topics that the robot publishes.

    """
    db = SessionLocal()
    robots = crud.get_multi(db)
    process_list = []
    for robot in robots:
        robot = Robot.from_orm(robot)
        nodename = robot.name
        process = multiprocessing.Process(
            target=run_node, args=(nodename, ros_port_queue)
        )
        process_list.append(process)
        process.start()

    return process_list


def run_node(nodename, ros_port_queue):
    """Run the ROS node

    In this function, we will create a ROS node and initialize it. The node will subscribe
    to the robot's topics.

    :param nodename: the name of the node.
    :param ros_port_queue: We use a multiprocessing.Queue to store the available port and
    pass it to the function. And we need to check if the queue is empty before creating the
    node.
    """
    if ros_port_queue.empty():
        logger.error("No available port for ROS node")
        return
    xmlrpc_port = ros_port_queue.get()
    tcpros_port = ros_port_queue.get()
    logger.debug(f"Creating node: {nodename}")
    logger.debug(f"xmlrpc_port: {xmlrpc_port}")
    logger.debug(f"tcpros_port: {tcpros_port}")
    node = Node(nodename, xmlrpc_port, tcpros_port)
    node.initialize()
    while not rospy.is_shutdown():
        rospy.spin()
