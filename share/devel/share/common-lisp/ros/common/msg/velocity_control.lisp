; Auto-generated. Do not edit!


(cl:in-package common-msg)


;//! \htmlinclude velocity_control.msg.html

(cl:defclass <velocity_control> (roslisp-msg-protocol:ros-message)
  ((velocity_f
    :reader velocity_f
    :initarg :velocity_f
    :type cl:float
    :initform 0.0))
)

(cl:defclass velocity_control (<velocity_control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <velocity_control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'velocity_control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-msg:<velocity_control> is deprecated: use common-msg:velocity_control instead.")))

(cl:ensure-generic-function 'velocity_f-val :lambda-list '(m))
(cl:defmethod velocity_f-val ((m <velocity_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:velocity_f-val is deprecated.  Use common-msg:velocity_f instead.")
  (velocity_f m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <velocity_control>) ostream)
  "Serializes a message object of type '<velocity_control>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocity_f))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <velocity_control>) istream)
  "Deserializes a message object of type '<velocity_control>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity_f) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<velocity_control>)))
  "Returns string type for a message object of type '<velocity_control>"
  "common/velocity_control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'velocity_control)))
  "Returns string type for a message object of type 'velocity_control"
  "common/velocity_control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<velocity_control>)))
  "Returns md5sum for a message object of type '<velocity_control>"
  "67298657c9ef3f2768b496520fa1fd62")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'velocity_control)))
  "Returns md5sum for a message object of type 'velocity_control"
  "67298657c9ef3f2768b496520fa1fd62")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<velocity_control>)))
  "Returns full string definition for message of type '<velocity_control>"
  (cl:format cl:nil "float32 velocity_f #速度控制~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'velocity_control)))
  "Returns full string definition for message of type 'velocity_control"
  (cl:format cl:nil "float32 velocity_f #速度控制~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <velocity_control>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <velocity_control>))
  "Converts a ROS message object to a list"
  (cl:list 'velocity_control
    (cl:cons ':velocity_f (velocity_f msg))
))
