; Auto-generated. Do not edit!


(cl:in-package zj_robot-srv)


;//! \htmlinclude gimbalcontrol-request.msg.html

(cl:defclass <gimbalcontrol-request> (roslisp-msg-protocol:ros-message)
  ((dwPTZCommand
    :reader dwPTZCommand
    :initarg :dwPTZCommand
    :type cl:integer
    :initform 0)
   (dwStop
    :reader dwStop
    :initarg :dwStop
    :type cl:integer
    :initform 0)
   (dwSpeed
    :reader dwSpeed
    :initarg :dwSpeed
    :type cl:integer
    :initform 0))
)

(cl:defclass gimbalcontrol-request (<gimbalcontrol-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gimbalcontrol-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gimbalcontrol-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name zj_robot-srv:<gimbalcontrol-request> is deprecated: use zj_robot-srv:gimbalcontrol-request instead.")))

(cl:ensure-generic-function 'dwPTZCommand-val :lambda-list '(m))
(cl:defmethod dwPTZCommand-val ((m <gimbalcontrol-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zj_robot-srv:dwPTZCommand-val is deprecated.  Use zj_robot-srv:dwPTZCommand instead.")
  (dwPTZCommand m))

(cl:ensure-generic-function 'dwStop-val :lambda-list '(m))
(cl:defmethod dwStop-val ((m <gimbalcontrol-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zj_robot-srv:dwStop-val is deprecated.  Use zj_robot-srv:dwStop instead.")
  (dwStop m))

(cl:ensure-generic-function 'dwSpeed-val :lambda-list '(m))
(cl:defmethod dwSpeed-val ((m <gimbalcontrol-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zj_robot-srv:dwSpeed-val is deprecated.  Use zj_robot-srv:dwSpeed instead.")
  (dwSpeed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gimbalcontrol-request>) ostream)
  "Serializes a message object of type '<gimbalcontrol-request>"
  (cl:let* ((signed (cl:slot-value msg 'dwPTZCommand)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'dwStop)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'dwSpeed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gimbalcontrol-request>) istream)
  "Deserializes a message object of type '<gimbalcontrol-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dwPTZCommand) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dwStop) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dwSpeed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gimbalcontrol-request>)))
  "Returns string type for a service object of type '<gimbalcontrol-request>"
  "zj_robot/gimbalcontrolRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gimbalcontrol-request)))
  "Returns string type for a service object of type 'gimbalcontrol-request"
  "zj_robot/gimbalcontrolRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gimbalcontrol-request>)))
  "Returns md5sum for a message object of type '<gimbalcontrol-request>"
  "fab33b108f2f3c6bfa0c6a4faa410fd2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gimbalcontrol-request)))
  "Returns md5sum for a message object of type 'gimbalcontrol-request"
  "fab33b108f2f3c6bfa0c6a4faa410fd2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gimbalcontrol-request>)))
  "Returns full string definition for message of type '<gimbalcontrol-request>"
  (cl:format cl:nil "# 客户端请求时发送的参数~%int32 dwPTZCommand~%int32 dwStop~%int32 dwSpeed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gimbalcontrol-request)))
  "Returns full string definition for message of type 'gimbalcontrol-request"
  (cl:format cl:nil "# 客户端请求时发送的参数~%int32 dwPTZCommand~%int32 dwStop~%int32 dwSpeed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gimbalcontrol-request>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gimbalcontrol-request>))
  "Converts a ROS message object to a list"
  (cl:list 'gimbalcontrol-request
    (cl:cons ':dwPTZCommand (dwPTZCommand msg))
    (cl:cons ':dwStop (dwStop msg))
    (cl:cons ':dwSpeed (dwSpeed msg))
))
;//! \htmlinclude gimbalcontrol-response.msg.html

(cl:defclass <gimbalcontrol-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass gimbalcontrol-response (<gimbalcontrol-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gimbalcontrol-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gimbalcontrol-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name zj_robot-srv:<gimbalcontrol-response> is deprecated: use zj_robot-srv:gimbalcontrol-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <gimbalcontrol-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zj_robot-srv:result-val is deprecated.  Use zj_robot-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gimbalcontrol-response>) ostream)
  "Serializes a message object of type '<gimbalcontrol-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gimbalcontrol-response>) istream)
  "Deserializes a message object of type '<gimbalcontrol-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gimbalcontrol-response>)))
  "Returns string type for a service object of type '<gimbalcontrol-response>"
  "zj_robot/gimbalcontrolResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gimbalcontrol-response)))
  "Returns string type for a service object of type 'gimbalcontrol-response"
  "zj_robot/gimbalcontrolResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gimbalcontrol-response>)))
  "Returns md5sum for a message object of type '<gimbalcontrol-response>"
  "fab33b108f2f3c6bfa0c6a4faa410fd2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gimbalcontrol-response)))
  "Returns md5sum for a message object of type 'gimbalcontrol-response"
  "fab33b108f2f3c6bfa0c6a4faa410fd2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gimbalcontrol-response>)))
  "Returns full string definition for message of type '<gimbalcontrol-response>"
  (cl:format cl:nil "# 云台控制结果~%bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gimbalcontrol-response)))
  "Returns full string definition for message of type 'gimbalcontrol-response"
  (cl:format cl:nil "# 云台控制结果~%bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gimbalcontrol-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gimbalcontrol-response>))
  "Converts a ROS message object to a list"
  (cl:list 'gimbalcontrol-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'gimbalcontrol)))
  'gimbalcontrol-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'gimbalcontrol)))
  'gimbalcontrol-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gimbalcontrol)))
  "Returns string type for a service object of type '<gimbalcontrol>"
  "zj_robot/gimbalcontrol")