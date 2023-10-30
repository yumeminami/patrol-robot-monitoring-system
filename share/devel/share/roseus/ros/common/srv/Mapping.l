;; Auto-generated. Do not edit!


(when (boundp 'common::Mapping)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'Mapping (find-package "COMMON")))
(unless (find-package "COMMON::MAPPING")
  (make-package "COMMON::MAPPING"))
(unless (find-package "COMMON::MAPPINGREQUEST")
  (make-package "COMMON::MAPPINGREQUEST"))
(unless (find-package "COMMON::MAPPINGRESPONSE")
  (make-package "COMMON::MAPPINGRESPONSE"))

(in-package "ROS")





(defclass common::MappingRequest
  :super ros::object
  :slots (_mapping_cmd ))

(defmethod common::MappingRequest
  (:init
   (&key
    ((:mapping_cmd __mapping_cmd) 0)
    )
   (send-super :init)
   (setq _mapping_cmd (round __mapping_cmd))
   self)
  (:mapping_cmd
   (&optional __mapping_cmd)
   (if __mapping_cmd (setq _mapping_cmd __mapping_cmd)) _mapping_cmd)
  (:serialization-length
   ()
   (+
    ;; int32 _mapping_cmd
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _mapping_cmd
       (write-long _mapping_cmd s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _mapping_cmd
     (setq _mapping_cmd (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass common::MappingResponse
  :super ros::object
  :slots (_status_code ))

(defmethod common::MappingResponse
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

(defclass common::Mapping
  :super ros::object
  :slots ())

(setf (get common::Mapping :md5sum-) "15e6a864f16c73d6aacfe9af1cbf92ef")
(setf (get common::Mapping :datatype-) "common/Mapping")
(setf (get common::Mapping :request) common::MappingRequest)
(setf (get common::Mapping :response) common::MappingResponse)

(defmethod common::MappingRequest
  (:response () (instance common::MappingResponse :init)))

(setf (get common::MappingRequest :md5sum-) "15e6a864f16c73d6aacfe9af1cbf92ef")
(setf (get common::MappingRequest :datatype-) "common/MappingRequest")
(setf (get common::MappingRequest :definition-)
      "int32 mapping_cmd
#1开始
---
int32 status_code #0失败，1完成



")

(setf (get common::MappingResponse :md5sum-) "15e6a864f16c73d6aacfe9af1cbf92ef")
(setf (get common::MappingResponse :datatype-) "common/MappingResponse")
(setf (get common::MappingResponse :definition-)
      "int32 mapping_cmd
#1开始
---
int32 status_code #0失败，1完成



")



(provide :common/Mapping "15e6a864f16c73d6aacfe9af1cbf92ef")


