; Auto-generated. Do not edit!


(cl:in-package common-msg)


;//! \htmlinclude gimbal_control.msg.html

(cl:defclass <gimbal_control> (roslisp-msg-protocol:ros-message)
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

(cl:defclass gimbal_control (<gimbal_control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gimbal_control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gimbal_control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-msg:<gimbal_control> is deprecated: use common-msg:gimbal_control instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <gimbal_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:command-val is deprecated.  Use common-msg:command instead.")
  (command m))

(cl:ensure-generic-function 'preset_index-val :lambda-list '(m))
(cl:defmethod preset_index-val ((m <gimbal_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:preset_index-val is deprecated.  Use common-msg:preset_index instead.")
  (preset_index m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gimbal_control>) ostream)
  "Serializes a message object of type '<gimbal_control>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gimbal_control>) istream)
  "Deserializes a message object of type '<gimbal_control>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gimbal_control>)))
  "Returns string type for a message object of type '<gimbal_control>"
  "common/gimbal_control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gimbal_control)))
  "Returns string type for a message object of type 'gimbal_control"
  "common/gimbal_control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gimbal_control>)))
  "Returns md5sum for a message object of type '<gimbal_control>"
  "e9bd2fba3990c66b8df4336181b66716")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gimbal_control)))
  "Returns md5sum for a message object of type 'gimbal_control"
  "e9bd2fba3990c66b8df4336181b66716")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gimbal_control>)))
  "Returns full string definition for message of type '<gimbal_control>"
  (cl:format cl:nil "int32 command #云台预置点命令~%int32 preset_index #预置点编号~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gimbal_control)))
  "Returns full string definition for message of type 'gimbal_control"
  (cl:format cl:nil "int32 command #云台预置点命令~%int32 preset_index #预置点编号~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gimbal_control>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gimbal_control>))
  "Converts a ROS message object to a list"
  (cl:list 'gimbal_control
    (cl:cons ':command (command msg))
    (cl:cons ':preset_index (preset_index msg))
))
