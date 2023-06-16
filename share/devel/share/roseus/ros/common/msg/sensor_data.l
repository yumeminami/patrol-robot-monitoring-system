;; Auto-generated. Do not edit!


(when (boundp 'common::sensor_data)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'sensor_data (find-package "COMMON")))
(unless (find-package "COMMON::SENSOR_DATA")
  (make-package "COMMON::SENSOR_DATA"))

(in-package "ROS")
;;//! \htmlinclude sensor_data.msg.html


(defclass common::sensor_data
  :super ros::object
  :slots (_temperature _humidity _light _PM1_0 _PM2_5 _PM10 _smoke1 _smoke2 ))

(defmethod common::sensor_data
  (:init
   (&key
    ((:temperature __temperature) 0.0)
    ((:humidity __humidity) 0.0)
    ((:light __light) 0.0)
    ((:PM1_0 __PM1_0) 0)
    ((:PM2_5 __PM2_5) 0)
    ((:PM10 __PM10) 0)
    ((:smoke1 __smoke1) 0)
    ((:smoke2 __smoke2) 0)
    )
   (send-super :init)
   (setq _temperature (float __temperature))
   (setq _humidity (float __humidity))
   (setq _light (float __light))
   (setq _PM1_0 (round __PM1_0))
   (setq _PM2_5 (round __PM2_5))
   (setq _PM10 (round __PM10))
   (setq _smoke1 (round __smoke1))
   (setq _smoke2 (round __smoke2))
   self)
  (:temperature
   (&optional __temperature)
   (if __temperature (setq _temperature __temperature)) _temperature)
  (:humidity
   (&optional __humidity)
   (if __humidity (setq _humidity __humidity)) _humidity)
  (:light
   (&optional __light)
   (if __light (setq _light __light)) _light)
  (:PM1_0
   (&optional __PM1_0)
   (if __PM1_0 (setq _PM1_0 __PM1_0)) _PM1_0)
  (:PM2_5
   (&optional __PM2_5)
   (if __PM2_5 (setq _PM2_5 __PM2_5)) _PM2_5)
  (:PM10
   (&optional __PM10)
   (if __PM10 (setq _PM10 __PM10)) _PM10)
  (:smoke1
   (&optional __smoke1)
   (if __smoke1 (setq _smoke1 __smoke1)) _smoke1)
  (:smoke2
   (&optional __smoke2)
   (if __smoke2 (setq _smoke2 __smoke2)) _smoke2)
  (:serialization-length
   ()
   (+
    ;; float32 _temperature
    4
    ;; float32 _humidity
    4
    ;; float32 _light
    4
    ;; int32 _PM1_0
    4
    ;; int32 _PM2_5
    4
    ;; int32 _PM10
    4
    ;; int32 _smoke1
    4
    ;; int32 _smoke2
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _temperature
       (sys::poke _temperature (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _humidity
       (sys::poke _humidity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _light
       (sys::poke _light (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _PM1_0
       (write-long _PM1_0 s)
     ;; int32 _PM2_5
       (write-long _PM2_5 s)
     ;; int32 _PM10
       (write-long _PM10 s)
     ;; int32 _smoke1
       (write-long _smoke1 s)
     ;; int32 _smoke2
       (write-long _smoke2 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _temperature
     (setq _temperature (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _humidity
     (setq _humidity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _light
     (setq _light (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _PM1_0
     (setq _PM1_0 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _PM2_5
     (setq _PM2_5 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _PM10
     (setq _PM10 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _smoke1
     (setq _smoke1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _smoke2
     (setq _smoke2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get common::sensor_data :md5sum-) "2514f8bdc76a9a175afe9b9b60de1304")
(setf (get common::sensor_data :datatype-) "common/sensor_data")
(setf (get common::sensor_data :definition-)
      "float32 temperature
float32 humidity

float32 light
int32 PM1_0
int32 PM2_5
int32 PM10
int32 smoke1
int32 smoke2






")



(provide :common/sensor_data "2514f8bdc76a9a175afe9b9b60de1304")


