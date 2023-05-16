# Copyright 2016 Open Source Robotics Foundation, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from example_interfaces.srv import AddTwoInts

import rclpy
from rclpy.node import Node


class MinimalClientAsync(Node):
    def __init__(self):
        super().__init__("minimal_client_async")

    def send_request(self):
        self.cli = self.create_client(AddTwoInts, "add_two_ints")
        times = 0
        while not self.cli.wait_for_service(timeout_sec=1.0):
            if times == 5:
                self.get_logger().info("service not available.")
                return
            self.get_logger().info("service not available, waiting again...")
        self.req = AddTwoInts.Request()
        self.req.a = 41
        self.req.b = 1
        self.future = self.cli.call_async(self.req)
        rclpy.spin_until_future_complete(self, self.future)
        if self.future.done():
            try:
                response = self.future.result()
            except Exception as e:
                self.get_logger().info("Service call failed %r" % (e,))
            else:
                self.get_logger().info(
                    "Result of add_two_ints: for %d + %d = %d"
                    % (self.req.a, self.req.b, response.sum)
                )


def main(args=None):
    rclpy.init(args=args)

    minimal_client = MinimalClientAsync()
    minimal_client.send_request()

    minimal_client.destroy_node()
    rclpy.shutdown()


if __name__ == "__main__":
    main()
