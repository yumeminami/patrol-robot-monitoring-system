; Auto-generated. Do not edit!


(cl:in-package common-msg)


;//! \htmlinclude charge_control.msg.html

(cl:defclass <charge_control> (roslisp-msg-protocol:ros-message)
  ((charge_command
    :reader charge_command
    :initarg :charge_command
    :type cl:integer
    :initform 0))
)

(cl:defclass charge_control (<charge_control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <charge_control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'charge_control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-msg:<charge_control> is deprecated: use common-msg:charge_control instead.")))

(cl:ensure-generic-function 'charge_command-val :lambda-list '(m))
(cl:defmethod charge_command-val ((m <charge_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:charge_command-val is deprecated.  Use common-msg:charge_command instead.")
  (charge_command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <charge_control>) ostream)
  "Serializes a message object of type '<charge_control>"
  (cl:let* ((signed (cl:slot-value msg 'charge_command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <charge_control>) istream)
  "Deserializes a message object of type '<charge_control>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'charge_command) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<charge_control>)))
  "Returns string type for a message object of type '<charge_control>"
  "common/charge_control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'charge_control)))
  "Returns string type for a message object of type 'charge_control"
  "common/charge_control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<charge_control>)))
  "Returns md5sum for a message object of type '<charge_control>"
  "1a12fdc189808c4ee3918135e54264fc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'charge_control)))
  "Returns md5sum for a message object of type 'charge_control"
  "1a12fdc189808c4ee3918135e54264fc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<charge_control>)))
  "Returns full string definition for message of type '<charge_control>"
  (cl:format cl:nil "int32 charge_command~%# 充电命令：~%# 0:关闭充电模块~%# 1:·开启充电模块~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'charge_control)))
  "Returns full string definition for message of type 'charge_control"
  (cl:format cl:nil "int32 charge_command~%# 充电命令：~%# 0:关闭充电模块~%# 1:·开启充电模块~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <charge_control>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <charge_control>))
  "Converts a ROS message object to a list"
  (cl:list 'charge_control
    (cl:cons ':charge_command (charge_command msg))
))
