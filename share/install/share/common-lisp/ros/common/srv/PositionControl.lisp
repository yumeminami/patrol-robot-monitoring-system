; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude PositionControl-request.msg.html

(cl:defclass <PositionControl-request> (roslisp-msg-protocol:ros-message)
  ((position_control_type
    :reader position_control_type
    :initarg :position_control_type
    :type cl:integer
    :initform 0)
   (target_position_f
    :reader target_position_f
    :initarg :target_position_f
    :type cl:float
    :initform 0.0)
   (velocity_f
    :reader velocity_f
    :initarg :velocity_f
    :type cl:float
    :initform 0.0))
)

(cl:defclass PositionControl-request (<PositionControl-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PositionControl-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PositionControl-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<PositionControl-request> is deprecated: use common-srv:PositionControl-request instead.")))

(cl:ensure-generic-function 'position_control_type-val :lambda-list '(m))
(cl:defmethod position_control_type-val ((m <PositionControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:position_control_type-val is deprecated.  Use common-srv:position_control_type instead.")
  (position_control_type m))

(cl:ensure-generic-function 'target_position_f-val :lambda-list '(m))
(cl:defmethod target_position_f-val ((m <PositionControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:target_position_f-val is deprecated.  Use common-srv:target_position_f instead.")
  (target_position_f m))

(cl:ensure-generic-function 'velocity_f-val :lambda-list '(m))
(cl:defmethod velocity_f-val ((m <PositionControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:velocity_f-val is deprecated.  Use common-srv:velocity_f instead.")
  (velocity_f m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PositionControl-request>) ostream)
  "Serializes a message object of type '<PositionControl-request>"
  (cl:let* ((signed (cl:slot-value msg 'position_control_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'target_position_f))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocity_f))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PositionControl-request>) istream)
  "Deserializes a message object of type '<PositionControl-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'position_control_type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'target_position_f) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity_f) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PositionControl-request>)))
  "Returns string type for a service object of type '<PositionControl-request>"
  "common/PositionControlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PositionControl-request)))
  "Returns string type for a service object of type 'PositionControl-request"
  "common/PositionControlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PositionControl-request>)))
  "Returns md5sum for a message object of type '<PositionControl-request>"
  "a9519dff92fdaba9780b7a4c059be1f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PositionControl-request)))
  "Returns md5sum for a message object of type 'PositionControl-request"
  "a9519dff92fdaba9780b7a4c059be1f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PositionControl-request>)))
  "Returns full string definition for message of type '<PositionControl-request>"
  (cl:format cl:nil "int32 position_control_type #0表示绝对位置 1表示相对位置~%float32 target_position_f #目标位置 单位：mm~%float32 velocity_f #速度 单位mm/s~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PositionControl-request)))
  "Returns full string definition for message of type 'PositionControl-request"
  (cl:format cl:nil "int32 position_control_type #0表示绝对位置 1表示相对位置~%float32 target_position_f #目标位置 单位：mm~%float32 velocity_f #速度 单位mm/s~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PositionControl-request>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PositionControl-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PositionControl-request
    (cl:cons ':position_control_type (position_control_type msg))
    (cl:cons ':target_position_f (target_position_f msg))
    (cl:cons ':velocity_f (velocity_f msg))
))
;//! \htmlinclude PositionControl-response.msg.html

(cl:defclass <PositionControl-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass PositionControl-response (<PositionControl-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PositionControl-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PositionControl-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<PositionControl-response> is deprecated: use common-srv:PositionControl-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <PositionControl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))

(cl:ensure-generic-function 'err_msg-val :lambda-list '(m))
(cl:defmethod err_msg-val ((m <PositionControl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:err_msg-val is deprecated.  Use common-srv:err_msg instead.")
  (err_msg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PositionControl-response>) ostream)
  "Serializes a message object of type '<PositionControl-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PositionControl-response>) istream)
  "Deserializes a message object of type '<PositionControl-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PositionControl-response>)))
  "Returns string type for a service object of type '<PositionControl-response>"
  "common/PositionControlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PositionControl-response)))
  "Returns string type for a service object of type 'PositionControl-response"
  "common/PositionControlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PositionControl-response>)))
  "Returns md5sum for a message object of type '<PositionControl-response>"
  "a9519dff92fdaba9780b7a4c059be1f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PositionControl-response)))
  "Returns md5sum for a message object of type 'PositionControl-response"
  "a9519dff92fdaba9780b7a4c059be1f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PositionControl-response>)))
  "Returns full string definition for message of type '<PositionControl-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%string err_msg~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PositionControl-response)))
  "Returns full string definition for message of type 'PositionControl-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%string err_msg~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PositionControl-response>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'err_msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PositionControl-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PositionControl-response
    (cl:cons ':status_code (status_code msg))
    (cl:cons ':err_msg (err_msg msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PositionControl)))
  'PositionControl-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PositionControl)))
  'PositionControl-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PositionControl)))
  "Returns string type for a service object of type '<PositionControl>"
  "common/PositionControl")