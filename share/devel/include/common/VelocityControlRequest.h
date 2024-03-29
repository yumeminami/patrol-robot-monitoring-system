// Generated by gencpp from file common/VelocityControlRequest.msg
// DO NOT EDIT!


#ifndef COMMON_MESSAGE_VELOCITYCONTROLREQUEST_H
#define COMMON_MESSAGE_VELOCITYCONTROLREQUEST_H


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
struct VelocityControlRequest_
{
  typedef VelocityControlRequest_<ContainerAllocator> Type;

  VelocityControlRequest_()
    : velocity_f(0.0)  {
    }
  VelocityControlRequest_(const ContainerAllocator& _alloc)
    : velocity_f(0.0)  {
  (void)_alloc;
    }



   typedef float _velocity_f_type;
  _velocity_f_type velocity_f;





  typedef boost::shared_ptr< ::common::VelocityControlRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::common::VelocityControlRequest_<ContainerAllocator> const> ConstPtr;

}; // struct VelocityControlRequest_

typedef ::common::VelocityControlRequest_<std::allocator<void> > VelocityControlRequest;

typedef boost::shared_ptr< ::common::VelocityControlRequest > VelocityControlRequestPtr;
typedef boost::shared_ptr< ::common::VelocityControlRequest const> VelocityControlRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::common::VelocityControlRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::common::VelocityControlRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::common::VelocityControlRequest_<ContainerAllocator1> & lhs, const ::common::VelocityControlRequest_<ContainerAllocator2> & rhs)
{
  return lhs.velocity_f == rhs.velocity_f;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::common::VelocityControlRequest_<ContainerAllocator1> & lhs, const ::common::VelocityControlRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace common

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::common::VelocityControlRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::common::VelocityControlRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::common::VelocityControlRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::common::VelocityControlRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::common::VelocityControlRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::common::VelocityControlRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::common::VelocityControlRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "67298657c9ef3f2768b496520fa1fd62";
  }

  static const char* value(const ::common::VelocityControlRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x67298657c9ef3f27ULL;
  static const uint64_t static_value2 = 0x68b496520fa1fd62ULL;
};

template<class ContainerAllocator>
struct DataType< ::common::VelocityControlRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "common/VelocityControlRequest";
  }

  static const char* value(const ::common::VelocityControlRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::common::VelocityControlRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 velocity_f #速度控制\n"
;
  }

  static const char* value(const ::common::VelocityControlRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::common::VelocityControlRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.velocity_f);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct VelocityControlRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::common::VelocityControlRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::common::VelocityControlRequest_<ContainerAllocator>& v)
  {
    s << indent << "velocity_f: ";
    Printer<float>::stream(s, indent + "  ", v.velocity_f);
  }
};

} // namespace message_operations
} // namespace ros

#endif // COMMON_MESSAGE_VELOCITYCONTROLREQUEST_H
