// Generated by gencpp from file common/xml_dataRequest.msg
// DO NOT EDIT!


#ifndef COMMON_MESSAGE_XML_DATAREQUEST_H
#define COMMON_MESSAGE_XML_DATAREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/ByteMultiArray.h>

namespace common
{
template <class ContainerAllocator>
struct xml_dataRequest_
{
  typedef xml_dataRequest_<ContainerAllocator> Type;

  xml_dataRequest_()
    : data()  {
    }
  xml_dataRequest_(const ContainerAllocator& _alloc)
    : data(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::ByteMultiArray_<ContainerAllocator>  _data_type;
  _data_type data;





  typedef boost::shared_ptr< ::common::xml_dataRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::common::xml_dataRequest_<ContainerAllocator> const> ConstPtr;

}; // struct xml_dataRequest_

typedef ::common::xml_dataRequest_<std::allocator<void> > xml_dataRequest;

typedef boost::shared_ptr< ::common::xml_dataRequest > xml_dataRequestPtr;
typedef boost::shared_ptr< ::common::xml_dataRequest const> xml_dataRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::common::xml_dataRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::common::xml_dataRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::common::xml_dataRequest_<ContainerAllocator1> & lhs, const ::common::xml_dataRequest_<ContainerAllocator2> & rhs)
{
  return lhs.data == rhs.data;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::common::xml_dataRequest_<ContainerAllocator1> & lhs, const ::common::xml_dataRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace common

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::common::xml_dataRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::common::xml_dataRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::common::xml_dataRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::common::xml_dataRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::common::xml_dataRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::common::xml_dataRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::common::xml_dataRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "66d8e641bc88dff1ac4e4620b52311a3";
  }

  static const char* value(const ::common::xml_dataRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x66d8e641bc88dff1ULL;
  static const uint64_t static_value2 = 0xac4e4620b52311a3ULL;
};

template<class ContainerAllocator>
struct DataType< ::common::xml_dataRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "common/xml_dataRequest";
  }

  static const char* value(const ::common::xml_dataRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::common::xml_dataRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/ByteMultiArray data\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/ByteMultiArray\n"
"# Please look at the MultiArrayLayout message definition for\n"
"# documentation on all multiarrays.\n"
"\n"
"MultiArrayLayout  layout        # specification of data layout\n"
"byte[]            data          # array of data\n"
"\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/MultiArrayLayout\n"
"# The multiarray declares a generic multi-dimensional array of a\n"
"# particular data type.  Dimensions are ordered from outer most\n"
"# to inner most.\n"
"\n"
"MultiArrayDimension[] dim # Array of dimension properties\n"
"uint32 data_offset        # padding elements at front of data\n"
"\n"
"# Accessors should ALWAYS be written in terms of dimension stride\n"
"# and specified outer-most dimension first.\n"
"# \n"
"# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]\n"
"#\n"
"# A standard, 3-channel 640x480 image with interleaved color channels\n"
"# would be specified as:\n"
"#\n"
"# dim[0].label  = \"height\"\n"
"# dim[0].size   = 480\n"
"# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)\n"
"# dim[1].label  = \"width\"\n"
"# dim[1].size   = 640\n"
"# dim[1].stride = 3*640 = 1920\n"
"# dim[2].label  = \"channel\"\n"
"# dim[2].size   = 3\n"
"# dim[2].stride = 3\n"
"#\n"
"# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/MultiArrayDimension\n"
"string label   # label of given dimension\n"
"uint32 size    # size of given dimension (in type units)\n"
"uint32 stride  # stride of given dimension\n"
;
  }

  static const char* value(const ::common::xml_dataRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::common::xml_dataRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct xml_dataRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::common::xml_dataRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::common::xml_dataRequest_<ContainerAllocator>& v)
  {
    s << indent << "data: ";
    s << std::endl;
    Printer< ::std_msgs::ByteMultiArray_<ContainerAllocator> >::stream(s, indent + "  ", v.data);
  }
};

} // namespace message_operations
} // namespace ros

#endif // COMMON_MESSAGE_XML_DATAREQUEST_H
