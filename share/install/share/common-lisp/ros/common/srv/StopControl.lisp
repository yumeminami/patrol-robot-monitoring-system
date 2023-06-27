; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude StopControl-request.msg.html

(cl:defclass <StopControl-request> (roslisp-msg-protocol:ros-message)
  ((stop_type
    :reader stop_type
    :initarg :stop_type
    :type cl:integer
    :initform 0))
)

(cl:defclass StopControl-request (<StopControl-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StopControl-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StopControl-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<StopControl-request> is deprecated: use common-srv:StopControl-request instead.")))

(cl:ensure-generic-function 'stop_type-val :lambda-list '(m))
(cl:defmethod stop_type-val ((m <StopControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:stop_type-val is deprecated.  Use common-srv:stop_type instead.")
  (stop_type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StopControl-request>) ostream)
  "Serializes a message object of type '<StopControl-request>"
  (cl:let* ((signed (cl:slot-value msg 'stop_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StopControl-request>) istream)
  "Deserializes a message object of type '<StopControl-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stop_type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StopControl-request>)))
  "Returns string type for a service object of type '<StopControl-request>"
  "common/StopControlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StopControl-request)))
  "Returns string type for a service object of type 'StopControl-request"
  "common/StopControlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StopControl-request>)))
  "Returns md5sum for a message object of type '<StopControl-request>"
  "13e671c4ccd3de8f6fad86254c69924f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StopControl-request)))
  "Returns md5sum for a message object of type 'StopControl-request"
  "13e671c4ccd3de8f6fad86254c69924f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StopControl-request>)))
  "Returns full string definition for message of type '<StopControl-request>"
  (cl:format cl:nil "int32 stop_type #0 stop 1 stop 2 kill~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StopControl-request)))
  "Returns full string definition for message of type 'StopControl-request"
  (cl:format cl:nil "int32 stop_type #0 stop 1 stop 2 kill~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StopControl-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StopControl-request>))
  "Converts a ROS message object to a list"
  (cl:list 'StopControl-request
    (cl:cons ':stop_type (stop_type msg))
))
;//! \htmlinclude StopControl-response.msg.html

(cl:defclass <StopControl-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0)
   (err_msg
    :reader err_msg
    :initarg :err_msg
    :type cl:string
    :initform ""))
)

(cl:defclass StopControl-response (<StopControl-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StopControl-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StopControl-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<StopControl-response> is deprecated: use common-srv:StopControl-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <StopControl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))

(cl:ensure-generic-function 'err_msg-val :lambda-list '(m))
(cl:defmethod err_msg-val ((m <StopControl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:err_msg-val is deprecated.  Use common-srv:err_msg instead.")
  (err_msg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StopControl-response>) ostream)
  "Serializes a message object of type '<StopControl-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'err_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'err_msg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StopControl-response>) istream)
  "Deserializes a message object of type '<StopControl-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'err_msg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'err_msg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StopControl-response>)))
  "Returns string type for a service object of type '<StopControl-response>"
  "common/StopControlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StopControl-response)))
  "Returns string type for a service object of type 'StopControl-response"
  "common/StopControlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StopControl-response>)))
  "Returns md5sum for a message object of type '<StopControl-response>"
  "13e671c4ccd3de8f6fad86254c69924f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StopControl-response)))
  "Returns md5sum for a message object of type 'StopControl-response"
  "13e671c4ccd3de8f6fad86254c69924f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StopControl-response>)))
  "Returns full string definition for message of type '<StopControl-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%string err_msg~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StopControl-response)))
  "Returns full string definition for message of type 'StopControl-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%string err_msg~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StopControl-response>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'err_msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StopControl-response>))
  "Converts a ROS message object to a list"
  (cl:list 'StopControl-response
    (cl:cons ':status_code (status_code msg))
    (cl:cons ':err_msg (err_msg msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'StopControl)))
  'StopControl-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'StopControl)))
  'StopControl-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StopControl)))
  "Returns string type for a service object of type '<StopControl>"
  "common/StopControl")