;; Auto-generated. Do not edit!


(when (boundp 'common::position_control)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'position_control (find-package "COMMON")))
(unless (find-package "COMMON::POSITION_CONTROL")
  (make-package "COMMON::POSITION_CONTROL"))

(in-package "ROS")
;;//! \htmlinclude position_control.msg.html


(defclass common::position_control
  :super ros::object
  :slots (_position_control_type _target_position_f _velocity_f ))

(defmethod common::position_control
  (:init
   (&key
    ((:position_control_type __position_control_type) 0)
    ((:target_position_f __target_position_f) 0.0)
    ((:velocity_f __velocity_f) 0.0)
    )
   (send-super :init)
   (setq _position_control_type (round __position_control_type))
   (setq _target_position_f (float __target_position_f))
   (setq _velocity_f (float __velocity_f))
   self)
  (:position_control_type
   (&optional __position_control_type)
   (if __position_control_type (setq _position_control_type __position_control_type)) _position_control_type)
  (:target_position_f
   (&optional __target_position_f)
   (if __target_position_f (setq _target_position_f __target_position_f)) _target_position_f)
  (:velocity_f
   (&optional __velocity_f)
   (if __velocity_f (setq _velocity_f __velocity_f)) _velocity_f)
  (:serialization-length
   ()
   (+
    ;; int32 _position_control_type
    4
    ;; float32 _target_position_f
    4
    ;; float32 _velocity_f
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _position_control_type
       (write-long _position_control_type s)
     ;; float32 _target_position_f
       (sys::poke _target_position_f (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _velocity_f
       (sys::poke _velocity_f (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _position_control_type
     (setq _position_control_type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _target_position_f
     (setq _target_position_f (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _velocity_f
     (setq _velocity_f (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get common::position_control :md5sum-) "4b361bcfd5b1a1843f6bad475de30172")
(setf (get common::position_control :datatype-) "common/position_control")
(setf (get common::position_control :definition-)
      "int32 position_control_type #0表示绝对位置 1表示相对位置
float32 target_position_f #目标位置 单位：mm
float32 velocity_f #速度 单位mm/s
")



(provide :common/position_control "4b361bcfd5b1a1843f6bad475de30172")


