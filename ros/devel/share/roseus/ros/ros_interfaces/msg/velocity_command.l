;; Auto-generated. Do not edit!


(when (boundp 'ros_interfaces::velocity_command)
  (if (not (find-package "ROS_INTERFACES"))
    (make-package "ROS_INTERFACES"))
  (shadow 'velocity_command (find-package "ROS_INTERFACES")))
(unless (find-package "ROS_INTERFACES::VELOCITY_COMMAND")
  (make-package "ROS_INTERFACES::VELOCITY_COMMAND"))

(in-package "ROS")
;;//! \htmlinclude velocity_command.msg.html


(defclass ros_interfaces::velocity_command
  :super ros::object
  :slots (_velocity_f ))

(defmethod ros_interfaces::velocity_command
  (:init
   (&key
    ((:velocity_f __velocity_f) 0.0)
    )
   (send-super :init)
   (setq _velocity_f (float __velocity_f))
   self)
  (:velocity_f
   (&optional __velocity_f)
   (if __velocity_f (setq _velocity_f __velocity_f)) _velocity_f)
  (:serialization-length
   ()
   (+
    ;; float32 _velocity_f
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _velocity_f
       (sys::poke _velocity_f (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _velocity_f
     (setq _velocity_f (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ros_interfaces::velocity_command :md5sum-) "67298657c9ef3f2768b496520fa1fd62")
(setf (get ros_interfaces::velocity_command :datatype-) "ros_interfaces/velocity_command")
(setf (get ros_interfaces::velocity_command :definition-)
      "float32 velocity_f #速度控制
")



(provide :ros_interfaces/velocity_command "67298657c9ef3f2768b496520fa1fd62")


