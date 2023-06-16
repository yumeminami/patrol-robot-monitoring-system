;; Auto-generated. Do not edit!


(when (boundp 'common::robot_real_time_info)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'robot_real_time_info (find-package "COMMON")))
(unless (find-package "COMMON::ROBOT_REAL_TIME_INFO")
  (make-package "COMMON::ROBOT_REAL_TIME_INFO"))

(in-package "ROS")
;;//! \htmlinclude robot_real_time_info.msg.html


(defclass common::robot_real_time_info
  :super ros::object
  :slots (_velocity _position _position_control_state _battery_state _battery_level ))

(defmethod common::robot_real_time_info
  (:init
   (&key
    ((:velocity __velocity) 0.0)
    ((:position __position) 0.0)
    ((:position_control_state __position_control_state) 0)
    ((:battery_state __battery_state) 0)
    ((:battery_level __battery_level) 0)
    )
   (send-super :init)
   (setq _velocity (float __velocity))
   (setq _position (float __position))
   (setq _position_control_state (round __position_control_state))
   (setq _battery_state (round __battery_state))
   (setq _battery_level (round __battery_level))
   self)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:position_control_state
   (&optional __position_control_state)
   (if __position_control_state (setq _position_control_state __position_control_state)) _position_control_state)
  (:battery_state
   (&optional __battery_state)
   (if __battery_state (setq _battery_state __battery_state)) _battery_state)
  (:battery_level
   (&optional __battery_level)
   (if __battery_level (setq _battery_level __battery_level)) _battery_level)
  (:serialization-length
   ()
   (+
    ;; float32 _velocity
    4
    ;; float32 _position
    4
    ;; int32 _position_control_state
    4
    ;; int32 _battery_state
    4
    ;; int32 _battery_level
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _position
       (sys::poke _position (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _position_control_state
       (write-long _position_control_state s)
     ;; int32 _battery_state
       (write-long _battery_state s)
     ;; int32 _battery_level
       (write-long _battery_level s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _velocity
     (setq _velocity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _position
     (setq _position (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _position_control_state
     (setq _position_control_state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _battery_state
     (setq _battery_state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _battery_level
     (setq _battery_level (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get common::robot_real_time_info :md5sum-) "3b8aa7073ad1bc4871cf8c840555bf9c")
(setf (get common::robot_real_time_info :datatype-) "common/robot_real_time_info")
(setf (get common::robot_real_time_info :definition-)
      "float32 velocity                #运动速度
float32 position                #当前位置
int32 position_control_state    #位置控制状态：0 未完成 1 完成
int32 battery_state             #电池充电状态：0 代表充电 1 代表未充电
int32 battery_level             #电池电量(0-100)



")



(provide :common/robot_real_time_info "3b8aa7073ad1bc4871cf8c840555bf9c")


