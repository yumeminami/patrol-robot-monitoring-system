; Auto-generated. Do not edit!


(cl:in-package common-msg)


;//! \htmlinclude setposition_control.msg.html

(cl:defclass <setposition_control> (roslisp-msg-protocol:ros-message)
  ((target_position_f
    :reader target_position_f
    :initarg :target_position_f
    :type cl:float
    :initform 0.0))
)

(cl:defclass setposition_control (<setposition_control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <setposition_control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'setposition_control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-msg:<setposition_control> is deprecated: use common-msg:setposition_control instead.")))

(cl:ensure-generic-function 'target_position_f-val :lambda-list '(m))
(cl:defmethod target_position_f-val ((m <setposition_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:target_position_f-val is deprecated.  Use common-msg:target_position_f instead.")
  (target_position_f m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <setposition_control>) ostream)
  "Serializes a message object of type '<setposition_control>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'target_position_f))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <setposition_control>) istream)
  "Deserializes a message object of type '<setposition_control>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'target_position_f) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<setposition_control>)))
  "Returns string type for a message object of type '<setposition_control>"
  "common/setposition_control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setposition_control)))
  "Returns string type for a message object of type 'setposition_control"
  "common/setposition_control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<setposition_control>)))
  "Returns md5sum for a message object of type '<setposition_control>"
  "f2e6bf020ed2049abd8afb50018d662c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'setposition_control)))
  "Returns md5sum for a message object of type 'setposition_control"
  "f2e6bf020ed2049abd8afb50018d662c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<setposition_control>)))
  "Returns full string definition for message of type '<setposition_control>"
  (cl:format cl:nil "# 设置位置~%float32 target_position_f #目标位置 单位：mm~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'setposition_control)))
  "Returns full string definition for message of type 'setposition_control"
  (cl:format cl:nil "# 设置位置~%float32 target_position_f #目标位置 单位：mm~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <setposition_control>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <setposition_control>))
  "Converts a ROS message object to a list"
  (cl:list 'setposition_control
    (cl:cons ':target_position_f (target_position_f msg))
))
