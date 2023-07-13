; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude PatrolControl-request.msg.html

(cl:defclass <PatrolControl-request> (roslisp-msg-protocol:ros-message)
  ((patrol_command
    :reader patrol_command
    :initarg :patrol_command
    :type cl:integer
    :initform 0)
   (xml_data
    :reader xml_data
    :initarg :xml_data
    :type cl:string
    :initform ""))
)

(cl:defclass PatrolControl-request (<PatrolControl-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PatrolControl-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PatrolControl-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<PatrolControl-request> is deprecated: use common-srv:PatrolControl-request instead.")))

(cl:ensure-generic-function 'patrol_command-val :lambda-list '(m))
(cl:defmethod patrol_command-val ((m <PatrolControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:patrol_command-val is deprecated.  Use common-srv:patrol_command instead.")
  (patrol_command m))

(cl:ensure-generic-function 'xml_data-val :lambda-list '(m))
(cl:defmethod xml_data-val ((m <PatrolControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:xml_data-val is deprecated.  Use common-srv:xml_data instead.")
  (xml_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PatrolControl-request>) ostream)
  "Serializes a message object of type '<PatrolControl-request>"
  (cl:let* ((signed (cl:slot-value msg 'patrol_command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'xml_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'xml_data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PatrolControl-request>) istream)
  "Deserializes a message object of type '<PatrolControl-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'patrol_command) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'xml_data) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'xml_data) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PatrolControl-request>)))
  "Returns string type for a service object of type '<PatrolControl-request>"
  "common/PatrolControlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PatrolControl-request)))
  "Returns string type for a service object of type 'PatrolControl-request"
  "common/PatrolControlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PatrolControl-request>)))
  "Returns md5sum for a message object of type '<PatrolControl-request>"
  "fabfef9b528c8f61881ef7f060cb0b13")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PatrolControl-request)))
  "Returns md5sum for a message object of type 'PatrolControl-request"
  "fabfef9b528c8f61881ef7f060cb0b13")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PatrolControl-request>)))
  "Returns full string definition for message of type '<PatrolControl-request>"
  (cl:format cl:nil "int32 patrol_command ~%#0结束巡检节点 1开启巡检节点+更新任务xml文件~%#任务进行过程中 patrol_state为2代表巡检任务正在执行~%#               patrol_state为0代表节点处于待命状态，可以随时开启巡检~%string xml_data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PatrolControl-request)))
  "Returns full string definition for message of type 'PatrolControl-request"
  (cl:format cl:nil "int32 patrol_command ~%#0结束巡检节点 1开启巡检节点+更新任务xml文件~%#任务进行过程中 patrol_state为2代表巡检任务正在执行~%#               patrol_state为0代表节点处于待命状态，可以随时开启巡检~%string xml_data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PatrolControl-request>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'xml_data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PatrolControl-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PatrolControl-request
    (cl:cons ':patrol_command (patrol_command msg))
    (cl:cons ':xml_data (xml_data msg))
))
;//! \htmlinclude PatrolControl-response.msg.html

(cl:defclass <PatrolControl-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0))
)

(cl:defclass PatrolControl-response (<PatrolControl-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PatrolControl-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PatrolControl-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<PatrolControl-response> is deprecated: use common-srv:PatrolControl-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <PatrolControl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PatrolControl-response>) ostream)
  "Serializes a message object of type '<PatrolControl-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PatrolControl-response>) istream)
  "Deserializes a message object of type '<PatrolControl-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PatrolControl-response>)))
  "Returns string type for a service object of type '<PatrolControl-response>"
  "common/PatrolControlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PatrolControl-response)))
  "Returns string type for a service object of type 'PatrolControl-response"
  "common/PatrolControlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PatrolControl-response>)))
  "Returns md5sum for a message object of type '<PatrolControl-response>"
  "fabfef9b528c8f61881ef7f060cb0b13")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PatrolControl-response)))
  "Returns md5sum for a message object of type 'PatrolControl-response"
  "fabfef9b528c8f61881ef7f060cb0b13")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PatrolControl-response>)))
  "Returns full string definition for message of type '<PatrolControl-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PatrolControl-response)))
  "Returns full string definition for message of type 'PatrolControl-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PatrolControl-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PatrolControl-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PatrolControl-response
    (cl:cons ':status_code (status_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PatrolControl)))
  'PatrolControl-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PatrolControl)))
  'PatrolControl-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PatrolControl)))
  "Returns string type for a service object of type '<PatrolControl>"
  "common/PatrolControl")