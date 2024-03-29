// Generated by gencpp from file common/PTZControl.msg
// DO NOT EDIT!


#ifndef COMMON_MESSAGE_PTZCONTROL_H
#define COMMON_MESSAGE_PTZCONTROL_H

#include <ros/service_traits.h>


#include <common/PTZControlRequest.h>
#include <common/PTZControlResponse.h>


namespace common
{

struct PTZControl
{

typedef PTZControlRequest Request;
typedef PTZControlResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct PTZControl
} // namespace common


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::common::PTZControl > {
  static const char* value()
  {
    return "a267aab3f4294d8ab764debe91952069";
  }

  static const char* value(const ::common::PTZControl&) { return value(); }
};

template<>
struct DataType< ::common::PTZControl > {
  static const char* value()
  {
    return "common/PTZControl";
  }

  static const char* value(const ::common::PTZControl&) { return value(); }
};


// service_traits::MD5Sum< ::common::PTZControlRequest> should match
// service_traits::MD5Sum< ::common::PTZControl >
template<>
struct MD5Sum< ::common::PTZControlRequest>
{
  static const char* value()
  {
    return MD5Sum< ::common::PTZControl >::value();
  }
  static const char* value(const ::common::PTZControlRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::common::PTZControlRequest> should match
// service_traits::DataType< ::common::PTZControl >
template<>
struct DataType< ::common::PTZControlRequest>
{
  static const char* value()
  {
    return DataType< ::common::PTZControl >::value();
  }
  static const char* value(const ::common::PTZControlRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::common::PTZControlResponse> should match
// service_traits::MD5Sum< ::common::PTZControl >
template<>
struct MD5Sum< ::common::PTZControlResponse>
{
  static const char* value()
  {
    return MD5Sum< ::common::PTZControl >::value();
  }
  static const char* value(const ::common::PTZControlResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::common::PTZControlResponse> should match
// service_traits::DataType< ::common::PTZControl >
template<>
struct DataType< ::common::PTZControlResponse>
{
  static const char* value()
  {
    return DataType< ::common::PTZControl >::value();
  }
  static const char* value(const ::common::PTZControlResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // COMMON_MESSAGE_PTZCONTROL_H
