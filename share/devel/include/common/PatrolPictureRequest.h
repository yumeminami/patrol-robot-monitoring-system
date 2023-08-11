// Generated by gencpp from file common/PatrolPictureRequest.msg
// DO NOT EDIT!


#ifndef COMMON_MESSAGE_PATROLPICTUREREQUEST_H
#define COMMON_MESSAGE_PATROLPICTUREREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <sensor_msgs/Image.h>

namespace common
{
template <class ContainerAllocator>
struct PatrolPictureRequest_
{
  typedef PatrolPictureRequest_<ContainerAllocator> Type;

  PatrolPictureRequest_()
    : patrol_task_name()
    , patrol_point_index(0)
    , gimbal_point_index(0)
    , img()  {
    }
  PatrolPictureRequest_(const ContainerAllocator& _alloc)
    : patrol_task_name(_alloc)
    , patrol_point_index(0)
    , gimbal_point_index(0)
    , img(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _patrol_task_name_type;
  _patrol_task_name_type patrol_task_name;

   typedef int32_t _patrol_point_index_type;
  _patrol_point_index_type patrol_point_index;

   typedef int32_t _gimbal_point_index_type;
  _gimbal_point_index_type gimbal_point_index;

   typedef  ::sensor_msgs::Image_<ContainerAllocator>  _img_type;
  _img_type img;





  typedef boost::shared_ptr< ::common::PatrolPictureRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::common::PatrolPictureRequest_<ContainerAllocator> const> ConstPtr;

}; // struct PatrolPictureRequest_

typedef ::common::PatrolPictureRequest_<std::allocator<void> > PatrolPictureRequest;

typedef boost::shared_ptr< ::common::PatrolPictureRequest > PatrolPictureRequestPtr;
typedef boost::shared_ptr< ::common::PatrolPictureRequest const> PatrolPictureRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::common::PatrolPictureRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::common::PatrolPictureRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::common::PatrolPictureRequest_<ContainerAllocator1> & lhs, const ::common::PatrolPictureRequest_<ContainerAllocator2> & rhs)
{
  return lhs.patrol_task_name == rhs.patrol_task_name &&
    lhs.patrol_point_index == rhs.patrol_point_index &&
    lhs.gimbal_point_index == rhs.gimbal_point_index &&
    lhs.img == rhs.img;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::common::PatrolPictureRequest_<ContainerAllocator1> & lhs, const ::common::PatrolPictureRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace common

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::common::PatrolPictureRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::common::PatrolPictureRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::common::PatrolPictureRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::common::PatrolPictureRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::common::PatrolPictureRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::common::PatrolPictureRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::common::PatrolPictureRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "da494d891b7912e64dd9f9564a5f9b00";
  }

  static const char* value(const ::common::PatrolPictureRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xda494d891b7912e6ULL;
  static const uint64_t static_value2 = 0x4dd9f9564a5f9b00ULL;
};

template<class ContainerAllocator>
struct DataType< ::common::PatrolPictureRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "common/PatrolPictureRequest";
  }

  static const char* value(const ::common::PatrolPictureRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::common::PatrolPictureRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string patrol_task_name     #巡检任务名称 写在patrolpoints节点的Intro\n"
"int32 patrol_point_index    #巡检点索引\n"
"int32 gimbal_point_index    #云台运动预制点索引\n"
"sensor_msgs/Image img       #图片\n"
"\n"
"================================================================================\n"
"MSG: sensor_msgs/Image\n"
"# This message contains an uncompressed image\n"
"# (0, 0) is at top-left corner of image\n"
"#\n"
"\n"
"Header header        # Header timestamp should be acquisition time of image\n"
"                     # Header frame_id should be optical frame of camera\n"
"                     # origin of frame should be optical center of camera\n"
"                     # +x should point to the right in the image\n"
"                     # +y should point down in the image\n"
"                     # +z should point into to plane of the image\n"
"                     # If the frame_id here and the frame_id of the CameraInfo\n"
"                     # message associated with the image conflict\n"
"                     # the behavior is undefined\n"
"\n"
"uint32 height         # image height, that is, number of rows\n"
"uint32 width          # image width, that is, number of columns\n"
"\n"
"# The legal values for encoding are in file src/image_encodings.cpp\n"
"# If you want to standardize a new string format, join\n"
"# ros-users@lists.sourceforge.net and send an email proposing a new encoding.\n"
"\n"
"string encoding       # Encoding of pixels -- channel meaning, ordering, size\n"
"                      # taken from the list of strings in include/sensor_msgs/image_encodings.h\n"
"\n"
"uint8 is_bigendian    # is this data bigendian?\n"
"uint32 step           # Full row length in bytes\n"
"uint8[] data          # actual matrix data, size is (step * rows)\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::common::PatrolPictureRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::common::PatrolPictureRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.patrol_task_name);
      stream.next(m.patrol_point_index);
      stream.next(m.gimbal_point_index);
      stream.next(m.img);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PatrolPictureRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::common::PatrolPictureRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::common::PatrolPictureRequest_<ContainerAllocator>& v)
  {
    s << indent << "patrol_task_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.patrol_task_name);
    s << indent << "patrol_point_index: ";
    Printer<int32_t>::stream(s, indent + "  ", v.patrol_point_index);
    s << indent << "gimbal_point_index: ";
    Printer<int32_t>::stream(s, indent + "  ", v.gimbal_point_index);
    s << indent << "img: ";
    s << std::endl;
    Printer< ::sensor_msgs::Image_<ContainerAllocator> >::stream(s, indent + "  ", v.img);
  }
};

} // namespace message_operations
} // namespace ros

#endif // COMMON_MESSAGE_PATROLPICTUREREQUEST_H
