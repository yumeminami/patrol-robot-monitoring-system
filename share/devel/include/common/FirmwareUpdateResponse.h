// Generated by gencpp from file common/FirmwareUpdateResponse.msg
// DO NOT EDIT!


#ifndef COMMON_MESSAGE_FIRMWAREUPDATERESPONSE_H
#define COMMON_MESSAGE_FIRMWAREUPDATERESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace common
{
template <class ContainerAllocator>
struct FirmwareUpdateResponse_
{
  typedef FirmwareUpdateResponse_<ContainerAllocator> Type;

  FirmwareUpdateResponse_()
    : status_code(0)  {
    }
  FirmwareUpdateResponse_(const ContainerAllocator& _alloc)
    : status_code(0)  {
  (void)_alloc;
    }



   typedef int32_t _status_code_type;
  _status_code_type status_code;





  typedef boost::shared_ptr< ::common::FirmwareUpdateResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::common::FirmwareUpdateResponse_<ContainerAllocator> const> ConstPtr;

}; // struct FirmwareUpdateResponse_

typedef ::common::FirmwareUpdateResponse_<std::allocator<void> > FirmwareUpdateResponse;

typedef boost::shared_ptr< ::common::FirmwareUpdateResponse > FirmwareUpdateResponsePtr;
typedef boost::shared_ptr< ::common::FirmwareUpdateResponse const> FirmwareUpdateResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::common::FirmwareUpdateResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::common::FirmwareUpdateResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::common::FirmwareUpdateResponse_<ContainerAllocator1> & lhs, const ::common::FirmwareUpdateResponse_<ContainerAllocator2> & rhs)
{
  return lhs.status_code == rhs.status_code;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::common::FirmwareUpdateResponse_<ContainerAllocator1> & lhs, const ::common::FirmwareUpdateResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace common

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::common::FirmwareUpdateResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::common::FirmwareUpdateResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::common::FirmwareUpdateResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::common::FirmwareUpdateResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::common::FirmwareUpdateResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::common::FirmwareUpdateResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::common::FirmwareUpdateResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "7714e81371f09d2d15e163f37002ef48";
  }

  static const char* value(const ::common::FirmwareUpdateResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x7714e81371f09d2dULL;
  static const uint64_t static_value2 = 0x15e163f37002ef48ULL;
};

template<class ContainerAllocator>
struct DataType< ::common::FirmwareUpdateResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "common/FirmwareUpdateResponse";
  }

  static const char* value(const ::common::FirmwareUpdateResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::common::FirmwareUpdateResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 status_code #0失败，1完成\n"
"\n"
"\n"
"\n"
;
  }

  static const char* value(const ::common::FirmwareUpdateResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::common::FirmwareUpdateResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.status_code);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct FirmwareUpdateResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::common::FirmwareUpdateResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::common::FirmwareUpdateResponse_<ContainerAllocator>& v)
  {
    s << indent << "status_code: ";
    Printer<int32_t>::stream(s, indent + "  ", v.status_code);
  }
};

} // namespace message_operations
} // namespace ros

#endif // COMMON_MESSAGE_FIRMWAREUPDATERESPONSE_H
