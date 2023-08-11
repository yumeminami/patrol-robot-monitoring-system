; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude CameraControl-request.msg.html

(cl:defclass <CameraControl-request> (roslisp-msg-protocol:ros-message)
  ((camera_command
    :reader camera_command
    :initarg :camera_command
    :type cl:integer
    :initform 0))
)

(cl:defclass CameraControl-request (<CameraControl-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CameraControl-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CameraControl-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<CameraControl-request> is deprecated: use common-srv:CameraControl-request instead.")))

(cl:ensure-generic-function 'camera_command-val :lambda-list '(m))
(cl:defmethod camera_command-val ((m <CameraControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:camera_command-val is deprecated.  Use common-srv:camera_command instead.")
  (camera_command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CameraControl-request>) ostream)
  "Serializes a message object of type '<CameraControl-request>"
  (cl:let* ((signed (cl:slot-value msg 'camera_command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CameraControl-request>) istream)
  "Deserializes a message object of type '<CameraControl-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'camera_command) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CameraControl-request>)))
  "Returns string type for a service object of type '<CameraControl-request>"
  "common/CameraControlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CameraControl-request)))
  "Returns string type for a service object of type 'CameraControl-request"
  "common/CameraControlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CameraControl-request>)))
  "Returns md5sum for a message object of type '<CameraControl-request>"
  "1197f65cafe4f6185711fff0c923b4bd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CameraControl-request)))
  "Returns md5sum for a message object of type 'CameraControl-request"
  "1197f65cafe4f6185711fff0c923b4bd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CameraControl-request>)))
  "Returns full string definition for message of type '<CameraControl-request>"
  (cl:format cl:nil "int32 camera_command~%# 相机命令：~%# 0:停止预览~%# 1:彩色相机预览~%# 2:彩色相机预览+保存~%# 3:红外相机预览~%# 4:红外相机预览+保存~%# 5:彩色相机录制~%# 6:红外相机录制~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CameraControl-request)))
  "Returns full string definition for message of type 'CameraControl-request"
  (cl:format cl:nil "int32 camera_command~%# 相机命令：~%# 0:停止预览~%# 1:彩色相机预览~%# 2:彩色相机预览+保存~%# 3:红外相机预览~%# 4:红外相机预览+保存~%# 5:彩色相机录制~%# 6:红外相机录制~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CameraControl-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CameraControl-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CameraControl-request
    (cl:cons ':camera_command (camera_command msg))
))
;//! \htmlinclude CameraControl-response.msg.html

(cl:defclass <CameraControl-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0))
)

(cl:defclass CameraControl-response (<CameraControl-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CameraControl-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CameraControl-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<CameraControl-response> is deprecated: use common-srv:CameraControl-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <CameraControl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CameraControl-response>) ostream)
  "Serializes a message object of type '<CameraControl-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CameraControl-response>) istream)
  "Deserializes a message object of type '<CameraControl-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CameraControl-response>)))
  "Returns string type for a service object of type '<CameraControl-response>"
  "common/CameraControlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CameraControl-response)))
  "Returns string type for a service object of type 'CameraControl-response"
  "common/CameraControlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CameraControl-response>)))
  "Returns md5sum for a message object of type '<CameraControl-response>"
  "1197f65cafe4f6185711fff0c923b4bd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CameraControl-response)))
  "Returns md5sum for a message object of type 'CameraControl-response"
  "1197f65cafe4f6185711fff0c923b4bd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CameraControl-response>)))
  "Returns full string definition for message of type '<CameraControl-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CameraControl-response)))
  "Returns full string definition for message of type 'CameraControl-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CameraControl-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CameraControl-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CameraControl-response
    (cl:cons ':status_code (status_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CameraControl)))
  'CameraControl-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CameraControl)))
  'CameraControl-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CameraControl)))
  "Returns string type for a service object of type '<CameraControl>"
  "common/CameraControl")