; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude LedControl-request.msg.html

(cl:defclass <LedControl-request> (roslisp-msg-protocol:ros-message)
  ((num
    :reader num
    :initarg :num
    :type cl:integer
    :initform 0)
   (R
    :reader R
    :initarg :R
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (G
    :reader G
    :initarg :G
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (B
    :reader B
    :initarg :B
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass LedControl-request (<LedControl-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LedControl-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LedControl-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<LedControl-request> is deprecated: use common-srv:LedControl-request instead.")))

(cl:ensure-generic-function 'num-val :lambda-list '(m))
(cl:defmethod num-val ((m <LedControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:num-val is deprecated.  Use common-srv:num instead.")
  (num m))

(cl:ensure-generic-function 'R-val :lambda-list '(m))
(cl:defmethod R-val ((m <LedControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:R-val is deprecated.  Use common-srv:R instead.")
  (R m))

(cl:ensure-generic-function 'G-val :lambda-list '(m))
(cl:defmethod G-val ((m <LedControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:G-val is deprecated.  Use common-srv:G instead.")
  (G m))

(cl:ensure-generic-function 'B-val :lambda-list '(m))
(cl:defmethod B-val ((m <LedControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:B-val is deprecated.  Use common-srv:B instead.")
  (B m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LedControl-request>) ostream)
  "Serializes a message object of type '<LedControl-request>"
  (cl:let* ((signed (cl:slot-value msg 'num)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'R))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'R))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'G))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'G))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'B))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'B))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LedControl-request>) istream)
  "Deserializes a message object of type '<LedControl-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'R) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'R)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'G) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'G)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'B) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'B)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LedControl-request>)))
  "Returns string type for a service object of type '<LedControl-request>"
  "common/LedControlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LedControl-request)))
  "Returns string type for a service object of type 'LedControl-request"
  "common/LedControlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LedControl-request>)))
  "Returns md5sum for a message object of type '<LedControl-request>"
  "b489cd436df01b887c57cc1f419161c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LedControl-request)))
  "Returns md5sum for a message object of type 'LedControl-request"
  "b489cd436df01b887c57cc1f419161c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LedControl-request>)))
  "Returns full string definition for message of type '<LedControl-request>"
  (cl:format cl:nil "#灯带控制 num表示灯的数量~%int32 num~%int32[] R~%int32[] G~%int32[] B~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LedControl-request)))
  "Returns full string definition for message of type 'LedControl-request"
  (cl:format cl:nil "#灯带控制 num表示灯的数量~%int32 num~%int32[] R~%int32[] G~%int32[] B~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LedControl-request>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'R) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'G) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'B) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LedControl-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LedControl-request
    (cl:cons ':num (num msg))
    (cl:cons ':R (R msg))
    (cl:cons ':G (G msg))
    (cl:cons ':B (B msg))
))
;//! \htmlinclude LedControl-response.msg.html

(cl:defclass <LedControl-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0))
)

(cl:defclass LedControl-response (<LedControl-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LedControl-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LedControl-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<LedControl-response> is deprecated: use common-srv:LedControl-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <LedControl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LedControl-response>) ostream)
  "Serializes a message object of type '<LedControl-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LedControl-response>) istream)
  "Deserializes a message object of type '<LedControl-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LedControl-response>)))
  "Returns string type for a service object of type '<LedControl-response>"
  "common/LedControlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LedControl-response)))
  "Returns string type for a service object of type 'LedControl-response"
  "common/LedControlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LedControl-response>)))
  "Returns md5sum for a message object of type '<LedControl-response>"
  "b489cd436df01b887c57cc1f419161c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LedControl-response)))
  "Returns md5sum for a message object of type 'LedControl-response"
  "b489cd436df01b887c57cc1f419161c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LedControl-response>)))
  "Returns full string definition for message of type '<LedControl-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LedControl-response)))
  "Returns full string definition for message of type 'LedControl-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LedControl-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LedControl-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LedControl-response
    (cl:cons ':status_code (status_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LedControl)))
  'LedControl-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LedControl)))
  'LedControl-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LedControl)))
  "Returns string type for a service object of type '<LedControl>"
  "common/LedControl")