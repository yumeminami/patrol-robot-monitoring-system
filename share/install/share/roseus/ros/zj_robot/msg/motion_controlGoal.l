;; Auto-generated. Do not edit!


(when (boundp 'zj_robot::motion_controlGoal)
  (if (not (find-package "ZJ_ROBOT"))
    (make-package "ZJ_ROBOT"))
  (shadow 'motion_controlGoal (find-package "ZJ_ROBOT")))
(unless (find-package "ZJ_ROBOT::MOTION_CONTROLGOAL")
  (make-package "ZJ_ROBOT::MOTION_CONTROLGOAL"))

(in-package "ROS")
;;//! \htmlinclude motion_controlGoal.msg.html


(defclass zj_robot::motion_controlGoal
  :super ros::object
  :slots (_ABSorREL _target_position _velocity ))

(defmethod zj_robot::motion_controlGoal
  (:init
   (&key
    ((:ABSorREL __ABSorREL) 0)
    ((:target_position __target_position) 0)
    ((:velocity __velocity) 0.0)
    )
   (send-super :init)
   (setq _ABSorREL (round __ABSorREL))
   (setq _target_position (round __target_position))
   (setq _velocity (float __velocity))
   self)
  (:ABSorREL
   (&optional __ABSorREL)
   (if __ABSorREL (setq _ABSorREL __ABSorREL)) _ABSorREL)
  (:target_position
   (&optional __target_position)
   (if __target_position (setq _target_position __target_position)) _target_position)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:serialization-length
   ()
   (+
    ;; int32 _ABSorREL
    4
    ;; int32 _target_position
    4
    ;; float32 _velocity
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _ABSorREL
       (write-long _ABSorREL s)
     ;; int32 _target_position
       (write-long _target_position s)
     ;; float32 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _ABSorREL
     (setq _ABSorREL (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _target_position
     (setq _target_position (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _velocity
     (setq _velocity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get zj_robot::motion_controlGoal :md5sum-) "ca92a3bf81e86dbf05d6be4d70513968")
(setf (get zj_robot::motion_controlGoal :datatype-) "zj_robot/motion_controlGoal")
(setf (get zj_robot::motion_controlGoal :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
#位置控制action

#目标位置 单位m
int32 ABSorREL #相对或绝对
int32 target_position
float32 velocity

")



(provide :zj_robot/motion_controlGoal "ca92a3bf81e86dbf05d6be4d70513968")


