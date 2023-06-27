; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude VelocityControl-request.msg.html

(cl:defclass <VelocityControl-request> (roslisp-msg-protocol:ros-message)
  ((velocity_f
    :reader velocity_f
    :initarg :velocity_f
    :type cl:float
    :initform 0.0))
)

(cl:defclass VelocityControl-request (<VelocityControl-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VelocityControl-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VelocityControl-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<VelocityControl-request> is deprecated: use common-srv:VelocityControl-request instead.")))

(cl:ensure-generic-function 'velocity_f-val :lambda-list '(m))
(cl:defmethod velocity_f-val ((m <VelocityControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:velocity_f-val is deprecated.  Use common-srv:velocity_f instead.")
  (velocity_f m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VelocityControl-request>) ostream)
  "Serializes a message object of type '<VelocityControl-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocity_f))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VelocityControl-request>) istream)
  "Deserializes a message object of type '<VelocityControl-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity_f) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VelocityControl-request>)))
  "Returns string type for a service object of type '<VelocityControl-request>"
  "common/VelocityControlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VelocityControl-request)))
  "Returns string type for a service object of type 'VelocityControl-request"
  "common/VelocityControlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VelocityControl-request>)))
  "Returns md5sum for a message object of type '<VelocityControl-request>"
  "c2220f86ebacca2a046f47fb48d0d40f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VelocityControl-request)))
  "Returns md5sum for a message object of type 'VelocityControl-request"
  "c2220f86ebacca2a046f47fb48d0d40f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VelocityControl-request>)))
  "Returns full string definition for message of type '<VelocityControl-request>"
  (cl:format cl:nil "float32 velocity_f #速度控制~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VelocityControl-request)))
  "Returns full string definition for message of type 'VelocityControl-request"
  (cl:format cl:nil "float32 velocity_f #速度控制~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VelocityControl-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VelocityControl-request>))
  "Converts a ROS message object to a list"
  (cl:list 'VelocityControl-request
    (cl:cons ':velocity_f (velocity_f msg))
))
;//! \htmlinclude VelocityControl-response.msg.html

(cl:defclass <VelocityControl-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass VelocityControl-response (<VelocityControl-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VelocityControl-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VelocityControl-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<VelocityControl-response> is deprecated: use common-srv:VelocityControl-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <VelocityControl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))

(cl:ensure-generic-function 'err_msg-val :lambda-list '(m))
(cl:defmethod err_msg-val ((m <VelocityControl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:err_msg-val is deprecated.  Use common-srv:err_msg instead.")
  (err_msg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VelocityControl-response>) ostream)
  "Serializes a message object of type '<VelocityControl-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VelocityControl-response>) istream)
  "Deserializes a message object of type '<VelocityControl-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VelocityControl-response>)))
  "Returns string type for a service object of type '<VelocityControl-response>"
  "common/VelocityControlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VelocityControl-response)))
  "Returns string type for a service object of type 'VelocityControl-response"
  "common/VelocityControlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VelocityControl-response>)))
  "Returns md5sum for a message object of type '<VelocityControl-response>"
  "c2220f86ebacca2a046f47fb48d0d40f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VelocityControl-response)))
  "Returns md5sum for a message object of type 'VelocityControl-response"
  "c2220f86ebacca2a046f47fb48d0d40f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VelocityControl-response>)))
  "Returns full string definition for message of type '<VelocityControl-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%string err_msg~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VelocityControl-response)))
  "Returns full string definition for message of type 'VelocityControl-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%string err_msg~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VelocityControl-response>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'err_msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VelocityControl-response>))
  "Converts a ROS message object to a list"
  (cl:list 'VelocityControl-response
    (cl:cons ':status_code (status_code msg))
    (cl:cons ':err_msg (err_msg msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'VelocityControl)))
  'VelocityControl-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'VelocityControl)))
  'VelocityControl-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VelocityControl)))
  "Returns string type for a service object of type '<VelocityControl>"
  "common/VelocityControl")