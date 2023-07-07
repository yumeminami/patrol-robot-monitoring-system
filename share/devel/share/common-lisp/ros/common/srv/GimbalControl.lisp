; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude GimbalControl-request.msg.html

(cl:defclass <GimbalControl-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:integer
    :initform 0)
   (preset_index
    :reader preset_index
    :initarg :preset_index
    :type cl:integer
    :initform 0))
)

(cl:defclass GimbalControl-request (<GimbalControl-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GimbalControl-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GimbalControl-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<GimbalControl-request> is deprecated: use common-srv:GimbalControl-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <GimbalControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:command-val is deprecated.  Use common-srv:command instead.")
  (command m))

(cl:ensure-generic-function 'preset_index-val :lambda-list '(m))
(cl:defmethod preset_index-val ((m <GimbalControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:preset_index-val is deprecated.  Use common-srv:preset_index instead.")
  (preset_index m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GimbalControl-request>) ostream)
  "Serializes a message object of type '<GimbalControl-request>"
  (cl:let* ((signed (cl:slot-value msg 'command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'preset_index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GimbalControl-request>) istream)
  "Deserializes a message object of type '<GimbalControl-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'preset_index) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GimbalControl-request>)))
  "Returns string type for a service object of type '<GimbalControl-request>"
  "common/GimbalControlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GimbalControl-request)))
  "Returns string type for a service object of type 'GimbalControl-request"
  "common/GimbalControlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GimbalControl-request>)))
  "Returns md5sum for a message object of type '<GimbalControl-request>"
  "d0c48081341d4177031e0d1e7e86365a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GimbalControl-request)))
  "Returns md5sum for a message object of type 'GimbalControl-request"
  "d0c48081341d4177031e0d1e7e86365a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GimbalControl-request>)))
  "Returns full string definition for message of type '<GimbalControl-request>"
  (cl:format cl:nil "int32 command #云台预置点命令 ~%#1:GOTO_PRESET移动到预置点~%#2:SET_PRESET 设置预置点~%#3:CLE_PRESET 清除预置点~%~%int32 preset_index #预置点编号~%#去下面的网络界面设置预置点，移动好之后选择某个预置点按下设置符号即可设置~%#http://10.92.36.1/doc/page/config.asp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GimbalControl-request)))
  "Returns full string definition for message of type 'GimbalControl-request"
  (cl:format cl:nil "int32 command #云台预置点命令 ~%#1:GOTO_PRESET移动到预置点~%#2:SET_PRESET 设置预置点~%#3:CLE_PRESET 清除预置点~%~%int32 preset_index #预置点编号~%#去下面的网络界面设置预置点，移动好之后选择某个预置点按下设置符号即可设置~%#http://10.92.36.1/doc/page/config.asp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GimbalControl-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GimbalControl-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GimbalControl-request
    (cl:cons ':command (command msg))
    (cl:cons ':preset_index (preset_index msg))
))
;//! \htmlinclude GimbalControl-response.msg.html

(cl:defclass <GimbalControl-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0))
)

(cl:defclass GimbalControl-response (<GimbalControl-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GimbalControl-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GimbalControl-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<GimbalControl-response> is deprecated: use common-srv:GimbalControl-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <GimbalControl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GimbalControl-response>) ostream)
  "Serializes a message object of type '<GimbalControl-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GimbalControl-response>) istream)
  "Deserializes a message object of type '<GimbalControl-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GimbalControl-response>)))
  "Returns string type for a service object of type '<GimbalControl-response>"
  "common/GimbalControlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GimbalControl-response)))
  "Returns string type for a service object of type 'GimbalControl-response"
  "common/GimbalControlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GimbalControl-response>)))
  "Returns md5sum for a message object of type '<GimbalControl-response>"
  "d0c48081341d4177031e0d1e7e86365a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GimbalControl-response)))
  "Returns md5sum for a message object of type 'GimbalControl-response"
  "d0c48081341d4177031e0d1e7e86365a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GimbalControl-response>)))
  "Returns full string definition for message of type '<GimbalControl-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GimbalControl-response)))
  "Returns full string definition for message of type 'GimbalControl-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GimbalControl-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GimbalControl-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GimbalControl-response
    (cl:cons ':status_code (status_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GimbalControl)))
  'GimbalControl-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GimbalControl)))
  'GimbalControl-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GimbalControl)))
  "Returns string type for a service object of type '<GimbalControl>"
  "common/GimbalControl")