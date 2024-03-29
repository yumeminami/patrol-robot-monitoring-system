// Generated by gencpp from file zj_robot/gimbalcontrolRequest.msg
// DO NOT EDIT!


#ifndef ZJ_ROBOT_MESSAGE_GIMBALCONTROLREQUEST_H
#define ZJ_ROBOT_MESSAGE_GIMBALCONTROLREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace zj_robot
{
template <class ContainerAllocator>
struct gimbalcontrolRequest_
{
  typedef gimbalcontrolRequest_<ContainerAllocator> Type;

  gimbalcontrolRequest_()
    : dwPTZCommand(0)
    , dwStop(0)
    , dwSpeed(0)  {
    }
  gimbalcontrolRequest_(const ContainerAllocator& _alloc)
    : dwPTZCommand(0)
    , dwStop(0)
    , dwSpeed(0)  {
  (void)_alloc;
    }



   typedef int32_t _dwPTZCommand_type;
  _dwPTZCommand_type dwPTZCommand;

   typedef int32_t _dwStop_type;
  _dwStop_type dwStop;

   typedef int32_t _dwSpeed_type;
  _dwSpeed_type dwSpeed;





  typedef boost::shared_ptr< ::zj_robot::gimbalcontrolRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::zj_robot::gimbalcontrolRequest_<ContainerAllocator> const> ConstPtr;

}; // struct gimbalcontrolRequest_

typedef ::zj_robot::gimbalcontrolRequest_<std::allocator<void> > gimbalcontrolRequest;

typedef boost::shared_ptr< ::zj_robot::gimbalcontrolRequest > gimbalcontrolRequestPtr;
typedef boost::shared_ptr< ::zj_robot::gimbalcontrolRequest const> gimbalcontrolRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::zj_robot::gimbalcontrolRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::zj_robot::gimbalcontrolRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::zj_robot::gimbalcontrolRequest_<ContainerAllocator1> & lhs, const ::zj_robot::gimbalcontrolRequest_<ContainerAllocator2> & rhs)
{
  return lhs.dwPTZCommand == rhs.dwPTZCommand &&
    lhs.dwStop == rhs.dwStop &&
    lhs.dwSpeed == rhs.dwSpeed;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::zj_robot::gimbalcontrolRequest_<ContainerAllocator1> & lhs, const ::zj_robot::gimbalcontrolRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace zj_robot

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::zj_robot::gimbalcontrolRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::zj_robot::gimbalcontrolRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::zj_robot::gimbalcontrolRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::zj_robot::gimbalcontrolRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::zj_robot::gimbalcontrolRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::zj_robot::gimbalcontrolRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::zj_robot::gimbalcontrolRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "696eb85cf5a060c2e0b25f83f6a572f3";
  }

  static const char* value(const ::zj_robot::gimbalcontrolRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x696eb85cf5a060c2ULL;
  static const uint64_t static_value2 = 0xe0b25f83f6a572f3ULL;
};

template<class ContainerAllocator>
struct DataType< ::zj_robot::gimbalcontrolRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "zj_robot/gimbalcontrolRequest";
  }

  static const char* value(const ::zj_robot::gimbalcontrolRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::zj_robot::gimbalcontrolRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# 客户端请求时发送的参数\n"
"int32 dwPTZCommand\n"
"int32 dwStop\n"
"int32 dwSpeed\n"
;
  }

  static const char* value(const ::zj_robot::gimbalcontrolRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::zj_robot::gimbalcontrolRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.dwPTZCommand);
      stream.next(m.dwStop);
      stream.next(m.dwSpeed);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct gimbalcontrolRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::zj_robot::gimbalcontrolRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::zj_robot::gimbalcontrolRequest_<ContainerAllocator>& v)
  {
    s << indent << "dwPTZCommand: ";
    Printer<int32_t>::stream(s, indent + "  ", v.dwPTZCommand);
    s << indent << "dwStop: ";
    Printer<int32_t>::stream(s, indent + "  ", v.dwStop);
    s << indent << "dwSpeed: ";
    Printer<int32_t>::stream(s, indent + "  ", v.dwSpeed);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ZJ_ROBOT_MESSAGE_GIMBALCONTROLREQUEST_H
