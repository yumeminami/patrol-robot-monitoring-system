;; Auto-generated. Do not edit!


(when (boundp 'common::ResetMap)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'ResetMap (find-package "COMMON")))
(unless (find-package "COMMON::RESETMAP")
  (make-package "COMMON::RESETMAP"))
(unless (find-package "COMMON::RESETMAPREQUEST")
  (make-package "COMMON::RESETMAPREQUEST"))
(unless (find-package "COMMON::RESETMAPRESPONSE")
  (make-package "COMMON::RESETMAPRESPONSE"))

(in-package "ROS")





(defclass common::ResetMapRequest
  :super ros::object
  :slots (_reset_map ))

(defmethod common::ResetMapRequest
  (:init
   (&key
    ((:reset_map __reset_map) "")
    )
   (send-super :init)
   (setq _reset_map (string __reset_map))
   self)
  (:reset_map
   (&optional __reset_map)
   (if __reset_map (setq _reset_map __reset_map)) _reset_map)
  (:serialization-length
   ()
   (+
    ;; string _reset_map
    4 (length _reset_map)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _reset_map
       (write-long (length _reset_map) s) (princ _reset_map s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _reset_map
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _reset_map (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass common::ResetMapResponse
  :super ros::object
  :slots (_status_code ))

(defmethod common::ResetMapResponse
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

(defclass common::ResetMap
  :super ros::object
  :slots ())

(setf (get common::ResetMap :md5sum-) "9fabf1eaf267dccbe2dae60c58619584")
(setf (get common::ResetMap :datatype-) "common/ResetMap")
(setf (get common::ResetMap :request) common::ResetMapRequest)
(setf (get common::ResetMap :response) common::ResetMapResponse)

(defmethod common::ResetMapRequest
  (:response () (instance common::ResetMapResponse :init)))

(setf (get common::ResetMapRequest :md5sum-) "9fabf1eaf267dccbe2dae60c58619584")
(setf (get common::ResetMapRequest :datatype-) "common/ResetMapRequest")
(setf (get common::ResetMapRequest :definition-)
      "string reset_map
---
int32 status_code #0失败，1完成



")

(setf (get common::ResetMapResponse :md5sum-) "9fabf1eaf267dccbe2dae60c58619584")
(setf (get common::ResetMapResponse :datatype-) "common/ResetMapResponse")
(setf (get common::ResetMapResponse :definition-)
      "string reset_map
---
int32 status_code #0失败，1完成



")



(provide :common/ResetMap "9fabf1eaf267dccbe2dae60c58619584")


