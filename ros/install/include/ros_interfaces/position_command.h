// Generated by gencpp from file ros_interfaces/position_command.msg
// DO NOT EDIT!


#ifndef ROS_INTERFACES_MESSAGE_POSITION_COMMAND_H
#define ROS_INTERFACES_MESSAGE_POSITION_COMMAND_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ros_interfaces
{
template <class ContainerAllocator>
struct position_command_
{
  typedef position_command_<ContainerAllocator> Type;

  position_command_()
    : position_control_type(0)
    , target_position_f(0.0)
    , velocity_f(0.0)  {
    }
  position_command_(const ContainerAllocator& _alloc)
    : position_control_type(0)
    , target_position_f(0.0)
    , velocity_f(0.0)  {
  (void)_alloc;
    }



   typedef int32_t _position_control_type_type;
  _position_control_type_type position_control_type;

   typedef float _target_position_f_type;
  _target_position_f_type target_position_f;

   typedef float _velocity_f_type;
  _velocity_f_type velocity_f;





  typedef boost::shared_ptr< ::ros_interfaces::position_command_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ros_interfaces::position_command_<ContainerAllocator> const> ConstPtr;

}; // struct position_command_

typedef ::ros_interfaces::position_command_<std::allocator<void> > position_command;

typedef boost::shared_ptr< ::ros_interfaces::position_command > position_commandPtr;
typedef boost::shared_ptr< ::ros_interfaces::position_command const> position_commandConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ros_interfaces::position_command_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ros_interfaces::position_command_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ros_interfaces::position_command_<ContainerAllocator1> & lhs, const ::ros_interfaces::position_command_<ContainerAllocator2> & rhs)
{
  return lhs.position_control_type == rhs.position_control_type &&
    lhs.target_position_f == rhs.target_position_f &&
    lhs.velocity_f == rhs.velocity_f;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ros_interfaces::position_command_<ContainerAllocator1> & lhs, const ::ros_interfaces::position_command_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ros_interfaces

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ros_interfaces::position_command_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ros_interfaces::position_command_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_interfaces::position_command_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_interfaces::position_command_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_interfaces::position_command_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_interfaces::position_command_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ros_interfaces::position_command_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4b361bcfd5b1a1843f6bad475de30172";
  }

  static const char* value(const ::ros_interfaces::position_command_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4b361bcfd5b1a184ULL;
  static const uint64_t static_value2 = 0x3f6bad475de30172ULL;
};

template<class ContainerAllocator>
struct DataType< ::ros_interfaces::position_command_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ros_interfaces/position_command";
  }

  static const char* value(const ::ros_interfaces::position_command_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ros_interfaces::position_command_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 position_control_type #0表示绝对位置 1表示相对位置\n"
"float32 target_position_f #目标位置 单位：mm\n"
"float32 velocity_f #速度 单位mm/s\n"
;
  }

  static const char* value(const ::ros_interfaces::position_command_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ros_interfaces::position_command_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.position_control_type);
      stream.next(m.target_position_f);
      stream.next(m.velocity_f);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct position_command_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ros_interfaces::position_command_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ros_interfaces::position_command_<ContainerAllocator>& v)
  {
    s << indent << "position_control_type: ";
    Printer<int32_t>::stream(s, indent + "  ", v.position_control_type);
    s << indent << "target_position_f: ";
    Printer<float>::stream(s, indent + "  ", v.target_position_f);
    s << indent << "velocity_f: ";
    Printer<float>::stream(s, indent + "  ", v.velocity_f);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROS_INTERFACES_MESSAGE_POSITION_COMMAND_H
