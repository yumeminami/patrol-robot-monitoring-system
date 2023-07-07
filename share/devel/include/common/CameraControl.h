// Generated by gencpp from file common/CameraControl.msg
// DO NOT EDIT!


#ifndef COMMON_MESSAGE_CAMERACONTROL_H
#define COMMON_MESSAGE_CAMERACONTROL_H

#include <ros/service_traits.h>


#include <common/CameraControlRequest.h>
#include <common/CameraControlResponse.h>


namespace common
{

struct CameraControl
{

typedef CameraControlRequest Request;
typedef CameraControlResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct CameraControl
} // namespace common


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::common::CameraControl > {
  static const char* value()
  {
    return "1197f65cafe4f6185711fff0c923b4bd";
  }

  static const char* value(const ::common::CameraControl&) { return value(); }
};

template<>
struct DataType< ::common::CameraControl > {
  static const char* value()
  {
    return "common/CameraControl";
  }

  static const char* value(const ::common::CameraControl&) { return value(); }
};


// service_traits::MD5Sum< ::common::CameraControlRequest> should match
// service_traits::MD5Sum< ::common::CameraControl >
template<>
struct MD5Sum< ::common::CameraControlRequest>
{
  static const char* value()
  {
    return MD5Sum< ::common::CameraControl >::value();
  }
  static const char* value(const ::common::CameraControlRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::common::CameraControlRequest> should match
// service_traits::DataType< ::common::CameraControl >
template<>
struct DataType< ::common::CameraControlRequest>
{
  static const char* value()
  {
    return DataType< ::common::CameraControl >::value();
  }
  static const char* value(const ::common::CameraControlRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::common::CameraControlResponse> should match
// service_traits::MD5Sum< ::common::CameraControl >
template<>
struct MD5Sum< ::common::CameraControlResponse>
{
  static const char* value()
  {
    return MD5Sum< ::common::CameraControl >::value();
  }
  static const char* value(const ::common::CameraControlResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::common::CameraControlResponse> should match
// service_traits::DataType< ::common::CameraControl >
template<>
struct DataType< ::common::CameraControlResponse>
{
  static const char* value()
  {
    return DataType< ::common::CameraControl >::value();
  }
  static const char* value(const ::common::CameraControlResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // COMMON_MESSAGE_CAMERACONTROL_H