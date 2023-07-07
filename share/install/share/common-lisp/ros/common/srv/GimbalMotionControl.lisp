; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude GimbalMotionControl-request.msg.html

(cl:defclass <GimbalMotionControl-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:integer
    :initform 0))
)

(cl:defclass GimbalMotionControl-request (<GimbalMotionControl-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GimbalMotionControl-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GimbalMotionControl-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<GimbalMotionControl-request> is deprecated: use common-srv:GimbalMotionControl-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <GimbalMotionControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:command-val is deprecated.  Use common-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GimbalMotionControl-request>) ostream)
  "Serializes a message object of type '<GimbalMotionControl-request>"
  (cl:let* ((signed (cl:slot-value msg 'command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GimbalMotionControl-request>) istream)
  "Deserializes a message object of type '<GimbalMotionControl-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GimbalMotionControl-request>)))
  "Returns string type for a service object of type '<GimbalMotionControl-request>"
  "common/GimbalMotionControlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GimbalMotionControl-request)))
  "Returns string type for a service object of type 'GimbalMotionControl-request"
  "common/GimbalMotionControlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GimbalMotionControl-request>)))
  "Returns md5sum for a message object of type '<GimbalMotionControl-request>"
  "26b9aeb0208f157943a22b6e6a605823")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GimbalMotionControl-request)))
  "Returns md5sum for a message object of type 'GimbalMotionControl-request"
  "26b9aeb0208f157943a22b6e6a605823")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GimbalMotionControl-request>)))
  "Returns full string definition for message of type '<GimbalMotionControl-request>"
  (cl:format cl:nil "int32 command ~%#   云台运动命令及对应编号~%#--------------------------------~%# UP_LEFT   TILI_UP    UP_RIGHT~%# PAN_LEFT             PAN_RIGHT~%# DOWN_LEFT TILI_DOWN  DOWN_RIGHT~%#--------------------------------~%#   1         2          3~%#   4                    6~%#   7         8          9~%#--------------------------------~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GimbalMotionControl-request)))
  "Returns full string definition for message of type 'GimbalMotionControl-request"
  (cl:format cl:nil "int32 command ~%#   云台运动命令及对应编号~%#--------------------------------~%# UP_LEFT   TILI_UP    UP_RIGHT~%# PAN_LEFT             PAN_RIGHT~%# DOWN_LEFT TILI_DOWN  DOWN_RIGHT~%#--------------------------------~%#   1         2          3~%#   4                    6~%#   7         8          9~%#--------------------------------~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GimbalMotionControl-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GimbalMotionControl-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GimbalMotionControl-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude GimbalMotionControl-response.msg.html

(cl:defclass <GimbalMotionControl-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0))
)

(cl:defclass GimbalMotionControl-response (<GimbalMotionControl-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GimbalMotionControl-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GimbalMotionControl-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<GimbalMotionControl-response> is deprecated: use common-srv:GimbalMotionControl-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <GimbalMotionControl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GimbalMotionControl-response>) ostream)
  "Serializes a message object of type '<GimbalMotionControl-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GimbalMotionControl-response>) istream)
  "Deserializes a message object of type '<GimbalMotionControl-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GimbalMotionControl-response>)))
  "Returns string type for a service object of type '<GimbalMotionControl-response>"
  "common/GimbalMotionControlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GimbalMotionControl-response)))
  "Returns string type for a service object of type 'GimbalMotionControl-response"
  "common/GimbalMotionControlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GimbalMotionControl-response>)))
  "Returns md5sum for a message object of type '<GimbalMotionControl-response>"
  "26b9aeb0208f157943a22b6e6a605823")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GimbalMotionControl-response)))
  "Returns md5sum for a message object of type 'GimbalMotionControl-response"
  "26b9aeb0208f157943a22b6e6a605823")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GimbalMotionControl-response>)))
  "Returns full string definition for message of type '<GimbalMotionControl-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GimbalMotionControl-response)))
  "Returns full string definition for message of type 'GimbalMotionControl-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GimbalMotionControl-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GimbalMotionControl-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GimbalMotionControl-response
    (cl:cons ':status_code (status_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GimbalMotionControl)))
  'GimbalMotionControl-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GimbalMotionControl)))
  'GimbalMotionControl-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GimbalMotionControl)))
  "Returns string type for a service object of type '<GimbalMotionControl>"
  "common/GimbalMotionControl")