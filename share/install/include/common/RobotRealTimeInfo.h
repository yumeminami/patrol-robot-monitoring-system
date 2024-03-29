// Generated by gencpp from file common/RobotRealTimeInfo.msg
// DO NOT EDIT!


#ifndef COMMON_MESSAGE_ROBOTREALTIMEINFO_H
#define COMMON_MESSAGE_ROBOTREALTIMEINFO_H


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
struct RobotRealTimeInfo_
{
  typedef RobotRealTimeInfo_<ContainerAllocator> Type;

  RobotRealTimeInfo_()
    : velocity(0.0)
    , position(0.0)
    , position_control_state(0)
    , battery_state(0)
    , battery_level(0)  {
    }
  RobotRealTimeInfo_(const ContainerAllocator& _alloc)
    : velocity(0.0)
    , position(0.0)
    , position_control_state(0)
    , battery_state(0)
    , battery_level(0)  {
  (void)_alloc;
    }



   typedef float _velocity_type;
  _velocity_type velocity;

   typedef float _position_type;
  _position_type position;

   typedef int32_t _position_control_state_type;
  _position_control_state_type position_control_state;

   typedef int32_t _battery_state_type;
  _battery_state_type battery_state;

   typedef int32_t _battery_level_type;
  _battery_level_type battery_level;





  typedef boost::shared_ptr< ::common::RobotRealTimeInfo_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::common::RobotRealTimeInfo_<ContainerAllocator> const> ConstPtr;

}; // struct RobotRealTimeInfo_

typedef ::common::RobotRealTimeInfo_<std::allocator<void> > RobotRealTimeInfo;

typedef boost::shared_ptr< ::common::RobotRealTimeInfo > RobotRealTimeInfoPtr;
typedef boost::shared_ptr< ::common::RobotRealTimeInfo const> RobotRealTimeInfoConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::common::RobotRealTimeInfo_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::common::RobotRealTimeInfo_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::common::RobotRealTimeInfo_<ContainerAllocator1> & lhs, const ::common::RobotRealTimeInfo_<ContainerAllocator2> & rhs)
{
  return lhs.velocity == rhs.velocity &&
    lhs.position == rhs.position &&
    lhs.position_control_state == rhs.position_control_state &&
    lhs.battery_state == rhs.battery_state &&
    lhs.battery_level == rhs.battery_level;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::common::RobotRealTimeInfo_<ContainerAllocator1> & lhs, const ::common::RobotRealTimeInfo_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace common

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::common::RobotRealTimeInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::common::RobotRealTimeInfo_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::common::RobotRealTimeInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::common::RobotRealTimeInfo_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::common::RobotRealTimeInfo_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::common::RobotRealTimeInfo_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::common::RobotRealTimeInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "3b8aa7073ad1bc4871cf8c840555bf9c";
  }

  static const char* value(const ::common::RobotRealTimeInfo_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x3b8aa7073ad1bc48ULL;
  static const uint64_t static_value2 = 0x71cf8c840555bf9cULL;
};

template<class ContainerAllocator>
struct DataType< ::common::RobotRealTimeInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "common/RobotRealTimeInfo";
  }

  static const char* value(const ::common::RobotRealTimeInfo_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::common::RobotRealTimeInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 velocity                #运动速度\n"
"float32 position                #当前位置\n"
"int32 position_control_state    #位置控制状态：0 未完成 1 完成\n"
"int32 battery_state             #电池充电状态：0 代表充电 1 代表未充电\n"
"int32 battery_level             #电池电量(0-100)\n"
"\n"
"\n"
;
  }

  static const char* value(const ::common::RobotRealTimeInfo_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::common::RobotRealTimeInfo_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.velocity);
      stream.next(m.position);
      stream.next(m.position_control_state);
      stream.next(m.battery_state);
      stream.next(m.battery_level);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RobotRealTimeInfo_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::common::RobotRealTimeInfo_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::common::RobotRealTimeInfo_<ContainerAllocator>& v)
  {
    s << indent << "velocity: ";
    Printer<float>::stream(s, indent + "  ", v.velocity);
    s << indent << "position: ";
    Printer<float>::stream(s, indent + "  ", v.position);
    s << indent << "position_control_state: ";
    Printer<int32_t>::stream(s, indent + "  ", v.position_control_state);
    s << indent << "battery_state: ";
    Printer<int32_t>::stream(s, indent + "  ", v.battery_state);
    s << indent << "battery_level: ";
    Printer<int32_t>::stream(s, indent + "  ", v.battery_level);
  }
};

} // namespace message_operations
} // namespace ros

#endif // COMMON_MESSAGE_ROBOTREALTIMEINFO_H
