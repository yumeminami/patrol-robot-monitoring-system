;; Auto-generated. Do not edit!


(when (boundp 'common::charge_control)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'charge_control (find-package "COMMON")))
(unless (find-package "COMMON::CHARGE_CONTROL")
  (make-package "COMMON::CHARGE_CONTROL"))

(in-package "ROS")
;;//! \htmlinclude charge_control.msg.html


(defclass common::charge_control
  :super ros::object
  :slots (_charge_command ))

(defmethod common::charge_control
  (:init
   (&key
    ((:charge_command __charge_command) 0)
    )
   (send-super :init)
   (setq _charge_command (round __charge_command))
   self)
  (:charge_command
   (&optional __charge_command)
   (if __charge_command (setq _charge_command __charge_command)) _charge_command)
  (:serialization-length
   ()
   (+
    ;; int32 _charge_command
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _charge_command
       (write-long _charge_command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _charge_command
     (setq _charge_command (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get common::charge_control :md5sum-) "1a12fdc189808c4ee3918135e54264fc")
(setf (get common::charge_control :datatype-) "common/charge_control")
(setf (get common::charge_control :definition-)
      "int32 charge_command
# 充电命令：
# 0:关闭充电模块
# 1:·开启充电模块

")



(provide :common/charge_control "1a12fdc189808c4ee3918135e54264fc")


