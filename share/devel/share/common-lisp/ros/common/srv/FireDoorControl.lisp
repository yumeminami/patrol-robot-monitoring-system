; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude FireDoorControl-request.msg.html

(cl:defclass <FireDoorControl-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:integer
    :initform 0))
)

(cl:defclass FireDoorControl-request (<FireDoorControl-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FireDoorControl-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FireDoorControl-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<FireDoorControl-request> is deprecated: use common-srv:FireDoorControl-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <FireDoorControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:command-val is deprecated.  Use common-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FireDoorControl-request>) ostream)
  "Serializes a message object of type '<FireDoorControl-request>"
  (cl:let* ((signed (cl:slot-value msg 'command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FireDoorControl-request>) istream)
  "Deserializes a message object of type '<FireDoorControl-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FireDoorControl-request>)))
  "Returns string type for a service object of type '<FireDoorControl-request>"
  "common/FireDoorControlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FireDoorControl-request)))
  "Returns string type for a service object of type 'FireDoorControl-request"
  "common/FireDoorControlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FireDoorControl-request>)))
  "Returns md5sum for a message object of type '<FireDoorControl-request>"
  "26b9aeb0208f157943a22b6e6a605823")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FireDoorControl-request)))
  "Returns md5sum for a message object of type 'FireDoorControl-request"
  "26b9aeb0208f157943a22b6e6a605823")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FireDoorControl-request>)))
  "Returns full string definition for message of type '<FireDoorControl-request>"
  (cl:format cl:nil "int32 command ~%# 0关闭 1开启~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FireDoorControl-request)))
  "Returns full string definition for message of type 'FireDoorControl-request"
  (cl:format cl:nil "int32 command ~%# 0关闭 1开启~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FireDoorControl-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FireDoorControl-request>))
  "Converts a ROS message object to a list"
  (cl:list 'FireDoorControl-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude FireDoorControl-response.msg.html

(cl:defclass <FireDoorControl-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0))
)

(cl:defclass FireDoorControl-response (<FireDoorControl-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FireDoorControl-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FireDoorControl-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<FireDoorControl-response> is deprecated: use common-srv:FireDoorControl-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <FireDoorControl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FireDoorControl-response>) ostream)
  "Serializes a message object of type '<FireDoorControl-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FireDoorControl-response>) istream)
  "Deserializes a message object of type '<FireDoorControl-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FireDoorControl-response>)))
  "Returns string type for a service object of type '<FireDoorControl-response>"
  "common/FireDoorControlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FireDoorControl-response)))
  "Returns string type for a service object of type 'FireDoorControl-response"
  "common/FireDoorControlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FireDoorControl-response>)))
  "Returns md5sum for a message object of type '<FireDoorControl-response>"
  "26b9aeb0208f157943a22b6e6a605823")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FireDoorControl-response)))
  "Returns md5sum for a message object of type 'FireDoorControl-response"
  "26b9aeb0208f157943a22b6e6a605823")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FireDoorControl-response>)))
  "Returns full string definition for message of type '<FireDoorControl-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FireDoorControl-response)))
  "Returns full string definition for message of type 'FireDoorControl-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FireDoorControl-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FireDoorControl-response>))
  "Converts a ROS message object to a list"
  (cl:list 'FireDoorControl-response
    (cl:cons ':status_code (status_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'FireDoorControl)))
  'FireDoorControl-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'FireDoorControl)))
  'FireDoorControl-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FireDoorControl)))
  "Returns string type for a service object of type '<FireDoorControl>"
  "common/FireDoorControl")