import rospy
from std_msgs.msg import String
from app.utils.log import logger,log_queue
from datetime import datetime
import logging



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

    def initialize(self):
        logger.info("Initializing node...")
        self.create_subscribers()

    def create_subscribers(self):
        # TODO should query the database for get the robot's topics

        # Create multiple subscribers and associate them with topics
        topics = ["/topic1", "/topic2"]  # List of topics to subscribe to
        for topic in topics:
            self.wait_for_topic(topic)
    
    def wait_for_topic(self, topic):
        published_topics = [t[0] for t in rospy.get_published_topics()]
        while topic not in published_topics:
            current_time = datetime.now().strftime("%H:%M:%S")
            logger.info(f"Published topics: {published_topics}")
            logger.info(f"Waiting for topic '{topic}' to become available... time: {current_time}")
            rospy.sleep(1)
            published_topics = [t[0] for t in rospy.get_published_topics()]
        
        self.subscribers[topic] = rospy.Subscriber(name=topic, data_class=String, callback=self.callback)

    def callback(self, message):
        logger.info(f"Received message from topic: {message}")


def create_robot_daemon(nodename, xmlrpc_port, tcpros_port):
    node = Node(nodename, xmlrpc_port, tcpros_port)
    node.initialize()
    rospy.spin()

