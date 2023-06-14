;; Auto-generated. Do not edit!


(when (boundp 'ros_interfaces::SensorData)
  (if (not (find-package "ROS_INTERFACES"))
    (make-package "ROS_INTERFACES"))
  (shadow 'SensorData (find-package "ROS_INTERFACES")))
(unless (find-package "ROS_INTERFACES::SENSORDATA")
  (make-package "ROS_INTERFACES::SENSORDATA"))

(in-package "ROS")
;;//! \htmlinclude SensorData.msg.html


(defclass ros_interfaces::SensorData
  :super ros::object
  :slots (_value ))

(defmethod ros_interfaces::SensorData
  (:init
   (&key
    ((:value __value) 0.0)
    )
   (send-super :init)
   (setq _value (float __value))
   self)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; float32 _value
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _value
       (sys::poke _value (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _value
     (setq _value (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ros_interfaces::SensorData :md5sum-) "0aca93dcf6d857f0e5a0dc6be1eaa9fb")
(setf (get ros_interfaces::SensorData :datatype-) "ros_interfaces/SensorData")
(setf (get ros_interfaces::SensorData :definition-)
      "float32 value
")



(provide :ros_interfaces/SensorData "0aca93dcf6d857f0e5a0dc6be1eaa9fb")


