;; Auto-generated. Do not edit!


(when (boundp 'common::RecordPosition)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'RecordPosition (find-package "COMMON")))
(unless (find-package "COMMON::RECORDPOSITION")
  (make-package "COMMON::RECORDPOSITION"))
(unless (find-package "COMMON::RECORDPOSITIONREQUEST")
  (make-package "COMMON::RECORDPOSITIONREQUEST"))
(unless (find-package "COMMON::RECORDPOSITIONRESPONSE")
  (make-package "COMMON::RECORDPOSITIONRESPONSE"))

(in-package "ROS")





(defclass common::RecordPositionRequest
  :super ros::object
  :slots (_robot_state _time _position ))

(defmethod common::RecordPositionRequest
  (:init
   (&key
    ((:robot_state __robot_state) (make-array 0 :initial-element 0 :element-type :integer))
    ((:time __time) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:position __position) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _robot_state __robot_state)
   (setq _time __time)
   (setq _position __position)
   self)
  (:robot_state
   (&optional __robot_state)
   (if __robot_state (setq _robot_state __robot_state)) _robot_state)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:serialization-length
   ()
   (+
    ;; int32[] _robot_state
    (* 4    (length _robot_state)) 4
    ;; float32[] _time
    (* 4    (length _time)) 4
    ;; float32[] _position
    (* 4    (length _position)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _robot_state
     (write-long (length _robot_state) s)
     (dotimes (i (length _robot_state))
       (write-long (elt _robot_state i) s)
       )
     ;; float32[] _time
     (write-long (length _time) s)
     (dotimes (i (length _time))
       (sys::poke (elt _time i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _position
     (write-long (length _position) s)
     (dotimes (i (length _position))
       (sys::poke (elt _position i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _robot_state
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _robot_state (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _robot_state i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float32[] _time
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _time (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _time i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _position
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _position (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _position i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass common::RecordPositionResponse
  :super ros::object
  :slots (_status_code ))

(defmethod common::RecordPositionResponse
  (:init
   (&key
    ((:status_code __status_code) 0)
    )
   (send-super :init)
   (setq _status_code (round __status_code))
   self)
  (:status_code
   (&optional __status_code)
   (if __status_code (setq _status_code __status_code)) _status_code)
  (:serialization-length
   ()
   (+
    ;; int32 _status_code
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _status_code
       (write-long _status_code s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _status_code
     (setq _status_code (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass common::RecordPosition
  :super ros::object
  :slots ())

(setf (get common::RecordPosition :md5sum-) "7a611c192c7d0449dba995ec9bb64dc9")
(setf (get common::RecordPosition :datatype-) "common/RecordPosition")
(setf (get common::RecordPosition :request) common::RecordPositionRequest)
(setf (get common::RecordPosition :response) common::RecordPositionResponse)

(defmethod common::RecordPositionRequest
  (:response () (instance common::RecordPositionResponse :init)))

(setf (get common::RecordPositionRequest :md5sum-) "7a611c192c7d0449dba995ec9bb64dc9")
(setf (get common::RecordPositionRequest :datatype-) "common/RecordPositionRequest")
(setf (get common::RecordPositionRequest :definition-)
      "int32[] robot_state
float32[] time
float32[] position
---
int32 status_code #0失败，1完成

")

(setf (get common::RecordPositionResponse :md5sum-) "7a611c192c7d0449dba995ec9bb64dc9")
(setf (get common::RecordPositionResponse :datatype-) "common/RecordPositionResponse")
(setf (get common::RecordPositionResponse :definition-)
      "int32[] robot_state
float32[] time
float32[] position
---
int32 status_code #0失败，1完成

")



(provide :common/RecordPosition "7a611c192c7d0449dba995ec9bb64dc9")


