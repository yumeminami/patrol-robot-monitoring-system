;; Auto-generated. Do not edit!


(when (boundp 'common::setposition_control)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'setposition_control (find-package "COMMON")))
(unless (find-package "COMMON::SETPOSITION_CONTROL")
  (make-package "COMMON::SETPOSITION_CONTROL"))

(in-package "ROS")
;;//! \htmlinclude setposition_control.msg.html


(defclass common::setposition_control
  :super ros::object
  :slots (_target_position_f ))

(defmethod common::setposition_control
  (:init
   (&key
    ((:target_position_f __target_position_f) 0.0)
    )
   (send-super :init)
   (setq _target_position_f (float __target_position_f))
   self)
  (:target_position_f
   (&optional __target_position_f)
   (if __target_position_f (setq _target_position_f __target_position_f)) _target_position_f)
  (:serialization-length
   ()
   (+
    ;; float32 _target_position_f
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _target_position_f
       (sys::poke _target_position_f (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _target_position_f
     (setq _target_position_f (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get common::setposition_control :md5sum-) "f2e6bf020ed2049abd8afb50018d662c")
(setf (get common::setposition_control :datatype-) "common/setposition_control")
(setf (get common::setposition_control :definition-)
      "# 设置位置
float32 target_position_f #目标位置 单位：mm
")



(provide :common/setposition_control "f2e6bf020ed2049abd8afb50018d662c")


