;; Auto-generated. Do not edit!


(when (boundp 'common::voice_control)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'voice_control (find-package "COMMON")))
(unless (find-package "COMMON::VOICE_CONTROL")
  (make-package "COMMON::VOICE_CONTROL"))

(in-package "ROS")
;;//! \htmlinclude voice_control.msg.html


(defclass common::voice_control
  :super ros::object
  :slots (_voice_command ))

(defmethod common::voice_control
  (:init
   (&key
    ((:voice_command __voice_command) 0)
    )
   (send-super :init)
   (setq _voice_command (round __voice_command))
   self)
  (:voice_command
   (&optional __voice_command)
   (if __voice_command (setq _voice_command __voice_command)) _voice_command)
  (:serialization-length
   ()
   (+
    ;; int32 _voice_command
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _voice_command
       (write-long _voice_command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _voice_command
     (setq _voice_command (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get common::voice_control :md5sum-) "ab142bb934096e43e563146c9b3dc6ca")
(setf (get common::voice_control :datatype-) "common/voice_control")
(setf (get common::voice_control :definition-)
      "int32 voice_command 
#语音控制命令 0停止

")



(provide :common/voice_control "ab142bb934096e43e563146c9b3dc6ca")


