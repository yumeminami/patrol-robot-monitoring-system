; Auto-generated. Do not edit!


(cl:in-package common-msg)


;//! \htmlinclude gimbal_motion_control.msg.html

(cl:defclass <gimbal_motion_control> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:integer
    :initform 0))
)

(cl:defclass gimbal_motion_control (<gimbal_motion_control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gimbal_motion_control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gimbal_motion_control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-msg:<gimbal_motion_control> is deprecated: use common-msg:gimbal_motion_control instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <gimbal_motion_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:command-val is deprecated.  Use common-msg:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gimbal_motion_control>) ostream)
  "Serializes a message object of type '<gimbal_motion_control>"
  (cl:let* ((signed (cl:slot-value msg 'command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gimbal_motion_control>) istream)
  "Deserializes a message object of type '<gimbal_motion_control>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gimbal_motion_control>)))
  "Returns string type for a message object of type '<gimbal_motion_control>"
  "common/gimbal_motion_control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gimbal_motion_control)))
  "Returns string type for a message object of type 'gimbal_motion_control"
  "common/gimbal_motion_control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gimbal_motion_control>)))
  "Returns md5sum for a message object of type '<gimbal_motion_control>"
  "3a54bc0c5f4abe9ad44d29292ec0800d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gimbal_motion_control)))
  "Returns md5sum for a message object of type 'gimbal_motion_control"
  "3a54bc0c5f4abe9ad44d29292ec0800d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gimbal_motion_control>)))
  "Returns full string definition for message of type '<gimbal_motion_control>"
  (cl:format cl:nil "int32 command ~%#   云台运动命令及对应编号~%#--------------------------------~%# UP_LEFT   TILT_UP    UP_RIGHT~%# PAN_LEFT             PAN_RIGHT~%# DOWN_LEFT TILT_DOWN  DOWN_RIGHT~%#--------------------------------~%#   1         2          3~%#   4                    6~%#   7         8          9~%#--------------------------------~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gimbal_motion_control)))
  "Returns full string definition for message of type 'gimbal_motion_control"
  (cl:format cl:nil "int32 command ~%#   云台运动命令及对应编号~%#--------------------------------~%# UP_LEFT   TILT_UP    UP_RIGHT~%# PAN_LEFT             PAN_RIGHT~%# DOWN_LEFT TILT_DOWN  DOWN_RIGHT~%#--------------------------------~%#   1         2          3~%#   4                    6~%#   7         8          9~%#--------------------------------~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gimbal_motion_control>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gimbal_motion_control>))
  "Converts a ROS message object to a list"
  (cl:list 'gimbal_motion_control
    (cl:cons ':command (command msg))
))
