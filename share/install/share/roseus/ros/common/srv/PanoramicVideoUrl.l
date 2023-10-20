;; Auto-generated. Do not edit!


(when (boundp 'common::PanoramicVideoUrl)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'PanoramicVideoUrl (find-package "COMMON")))
(unless (find-package "COMMON::PANORAMICVIDEOURL")
  (make-package "COMMON::PANORAMICVIDEOURL"))
(unless (find-package "COMMON::PANORAMICVIDEOURLREQUEST")
  (make-package "COMMON::PANORAMICVIDEOURLREQUEST"))
(unless (find-package "COMMON::PANORAMICVIDEOURLRESPONSE")
  (make-package "COMMON::PANORAMICVIDEOURLRESPONSE"))

(in-package "ROS")





(defclass common::PanoramicVideoUrlRequest
  :super ros::object
  :slots (_panoramic_video_url ))

(defmethod common::PanoramicVideoUrlRequest
  (:init
   (&key
    ((:panoramic_video_url __panoramic_video_url) "")
    )
   (send-super :init)
   (setq _panoramic_video_url (string __panoramic_video_url))
   self)
  (:panoramic_video_url
   (&optional __panoramic_video_url)
   (if __panoramic_video_url (setq _panoramic_video_url __panoramic_video_url)) _panoramic_video_url)
  (:serialization-length
   ()
   (+
    ;; string _panoramic_video_url
    4 (length _panoramic_video_url)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _panoramic_video_url
       (write-long (length _panoramic_video_url) s) (princ _panoramic_video_url s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _panoramic_video_url
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _panoramic_video_url (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass common::PanoramicVideoUrlResponse
  :super ros::object
  :slots ())

(defmethod common::PanoramicVideoUrlResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass common::PanoramicVideoUrl
  :super ros::object
  :slots ())

(setf (get common::PanoramicVideoUrl :md5sum-) "ba607c1e80b486a09f8e68edd373cea1")
(setf (get common::PanoramicVideoUrl :datatype-) "common/PanoramicVideoUrl")
(setf (get common::PanoramicVideoUrl :request) common::PanoramicVideoUrlRequest)
(setf (get common::PanoramicVideoUrl :response) common::PanoramicVideoUrlResponse)

(defmethod common::PanoramicVideoUrlRequest
  (:response () (instance common::PanoramicVideoUrlResponse :init)))

(setf (get common::PanoramicVideoUrlRequest :md5sum-) "ba607c1e80b486a09f8e68edd373cea1")
(setf (get common::PanoramicVideoUrlRequest :datatype-) "common/PanoramicVideoUrlRequest")
(setf (get common::PanoramicVideoUrlRequest :definition-)
      "string panoramic_video_url
---


")

(setf (get common::PanoramicVideoUrlResponse :md5sum-) "ba607c1e80b486a09f8e68edd373cea1")
(setf (get common::PanoramicVideoUrlResponse :datatype-) "common/PanoramicVideoUrlResponse")
(setf (get common::PanoramicVideoUrlResponse :definition-)
      "string panoramic_video_url
---


")



(provide :common/PanoramicVideoUrl "ba607c1e80b486a09f8e68edd373cea1")


