;; Auto-generated. Do not edit!


(when (boundp 'common::gimbal_motion_control)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'gimbal_motion_control (find-package "COMMON")))
(unless (find-package "COMMON::GIMBAL_MOTION_CONTROL")
  (make-package "COMMON::GIMBAL_MOTION_CONTROL"))

(in-package "ROS")
;;//! \htmlinclude gimbal_motion_control.msg.html


(defclass common::gimbal_motion_control
  :super ros::object
  :slots (_command ))

(defmethod common::gimbal_motion_control
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

(setf (get common::gimbal_motion_control :md5sum-) "3a54bc0c5f4abe9ad44d29292ec0800d")
(setf (get common::gimbal_motion_control :datatype-) "common/gimbal_motion_control")
(setf (get common::gimbal_motion_control :definition-)
      "int32 command 
#   云台运动命令及对应编号
#--------------------------------
# UP_LEFT   TILT_UP    UP_RIGHT
# PAN_LEFT             PAN_RIGHT
# DOWN_LEFT TILT_DOWN  DOWN_RIGHT
#--------------------------------
#   1         2          3
#   4                    6
#   7         8          9
#--------------------------------



")



(provide :common/gimbal_motion_control "3a54bc0c5f4abe9ad44d29292ec0800d")


