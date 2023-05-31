; Auto-generated. Do not edit!


(cl:in-package ros_interfaces-msg)


;//! \htmlinclude velocity_command.msg.html

(cl:defclass <velocity_command> (roslisp-msg-protocol:ros-message)
  ((velocity_f
    :reader velocity_f
    :initarg :velocity_f
    :type cl:float
    :initform 0.0))
)

(cl:defclass velocity_command (<velocity_command>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <velocity_command>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'velocity_command)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_interfaces-msg:<velocity_command> is deprecated: use ros_interfaces-msg:velocity_command instead.")))

(cl:ensure-generic-function 'velocity_f-val :lambda-list '(m))
(cl:defmethod velocity_f-val ((m <velocity_command>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_interfaces-msg:velocity_f-val is deprecated.  Use ros_interfaces-msg:velocity_f instead.")
  (velocity_f m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <velocity_command>) ostream)
  "Serializes a message object of type '<velocity_command>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocity_f))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <velocity_command>) istream)
  "Deserializes a message object of type '<velocity_command>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity_f) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<velocity_command>)))
  "Returns string type for a message object of type '<velocity_command>"
  "ros_interfaces/velocity_command")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'velocity_command)))
  "Returns string type for a message object of type 'velocity_command"
  "ros_interfaces/velocity_command")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<velocity_command>)))
  "Returns md5sum for a message object of type '<velocity_command>"
  "67298657c9ef3f2768b496520fa1fd62")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'velocity_command)))
  "Returns md5sum for a message object of type 'velocity_command"
  "67298657c9ef3f2768b496520fa1fd62")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<velocity_command>)))
  "Returns full string definition for message of type '<velocity_command>"
  (cl:format cl:nil "float32 velocity_f #速度控制~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'velocity_command)))
  "Returns full string definition for message of type 'velocity_command"
  (cl:format cl:nil "float32 velocity_f #速度控制~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <velocity_command>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <velocity_command>))
  "Converts a ROS message object to a list"
  (cl:list 'velocity_command
    (cl:cons ':velocity_f (velocity_f msg))
))
