; Auto-generated. Do not edit!


(cl:in-package common-msg)


;//! \htmlinclude voice_control.msg.html

(cl:defclass <voice_control> (roslisp-msg-protocol:ros-message)
  ((voice_command
    :reader voice_command
    :initarg :voice_command
    :type cl:integer
    :initform 0))
)

(cl:defclass voice_control (<voice_control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <voice_control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'voice_control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-msg:<voice_control> is deprecated: use common-msg:voice_control instead.")))

(cl:ensure-generic-function 'voice_command-val :lambda-list '(m))
(cl:defmethod voice_command-val ((m <voice_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:voice_command-val is deprecated.  Use common-msg:voice_command instead.")
  (voice_command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <voice_control>) ostream)
  "Serializes a message object of type '<voice_control>"
  (cl:let* ((signed (cl:slot-value msg 'voice_command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <voice_control>) istream)
  "Deserializes a message object of type '<voice_control>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'voice_command) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<voice_control>)))
  "Returns string type for a message object of type '<voice_control>"
  "common/voice_control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'voice_control)))
  "Returns string type for a message object of type 'voice_control"
  "common/voice_control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<voice_control>)))
  "Returns md5sum for a message object of type '<voice_control>"
  "ab142bb934096e43e563146c9b3dc6ca")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'voice_control)))
  "Returns md5sum for a message object of type 'voice_control"
  "ab142bb934096e43e563146c9b3dc6ca")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<voice_control>)))
  "Returns full string definition for message of type '<voice_control>"
  (cl:format cl:nil "int32 voice_command ~%#语音控制命令 0停止~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'voice_control)))
  "Returns full string definition for message of type 'voice_control"
  (cl:format cl:nil "int32 voice_command ~%#语音控制命令 0停止~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <voice_control>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <voice_control>))
  "Converts a ROS message object to a list"
  (cl:list 'voice_control
    (cl:cons ':voice_command (voice_command msg))
))
