// Generated by gencpp from file common/FireDoorControl.msg
// DO NOT EDIT!


#ifndef COMMON_MESSAGE_FIREDOORCONTROL_H
#define COMMON_MESSAGE_FIREDOORCONTROL_H

#include <ros/service_traits.h>


#include <common/FireDoorControlRequest.h>
#include <common/FireDoorControlResponse.h>


namespace common
{

struct FireDoorControl
{

typedef FireDoorControlRequest Request;
typedef FireDoorControlResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct FireDoorControl
} // namespace common


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::common::FireDoorControl > {
  static const char* value()
  {
    return "26b9aeb0208f157943a22b6e6a605823";
  }

  static const char* value(const ::common::FireDoorControl&) { return value(); }
};

template<>
struct DataType< ::common::FireDoorControl > {
  static const char* value()
  {
    return "common/FireDoorControl";
  }

  static const char* value(const ::common::FireDoorControl&) { return value(); }
};


// service_traits::MD5Sum< ::common::FireDoorControlRequest> should match
// service_traits::MD5Sum< ::common::FireDoorControl >
template<>
struct MD5Sum< ::common::FireDoorControlRequest>
{
  static const char* value()
  {
    return MD5Sum< ::common::FireDoorControl >::value();
  }
  static const char* value(const ::common::FireDoorControlRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::common::FireDoorControlRequest> should match
// service_traits::DataType< ::common::FireDoorControl >
template<>
struct DataType< ::common::FireDoorControlRequest>
{
  static const char* value()
  {
    return DataType< ::common::FireDoorControl >::value();
  }
  static const char* value(const ::common::FireDoorControlRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::common::FireDoorControlResponse> should match
// service_traits::MD5Sum< ::common::FireDoorControl >
template<>
struct MD5Sum< ::common::FireDoorControlResponse>
{
  static const char* value()
  {
    return MD5Sum< ::common::FireDoorControl >::value();
  }
  static const char* value(const ::common::FireDoorControlResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::common::FireDoorControlResponse> should match
// service_traits::DataType< ::common::FireDoorControl >
template<>
struct DataType< ::common::FireDoorControlResponse>
{
  static const char* value()
  {
    return DataType< ::common::FireDoorControl >::value();
  }
  static const char* value(const ::common::FireDoorControlResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // COMMON_MESSAGE_FIREDOORCONTROL_H