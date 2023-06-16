; Auto-generated. Do not edit!


(cl:in-package zj_robot-msg)


;//! \htmlinclude motion_controlGoal.msg.html

(cl:defclass <motion_controlGoal> (roslisp-msg-protocol:ros-message)
  ((ABSorREL
    :reader ABSorREL
    :initarg :ABSorREL
    :type cl:integer
    :initform 0)
   (target_position
    :reader target_position
    :initarg :target_position
    :type cl:integer
    :initform 0)
   (velocity
    :reader velocity
    :initarg :velocity
    :type cl:float
    :initform 0.0))
)

(cl:defclass motion_controlGoal (<motion_controlGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motion_controlGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motion_controlGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name zj_robot-msg:<motion_controlGoal> is deprecated: use zj_robot-msg:motion_controlGoal instead.")))

(cl:ensure-generic-function 'ABSorREL-val :lambda-list '(m))
(cl:defmethod ABSorREL-val ((m <motion_controlGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zj_robot-msg:ABSorREL-val is deprecated.  Use zj_robot-msg:ABSorREL instead.")
  (ABSorREL m))

(cl:ensure-generic-function 'target_position-val :lambda-list '(m))
(cl:defmethod target_position-val ((m <motion_controlGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zj_robot-msg:target_position-val is deprecated.  Use zj_robot-msg:target_position instead.")
  (target_position m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <motion_controlGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zj_robot-msg:velocity-val is deprecated.  Use zj_robot-msg:velocity instead.")
  (velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motion_controlGoal>) ostream)
  "Serializes a message object of type '<motion_controlGoal>"
  (cl:let* ((signed (cl:slot-value msg 'ABSorREL)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'target_position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motion_controlGoal>) istream)
  "Deserializes a message object of type '<motion_controlGoal>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ABSorREL) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'target_position) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motion_controlGoal>)))
  "Returns string type for a message object of type '<motion_controlGoal>"
  "zj_robot/motion_controlGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motion_controlGoal)))
  "Returns string type for a message object of type 'motion_controlGoal"
  "zj_robot/motion_controlGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motion_controlGoal>)))
  "Returns md5sum for a message object of type '<motion_controlGoal>"
  "ca92a3bf81e86dbf05d6be4d70513968")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motion_controlGoal)))
  "Returns md5sum for a message object of type 'motion_controlGoal"
  "ca92a3bf81e86dbf05d6be4d70513968")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motion_controlGoal>)))
  "Returns full string definition for message of type '<motion_controlGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#位置控制action~%~%#目标位置 单位m~%int32 ABSorREL #相对或绝对~%int32 target_position~%float32 velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motion_controlGoal)))
  "Returns full string definition for message of type 'motion_controlGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#位置控制action~%~%#目标位置 单位m~%int32 ABSorREL #相对或绝对~%int32 target_position~%float32 velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motion_controlGoal>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motion_controlGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'motion_controlGoal
    (cl:cons ':ABSorREL (ABSorREL msg))
    (cl:cons ':target_position (target_position msg))
    (cl:cons ':velocity (velocity msg))
))
