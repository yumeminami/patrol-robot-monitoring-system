; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude PTZControl-request.msg.html

(cl:defclass <PTZControl-request> (roslisp-msg-protocol:ros-message)
  ((P
    :reader P
    :initarg :P
    :type cl:integer
    :initform 0)
   (T
    :reader T
    :initarg :T
    :type cl:integer
    :initform 0)
   (Z
    :reader Z
    :initarg :Z
    :type cl:integer
    :initform 0))
)

(cl:defclass PTZControl-request (<PTZControl-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PTZControl-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PTZControl-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<PTZControl-request> is deprecated: use common-srv:PTZControl-request instead.")))

(cl:ensure-generic-function 'P-val :lambda-list '(m))
(cl:defmethod P-val ((m <PTZControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:P-val is deprecated.  Use common-srv:P instead.")
  (P m))

(cl:ensure-generic-function 'T-val :lambda-list '(m))
(cl:defmethod T-val ((m <PTZControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:T-val is deprecated.  Use common-srv:T instead.")
  (T m))

(cl:ensure-generic-function 'Z-val :lambda-list '(m))
(cl:defmethod Z-val ((m <PTZControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:Z-val is deprecated.  Use common-srv:Z instead.")
  (Z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PTZControl-request>) ostream)
  "Serializes a message object of type '<PTZControl-request>"
  (cl:let* ((signed (cl:slot-value msg 'P)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'T)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'Z)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PTZControl-request>) istream)
  "Deserializes a message object of type '<PTZControl-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'P) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'T) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Z) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PTZControl-request>)))
  "Returns string type for a service object of type '<PTZControl-request>"
  "common/PTZControlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PTZControl-request)))
  "Returns string type for a service object of type 'PTZControl-request"
  "common/PTZControlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PTZControl-request>)))
  "Returns md5sum for a message object of type '<PTZControl-request>"
  "a267aab3f4294d8ab764debe91952069")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PTZControl-request)))
  "Returns md5sum for a message object of type 'PTZControl-request"
  "a267aab3f4294d8ab764debe91952069")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PTZControl-request>)))
  "Returns full string definition for message of type '<PTZControl-request>"
  (cl:format cl:nil "int32 P~%int32 T~%int32 Z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PTZControl-request)))
  "Returns full string definition for message of type 'PTZControl-request"
  (cl:format cl:nil "int32 P~%int32 T~%int32 Z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PTZControl-request>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PTZControl-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PTZControl-request
    (cl:cons ':P (P msg))
    (cl:cons ':T (T msg))
    (cl:cons ':Z (Z msg))
))
;//! \htmlinclude PTZControl-response.msg.html

(cl:defclass <PTZControl-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0))
)

(cl:defclass PTZControl-response (<PTZControl-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PTZControl-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PTZControl-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<PTZControl-response> is deprecated: use common-srv:PTZControl-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <PTZControl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PTZControl-response>) ostream)
  "Serializes a message object of type '<PTZControl-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PTZControl-response>) istream)
  "Deserializes a message object of type '<PTZControl-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PTZControl-response>)))
  "Returns string type for a service object of type '<PTZControl-response>"
  "common/PTZControlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PTZControl-response)))
  "Returns string type for a service object of type 'PTZControl-response"
  "common/PTZControlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PTZControl-response>)))
  "Returns md5sum for a message object of type '<PTZControl-response>"
  "a267aab3f4294d8ab764debe91952069")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PTZControl-response)))
  "Returns md5sum for a message object of type 'PTZControl-response"
  "a267aab3f4294d8ab764debe91952069")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PTZControl-response>)))
  "Returns full string definition for message of type '<PTZControl-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PTZControl-response)))
  "Returns full string definition for message of type 'PTZControl-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PTZControl-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PTZControl-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PTZControl-response
    (cl:cons ':status_code (status_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PTZControl)))
  'PTZControl-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PTZControl)))
  'PTZControl-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PTZControl)))
  "Returns string type for a service object of type '<PTZControl>"
  "common/PTZControl")