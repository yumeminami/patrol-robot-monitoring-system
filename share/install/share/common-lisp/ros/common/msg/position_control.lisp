; Auto-generated. Do not edit!


(cl:in-package common-msg)


;//! \htmlinclude position_control.msg.html

(cl:defclass <position_control> (roslisp-msg-protocol:ros-message)
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

(cl:defclass position_control (<position_control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <position_control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'position_control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-msg:<position_control> is deprecated: use common-msg:position_control instead.")))

(cl:ensure-generic-function 'position_control_type-val :lambda-list '(m))
(cl:defmethod position_control_type-val ((m <position_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:position_control_type-val is deprecated.  Use common-msg:position_control_type instead.")
  (position_control_type m))

(cl:ensure-generic-function 'target_position_f-val :lambda-list '(m))
(cl:defmethod target_position_f-val ((m <position_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:target_position_f-val is deprecated.  Use common-msg:target_position_f instead.")
  (target_position_f m))

(cl:ensure-generic-function 'velocity_f-val :lambda-list '(m))
(cl:defmethod velocity_f-val ((m <position_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:velocity_f-val is deprecated.  Use common-msg:velocity_f instead.")
  (velocity_f m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <position_control>) ostream)
  "Serializes a message object of type '<position_control>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <position_control>) istream)
  "Deserializes a message object of type '<position_control>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<position_control>)))
  "Returns string type for a message object of type '<position_control>"
  "common/position_control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'position_control)))
  "Returns string type for a message object of type 'position_control"
  "common/position_control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<position_control>)))
  "Returns md5sum for a message object of type '<position_control>"
  "4b361bcfd5b1a1843f6bad475de30172")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'position_control)))
  "Returns md5sum for a message object of type 'position_control"
  "4b361bcfd5b1a1843f6bad475de30172")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<position_control>)))
  "Returns full string definition for message of type '<position_control>"
  (cl:format cl:nil "int32 position_control_type #0表示绝对位置 1表示相对位置~%float32 target_position_f #目标位置 单位：mm~%float32 velocity_f #速度 单位mm/s~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'position_control)))
  "Returns full string definition for message of type 'position_control"
  (cl:format cl:nil "int32 position_control_type #0表示绝对位置 1表示相对位置~%float32 target_position_f #目标位置 单位：mm~%float32 velocity_f #速度 单位mm/s~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <position_control>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <position_control>))
  "Converts a ROS message object to a list"
  (cl:list 'position_control
    (cl:cons ':position_control_type (position_control_type msg))
    (cl:cons ':target_position_f (target_position_f msg))
    (cl:cons ':velocity_f (velocity_f msg))
))
