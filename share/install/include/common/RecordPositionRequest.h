// Generated by gencpp from file common/RecordPositionRequest.msg
// DO NOT EDIT!


#ifndef COMMON_MESSAGE_RECORDPOSITIONREQUEST_H
#define COMMON_MESSAGE_RECORDPOSITIONREQUEST_H


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
struct RecordPositionRequest_
{
  typedef RecordPositionRequest_<ContainerAllocator> Type;

  RecordPositionRequest_()
    : robot_state()
    , time()
    , position()  {
    }
  RecordPositionRequest_(const ContainerAllocator& _alloc)
    : robot_state(_alloc)
    , time(_alloc)
    , position(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<int32_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<int32_t>> _robot_state_type;
  _robot_state_type robot_state;

   typedef std::vector<float, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<float>> _time_type;
  _time_type time;

   typedef std::vector<float, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<float>> _position_type;
  _position_type position;





  typedef boost::shared_ptr< ::common::RecordPositionRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::common::RecordPositionRequest_<ContainerAllocator> const> ConstPtr;

}; // struct RecordPositionRequest_

typedef ::common::RecordPositionRequest_<std::allocator<void> > RecordPositionRequest;

typedef boost::shared_ptr< ::common::RecordPositionRequest > RecordPositionRequestPtr;
typedef boost::shared_ptr< ::common::RecordPositionRequest const> RecordPositionRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::common::RecordPositionRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::common::RecordPositionRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::common::RecordPositionRequest_<ContainerAllocator1> & lhs, const ::common::RecordPositionRequest_<ContainerAllocator2> & rhs)
{
  return lhs.robot_state == rhs.robot_state &&
    lhs.time == rhs.time &&
    lhs.position == rhs.position;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::common::RecordPositionRequest_<ContainerAllocator1> & lhs, const ::common::RecordPositionRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace common

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::common::RecordPositionRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::common::RecordPositionRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::common::RecordPositionRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::common::RecordPositionRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::common::RecordPositionRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::common::RecordPositionRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::common::RecordPositionRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "0944c7b7039144c641c036db46253e7b";
  }

  static const char* value(const ::common::RecordPositionRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x0944c7b7039144c6ULL;
  static const uint64_t static_value2 = 0x41c036db46253e7bULL;
};

template<class ContainerAllocator>
struct DataType< ::common::RecordPositionRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "common/RecordPositionRequest";
  }

  static const char* value(const ::common::RecordPositionRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::common::RecordPositionRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32[] robot_state\n"
"float32[] time\n"
"float32[] position\n"
;
  }

  static const char* value(const ::common::RecordPositionRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::common::RecordPositionRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.robot_state);
      stream.next(m.time);
      stream.next(m.position);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RecordPositionRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::common::RecordPositionRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::common::RecordPositionRequest_<ContainerAllocator>& v)
  {
    s << indent << "robot_state[]" << std::endl;
    for (size_t i = 0; i < v.robot_state.size(); ++i)
    {
      s << indent << "  robot_state[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.robot_state[i]);
    }
    s << indent << "time[]" << std::endl;
    for (size_t i = 0; i < v.time.size(); ++i)
    {
      s << indent << "  time[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.time[i]);
    }
    s << indent << "position[]" << std::endl;
    for (size_t i = 0; i < v.position.size(); ++i)
    {
      s << indent << "  position[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.position[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // COMMON_MESSAGE_RECORDPOSITIONREQUEST_H
