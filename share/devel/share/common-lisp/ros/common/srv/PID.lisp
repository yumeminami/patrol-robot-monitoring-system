; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude PID-request.msg.html

(cl:defclass <PID-request> (roslisp-msg-protocol:ros-message)
  ((kp
    :reader kp
    :initarg :kp
    :type cl:float
    :initform 0.0)
   (ki
    :reader ki
    :initarg :ki
    :type cl:float
    :initform 0.0)
   (kd
    :reader kd
    :initarg :kd
    :type cl:float
    :initform 0.0))
)

(cl:defclass PID-request (<PID-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PID-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PID-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<PID-request> is deprecated: use common-srv:PID-request instead.")))

(cl:ensure-generic-function 'kp-val :lambda-list '(m))
(cl:defmethod kp-val ((m <PID-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:kp-val is deprecated.  Use common-srv:kp instead.")
  (kp m))

(cl:ensure-generic-function 'ki-val :lambda-list '(m))
(cl:defmethod ki-val ((m <PID-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:ki-val is deprecated.  Use common-srv:ki instead.")
  (ki m))

(cl:ensure-generic-function 'kd-val :lambda-list '(m))
(cl:defmethod kd-val ((m <PID-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:kd-val is deprecated.  Use common-srv:kd instead.")
  (kd m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PID-request>) ostream)
  "Serializes a message object of type '<PID-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'kp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ki))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'kd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PID-request>) istream)
  "Deserializes a message object of type '<PID-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'kp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ki) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'kd) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PID-request>)))
  "Returns string type for a service object of type '<PID-request>"
  "common/PIDRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PID-request)))
  "Returns string type for a service object of type 'PID-request"
  "common/PIDRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PID-request>)))
  "Returns md5sum for a message object of type '<PID-request>"
  "a6078b1c1836292d943f376c320c591d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PID-request)))
  "Returns md5sum for a message object of type 'PID-request"
  "a6078b1c1836292d943f376c320c591d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PID-request>)))
  "Returns full string definition for message of type '<PID-request>"
  (cl:format cl:nil "float32 kp~%float32 ki~%float32 kd~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PID-request)))
  "Returns full string definition for message of type 'PID-request"
  (cl:format cl:nil "float32 kp~%float32 ki~%float32 kd~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PID-request>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PID-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PID-request
    (cl:cons ':kp (kp msg))
    (cl:cons ':ki (ki msg))
    (cl:cons ':kd (kd msg))
))
;//! \htmlinclude PID-response.msg.html

(cl:defclass <PID-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0))
)

(cl:defclass PID-response (<PID-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PID-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PID-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<PID-response> is deprecated: use common-srv:PID-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <PID-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PID-response>) ostream)
  "Serializes a message object of type '<PID-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PID-response>) istream)
  "Deserializes a message object of type '<PID-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PID-response>)))
  "Returns string type for a service object of type '<PID-response>"
  "common/PIDResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PID-response)))
  "Returns string type for a service object of type 'PID-response"
  "common/PIDResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PID-response>)))
  "Returns md5sum for a message object of type '<PID-response>"
  "a6078b1c1836292d943f376c320c591d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PID-response)))
  "Returns md5sum for a message object of type 'PID-response"
  "a6078b1c1836292d943f376c320c591d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PID-response>)))
  "Returns full string definition for message of type '<PID-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PID-response)))
  "Returns full string definition for message of type 'PID-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PID-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PID-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PID-response
    (cl:cons ':status_code (status_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PID)))
  'PID-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PID)))
  'PID-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PID)))
  "Returns string type for a service object of type '<PID>"
  "common/PID")