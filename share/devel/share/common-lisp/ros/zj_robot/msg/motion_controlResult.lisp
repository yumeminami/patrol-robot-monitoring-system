; Auto-generated. Do not edit!


(cl:in-package zj_robot-msg)


;//! \htmlinclude motion_controlResult.msg.html

(cl:defclass <motion_controlResult> (roslisp-msg-protocol:ros-message)
  ((inposition
    :reader inposition
    :initarg :inposition
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass motion_controlResult (<motion_controlResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motion_controlResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motion_controlResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name zj_robot-msg:<motion_controlResult> is deprecated: use zj_robot-msg:motion_controlResult instead.")))

(cl:ensure-generic-function 'inposition-val :lambda-list '(m))
(cl:defmethod inposition-val ((m <motion_controlResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zj_robot-msg:inposition-val is deprecated.  Use zj_robot-msg:inposition instead.")
  (inposition m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motion_controlResult>) ostream)
  "Serializes a message object of type '<motion_controlResult>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'inposition) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motion_controlResult>) istream)
  "Deserializes a message object of type '<motion_controlResult>"
    (cl:setf (cl:slot-value msg 'inposition) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motion_controlResult>)))
  "Returns string type for a message object of type '<motion_controlResult>"
  "zj_robot/motion_controlResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motion_controlResult)))
  "Returns string type for a message object of type 'motion_controlResult"
  "zj_robot/motion_controlResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motion_controlResult>)))
  "Returns md5sum for a message object of type '<motion_controlResult>"
  "1a33a407c88c263cad076c785a4007a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motion_controlResult)))
  "Returns md5sum for a message object of type 'motion_controlResult"
  "1a33a407c88c263cad076c785a4007a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motion_controlResult>)))
  "Returns full string definition for message of type '<motion_controlResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#是否到达指定位置~%bool inposition~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motion_controlResult)))
  "Returns full string definition for message of type 'motion_controlResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#是否到达指定位置~%bool inposition~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motion_controlResult>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motion_controlResult>))
  "Converts a ROS message object to a list"
  (cl:list 'motion_controlResult
    (cl:cons ':inposition (inposition msg))
))
