// Generated by gencpp from file common/StopControlRequest.msg
// DO NOT EDIT!


#ifndef COMMON_MESSAGE_STOPCONTROLREQUEST_H
#define COMMON_MESSAGE_STOPCONTROLREQUEST_H


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
struct StopControlRequest_
{
  typedef StopControlRequest_<ContainerAllocator> Type;

  StopControlRequest_()
    : stop_type(0)  {
    }
  StopControlRequest_(const ContainerAllocator& _alloc)
    : stop_type(0)  {
  (void)_alloc;
    }



   typedef int32_t _stop_type_type;
  _stop_type_type stop_type;





  typedef boost::shared_ptr< ::common::StopControlRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::common::StopControlRequest_<ContainerAllocator> const> ConstPtr;

}; // struct StopControlRequest_

typedef ::common::StopControlRequest_<std::allocator<void> > StopControlRequest;

typedef boost::shared_ptr< ::common::StopControlRequest > StopControlRequestPtr;
typedef boost::shared_ptr< ::common::StopControlRequest const> StopControlRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::common::StopControlRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::common::StopControlRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::common::StopControlRequest_<ContainerAllocator1> & lhs, const ::common::StopControlRequest_<ContainerAllocator2> & rhs)
{
  return lhs.stop_type == rhs.stop_type;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::common::StopControlRequest_<ContainerAllocator1> & lhs, const ::common::StopControlRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace common

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::common::StopControlRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::common::StopControlRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::common::StopControlRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::common::StopControlRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::common::StopControlRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::common::StopControlRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::common::StopControlRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "1b6fac8d08de0982f05ab0aa2f3aa6b5";
  }

  static const char* value(const ::common::StopControlRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x1b6fac8d08de0982ULL;
  static const uint64_t static_value2 = 0xf05ab0aa2f3aa6b5ULL;
};

template<class ContainerAllocator>
struct DataType< ::common::StopControlRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "common/StopControlRequest";
  }

  static const char* value(const ::common::StopControlRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::common::StopControlRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 stop_type #0 stop 1 stop 2 kill\n"
;
  }

  static const char* value(const ::common::StopControlRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::common::StopControlRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.stop_type);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct StopControlRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::common::StopControlRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::common::StopControlRequest_<ContainerAllocator>& v)
  {
    s << indent << "stop_type: ";
    Printer<int32_t>::stream(s, indent + "  ", v.stop_type);
  }
};

} // namespace message_operations
} // namespace ros

#endif // COMMON_MESSAGE_STOPCONTROLREQUEST_H
