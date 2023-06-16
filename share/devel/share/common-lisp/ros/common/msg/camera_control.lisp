; Auto-generated. Do not edit!


(cl:in-package common-msg)


;//! \htmlinclude camera_control.msg.html

(cl:defclass <camera_control> (roslisp-msg-protocol:ros-message)
  ((camera_command
    :reader camera_command
    :initarg :camera_command
    :type cl:integer
    :initform 0))
)

(cl:defclass camera_control (<camera_control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <camera_control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'camera_control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-msg:<camera_control> is deprecated: use common-msg:camera_control instead.")))

(cl:ensure-generic-function 'camera_command-val :lambda-list '(m))
(cl:defmethod camera_command-val ((m <camera_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:camera_command-val is deprecated.  Use common-msg:camera_command instead.")
  (camera_command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <camera_control>) ostream)
  "Serializes a message object of type '<camera_control>"
  (cl:let* ((signed (cl:slot-value msg 'camera_command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <camera_control>) istream)
  "Deserializes a message object of type '<camera_control>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'camera_command) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<camera_control>)))
  "Returns string type for a message object of type '<camera_control>"
  "common/camera_control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'camera_control)))
  "Returns string type for a message object of type 'camera_control"
  "common/camera_control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<camera_control>)))
  "Returns md5sum for a message object of type '<camera_control>"
  "a705f3ae2c77fa51379c4dc7f4a2e7ec")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'camera_control)))
  "Returns md5sum for a message object of type 'camera_control"
  "a705f3ae2c77fa51379c4dc7f4a2e7ec")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<camera_control>)))
  "Returns full string definition for message of type '<camera_control>"
  (cl:format cl:nil "int32 camera_command~%# 相机命令：~%# 0:停止预览~%# 1:彩色相机预览~%# 2:彩色相机预览+保存~%# 3:红外相机预览~%# 4:预览+保存~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'camera_control)))
  "Returns full string definition for message of type 'camera_control"
  (cl:format cl:nil "int32 camera_command~%# 相机命令：~%# 0:停止预览~%# 1:彩色相机预览~%# 2:彩色相机预览+保存~%# 3:红外相机预览~%# 4:预览+保存~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <camera_control>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <camera_control>))
  "Converts a ROS message object to a list"
  (cl:list 'camera_control
    (cl:cons ':camera_command (camera_command msg))
))
