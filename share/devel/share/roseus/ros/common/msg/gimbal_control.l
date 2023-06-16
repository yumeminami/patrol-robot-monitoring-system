;; Auto-generated. Do not edit!


(when (boundp 'common::gimbal_control)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'gimbal_control (find-package "COMMON")))
(unless (find-package "COMMON::GIMBAL_CONTROL")
  (make-package "COMMON::GIMBAL_CONTROL"))

(in-package "ROS")
;;//! \htmlinclude gimbal_control.msg.html


(defclass common::gimbal_control
  :super ros::object
  :slots (_command _preset_index ))

(defmethod common::gimbal_control
  (:init
   (&key
    ((:command __command) 0)
    ((:preset_index __preset_index) 0)
    )
   (send-super :init)
   (setq _command (round __command))
   (setq _preset_index (round __preset_index))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:preset_index
   (&optional __preset_index)
   (if __preset_index (setq _preset_index __preset_index)) _preset_index)
  (:serialization-length
   ()
   (+
    ;; int32 _command
    4
    ;; int32 _preset_index
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _command
       (write-long _command s)
     ;; int32 _preset_index
       (write-long _preset_index s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _command
     (setq _command (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _preset_index
     (setq _preset_index (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get common::gimbal_control :md5sum-) "e9bd2fba3990c66b8df4336181b66716")
(setf (get common::gimbal_control :datatype-) "common/gimbal_control")
(setf (get common::gimbal_control :definition-)
      "int32 command #云台预置点命令
int32 preset_index #预置点编号




")



(provide :common/gimbal_control "e9bd2fba3990c66b8df4336181b66716")


