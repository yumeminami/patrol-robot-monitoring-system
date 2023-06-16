;; Auto-generated. Do not edit!


(when (boundp 'common::velocity_control)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'velocity_control (find-package "COMMON")))
(unless (find-package "COMMON::VELOCITY_CONTROL")
  (make-package "COMMON::VELOCITY_CONTROL"))

(in-package "ROS")
;;//! \htmlinclude velocity_control.msg.html


(defclass common::velocity_control
  :super ros::object
  :slots (_velocity_f ))

(defmethod common::velocity_control
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

(setf (get common::velocity_control :md5sum-) "67298657c9ef3f2768b496520fa1fd62")
(setf (get common::velocity_control :datatype-) "common/velocity_control")
(setf (get common::velocity_control :definition-)
      "float32 velocity_f #速度控制
")



(provide :common/velocity_control "67298657c9ef3f2768b496520fa1fd62")


