;; Auto-generated. Do not edit!


(when (boundp 'common::XmlData)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'XmlData (find-package "COMMON")))
(unless (find-package "COMMON::XMLDATA")
  (make-package "COMMON::XMLDATA"))
(unless (find-package "COMMON::XMLDATAREQUEST")
  (make-package "COMMON::XMLDATAREQUEST"))
(unless (find-package "COMMON::XMLDATARESPONSE")
  (make-package "COMMON::XMLDATARESPONSE"))

(in-package "ROS")





(defclass common::XmlDataRequest
  :super ros::object
  :slots (_data ))

(defmethod common::XmlDataRequest
  (:init
   (&key
    ((:data __data) "")
    )
   (send-super :init)
   (setq _data (string __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; string _data
    4 (length _data)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _data
       (write-long (length _data) s) (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass common::XmlDataResponse
  :super ros::object
  :slots (_status_code ))

(defmethod common::XmlDataResponse
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

(defclass common::XmlData
  :super ros::object
  :slots ())

(setf (get common::XmlData :md5sum-) "c5819519b16be731a77f3869f8987fe2")
(setf (get common::XmlData :datatype-) "common/XmlData")
(setf (get common::XmlData :request) common::XmlDataRequest)
(setf (get common::XmlData :response) common::XmlDataResponse)

(defmethod common::XmlDataRequest
  (:response () (instance common::XmlDataResponse :init)))

(setf (get common::XmlDataRequest :md5sum-) "c5819519b16be731a77f3869f8987fe2")
(setf (get common::XmlDataRequest :datatype-) "common/XmlDataRequest")
(setf (get common::XmlDataRequest :definition-)
      "string data
---
int32 status_code #0失败，1完成



")

(setf (get common::XmlDataResponse :md5sum-) "c5819519b16be731a77f3869f8987fe2")
(setf (get common::XmlDataResponse :datatype-) "common/XmlDataResponse")
(setf (get common::XmlDataResponse :definition-)
      "string data
---
int32 status_code #0失败，1完成



")



(provide :common/XmlData "c5819519b16be731a77f3869f8987fe2")


