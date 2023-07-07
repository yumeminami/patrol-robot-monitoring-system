;; Auto-generated. Do not edit!


(when (boundp 'common::GimbalMotionControl)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'GimbalMotionControl (find-package "COMMON")))
(unless (find-package "COMMON::GIMBALMOTIONCONTROL")
  (make-package "COMMON::GIMBALMOTIONCONTROL"))
(unless (find-package "COMMON::GIMBALMOTIONCONTROLREQUEST")
  (make-package "COMMON::GIMBALMOTIONCONTROLREQUEST"))
(unless (find-package "COMMON::GIMBALMOTIONCONTROLRESPONSE")
  (make-package "COMMON::GIMBALMOTIONCONTROLRESPONSE"))

(in-package "ROS")





(defclass common::GimbalMotionControlRequest
  :super ros::object
  :slots (_command ))

(defmethod common::GimbalMotionControlRequest
  (:init
   (&key
    ((:command __command) 0)
    )
   (send-super :init)
   (setq _command (round __command))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:serialization-length
   ()
   (+
    ;; int32 _command
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _command
       (write-long _command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _command
     (setq _command (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass common::GimbalMotionControlResponse
  :super ros::object
  :slots (_status_code ))

(defmethod common::GimbalMotionControlResponse
  (:init
   (&key
    ((:status_code __status_code) 0)
    )
   (send-super :init)
   (setq _status_code (round __status_code))
   self)
  (:status_code
   (&optional __status_code)
   (if __status_code (setq _status_code __status_code)) _status_code)
  (:serialization-length
   ()
   (+
    ;; int32 _status_code
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _status_code
       (write-long _status_code s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _status_code
     (setq _status_code (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass common::GimbalMotionControl
  :super ros::object
  :slots ())

(setf (get common::GimbalMotionControl :md5sum-) "26b9aeb0208f157943a22b6e6a605823")
(setf (get common::GimbalMotionControl :datatype-) "common/GimbalMotionControl")
(setf (get common::GimbalMotionControl :request) common::GimbalMotionControlRequest)
(setf (get common::GimbalMotionControl :response) common::GimbalMotionControlResponse)

(defmethod common::GimbalMotionControlRequest
  (:response () (instance common::GimbalMotionControlResponse :init)))

(setf (get common::GimbalMotionControlRequest :md5sum-) "26b9aeb0208f157943a22b6e6a605823")
(setf (get common::GimbalMotionControlRequest :datatype-) "common/GimbalMotionControlRequest")
(setf (get common::GimbalMotionControlRequest :definition-)
      "int32 command 
#   云台运动命令及对应编号
#--------------------------------
# UP_LEFT   TILI_UP    UP_RIGHT
# PAN_LEFT             PAN_RIGHT
# DOWN_LEFT TILI_DOWN  DOWN_RIGHT
#--------------------------------
#   1         2          3
#   4                    6
#   7         8          9
#--------------------------------
---
int32 status_code #0失败，1完成





")

(setf (get common::GimbalMotionControlResponse :md5sum-) "26b9aeb0208f157943a22b6e6a605823")
(setf (get common::GimbalMotionControlResponse :datatype-) "common/GimbalMotionControlResponse")
(setf (get common::GimbalMotionControlResponse :definition-)
      "int32 command 
#   云台运动命令及对应编号
#--------------------------------
# UP_LEFT   TILI_UP    UP_RIGHT
# PAN_LEFT             PAN_RIGHT
# DOWN_LEFT TILI_DOWN  DOWN_RIGHT
#--------------------------------
#   1         2          3
#   4                    6
#   7         8          9
#--------------------------------
---
int32 status_code #0失败，1完成





")



(provide :common/GimbalMotionControl "26b9aeb0208f157943a22b6e6a605823")


