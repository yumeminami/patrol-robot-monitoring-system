;; Auto-generated. Do not edit!


(when (boundp 'common::stop_control)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'stop_control (find-package "COMMON")))
(unless (find-package "COMMON::STOP_CONTROL")
  (make-package "COMMON::STOP_CONTROL"))

(in-package "ROS")
;;//! \htmlinclude stop_control.msg.html


(defclass common::stop_control
  :super ros::object
  :slots (_stop_type ))

(defmethod common::stop_control
  (:init
   (&key
    ((:stop_type __stop_type) 0)
    )
   (send-super :init)
   (setq _stop_type (round __stop_type))
   self)
  (:stop_type
   (&optional __stop_type)
   (if __stop_type (setq _stop_type __stop_type)) _stop_type)
  (:serialization-length
   ()
   (+
    ;; int32 _stop_type
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _stop_type
       (write-long _stop_type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _stop_type
     (setq _stop_type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get common::stop_control :md5sum-) "1b6fac8d08de0982f05ab0aa2f3aa6b5")
(setf (get common::stop_control :datatype-) "common/stop_control")
(setf (get common::stop_control :definition-)
      "int32 stop_type #0 stop 1 stop 2 自由停止

")



(provide :common/stop_control "1b6fac8d08de0982f05ab0aa2f3aa6b5")


