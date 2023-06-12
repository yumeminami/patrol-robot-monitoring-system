import logging
from datetime import datetime

import rospy
from std_msgs.msg import String

from app.utils.log import logger, log_queue
from app.db.database import SessionLocal
from app.crud.robots import robot as crud
from app.schemas.robots import Robot
from app.schemas.sensors import Sensor
from app.db.redis import redis_client


class Node:
    def __init__(self, nodename, xmlrpc_port, tcpros_port):
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
        # Create a list of topics to subscribe robots' data
        db = SessionLocal()
        robots = crud.get_multi(db)
        topics = []
        for robot in robots:
            robot = Robot.from_orm(robot)
            sensors = robot.sensors
            for sensor in sensors:
                topic = "/{robot}/{sensor}".format(
                    robot=robot.name, sensor=sensor.name
                )
                topics.append(topic)
            logger.info(f"Robot: {robot}")
        # Create multiple subscribers and associate them with topics
        logger.info(f"Subscribing to topics: {topics}")
        for topic in topics:
            self.wait_for_topic(topic)

    def wait_for_topic(self, topic):
        published_topics = [t[0] for t in rospy.get_published_topics()]
        while topic not in published_topics:
            current_time = datetime.now().strftime("%H:%M:%S")
            logger.debug(
                f"Waiting for topic '{topic}' to become available... time: {current_time}"
            )
            rospy.sleep(5)
            published_topics = [t[0] for t in rospy.get_published_topics()]

        topic_type = rospy.get_published_topics()[
            published_topics.index(topic)
        ][1]
        self.subscribers[topic] = rospy.Subscriber(
            name=topic, data_class=String, callback=self.callback
        )

    def callback(self, message):
        logger.info(f"Received message from topic: {message}")
        # get the robot data from the topic and update the cache


def create_robot_daemon(nodename, xmlrpc_port, tcpros_port):
    node = Node(nodename, xmlrpc_port, tcpros_port)
    node.initialize()
    rospy.spin()
