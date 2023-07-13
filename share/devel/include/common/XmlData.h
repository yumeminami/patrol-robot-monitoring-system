// Generated by gencpp from file common/XmlData.msg
// DO NOT EDIT!


#ifndef COMMON_MESSAGE_XMLDATA_H
#define COMMON_MESSAGE_XMLDATA_H

#include <ros/service_traits.h>


#include <common/XmlDataRequest.h>
#include <common/XmlDataResponse.h>


namespace common
{

struct XmlData
{

typedef XmlDataRequest Request;
typedef XmlDataResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct XmlData
} // namespace common


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::common::XmlData > {
  static const char* value()
  {
    return "c5819519b16be731a77f3869f8987fe2";
  }

  static const char* value(const ::common::XmlData&) { return value(); }
};

template<>
struct DataType< ::common::XmlData > {
  static const char* value()
  {
    return "common/XmlData";
  }

  static const char* value(const ::common::XmlData&) { return value(); }
};


// service_traits::MD5Sum< ::common::XmlDataRequest> should match
// service_traits::MD5Sum< ::common::XmlData >
template<>
struct MD5Sum< ::common::XmlDataRequest>
{
  static const char* value()
  {
    return MD5Sum< ::common::XmlData >::value();
  }
  static const char* value(const ::common::XmlDataRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::common::XmlDataRequest> should match
// service_traits::DataType< ::common::XmlData >
template<>
struct DataType< ::common::XmlDataRequest>
{
  static const char* value()
  {
    return DataType< ::common::XmlData >::value();
  }
  static const char* value(const ::common::XmlDataRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::common::XmlDataResponse> should match
// service_traits::MD5Sum< ::common::XmlData >
template<>
struct MD5Sum< ::common::XmlDataResponse>
{
  static const char* value()
  {
    return MD5Sum< ::common::XmlData >::value();
  }
  static const char* value(const ::common::XmlDataResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::common::XmlDataResponse> should match
// service_traits::DataType< ::common::XmlData >
template<>
struct DataType< ::common::XmlDataResponse>
{
  static const char* value()
  {
    return DataType< ::common::XmlData >::value();
  }
  static const char* value(const ::common::XmlDataResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // COMMON_MESSAGE_XMLDATA_H
