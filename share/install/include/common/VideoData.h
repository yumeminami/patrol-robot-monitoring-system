// Generated by gencpp from file common/VideoData.msg
// DO NOT EDIT!


#ifndef COMMON_MESSAGE_VIDEODATA_H
#define COMMON_MESSAGE_VIDEODATA_H

#include <ros/service_traits.h>


#include <common/VideoDataRequest.h>
#include <common/VideoDataResponse.h>


namespace common
{

struct VideoData
{

typedef VideoDataRequest Request;
typedef VideoDataResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct VideoData
} // namespace common


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::common::VideoData > {
  static const char* value()
  {
    return "baa99bb834c12c1333deff1c3344d500";
  }

  static const char* value(const ::common::VideoData&) { return value(); }
};

template<>
struct DataType< ::common::VideoData > {
  static const char* value()
  {
    return "common/VideoData";
  }

  static const char* value(const ::common::VideoData&) { return value(); }
};


// service_traits::MD5Sum< ::common::VideoDataRequest> should match
// service_traits::MD5Sum< ::common::VideoData >
template<>
struct MD5Sum< ::common::VideoDataRequest>
{
  static const char* value()
  {
    return MD5Sum< ::common::VideoData >::value();
  }
  static const char* value(const ::common::VideoDataRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::common::VideoDataRequest> should match
// service_traits::DataType< ::common::VideoData >
template<>
struct DataType< ::common::VideoDataRequest>
{
  static const char* value()
  {
    return DataType< ::common::VideoData >::value();
  }
  static const char* value(const ::common::VideoDataRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::common::VideoDataResponse> should match
// service_traits::MD5Sum< ::common::VideoData >
template<>
struct MD5Sum< ::common::VideoDataResponse>
{
  static const char* value()
  {
    return MD5Sum< ::common::VideoData >::value();
  }
  static const char* value(const ::common::VideoDataResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::common::VideoDataResponse> should match
// service_traits::DataType< ::common::VideoData >
template<>
struct DataType< ::common::VideoDataResponse>
{
  static const char* value()
  {
    return DataType< ::common::VideoData >::value();
  }
  static const char* value(const ::common::VideoDataResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // COMMON_MESSAGE_VIDEODATA_H