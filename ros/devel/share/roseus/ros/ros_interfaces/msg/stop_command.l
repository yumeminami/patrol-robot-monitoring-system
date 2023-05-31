;; Auto-generated. Do not edit!


(when (boundp 'ros_interfaces::stop_command)
  (if (not (find-package "ROS_INTERFACES"))
    (make-package "ROS_INTERFACES"))
  (shadow 'stop_command (find-package "ROS_INTERFACES")))
(unless (find-package "ROS_INTERFACES::STOP_COMMAND")
  (make-package "ROS_INTERFACES::STOP_COMMAND"))

(in-package "ROS")
;;//! \htmlinclude stop_command.msg.html


(defclass ros_interfaces::stop_command
  :super ros::object
  :slots (_stop_type ))

(defmethod ros_interfaces::stop_command
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

(setf (get ros_interfaces::stop_command :md5sum-) "1b6fac8d08de0982f05ab0aa2f3aa6b5")
(setf (get ros_interfaces::stop_command :datatype-) "ros_interfaces/stop_command")
(setf (get ros_interfaces::stop_command :definition-)
      "int32 stop_type #0 stop 1 stop 2 kill
")



(provide :ros_interfaces/stop_command "1b6fac8d08de0982f05ab0aa2f3aa6b5")


