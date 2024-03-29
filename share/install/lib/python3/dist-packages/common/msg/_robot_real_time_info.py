# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from common/robot_real_time_info.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class robot_real_time_info(genpy.Message):
  _md5sum = "3b8aa7073ad1bc4871cf8c840555bf9c"
  _type = "common/robot_real_time_info"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """float32 velocity                #运动速度
float32 position                #当前位置
int32 position_control_state    #位置控制状态：0 未完成 1 完成
int32 battery_state             #电池充电状态：0 代表充电 1 代表未充电
int32 battery_level             #电池电量(0-100)


"""
  __slots__ = ['velocity','position','position_control_state','battery_state','battery_level']
  _slot_types = ['float32','float32','int32','int32','int32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       velocity,position,position_control_state,battery_state,battery_level

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(robot_real_time_info, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.velocity is None:
        self.velocity = 0.
      if self.position is None:
        self.position = 0.
      if self.position_control_state is None:
        self.position_control_state = 0
      if self.battery_state is None:
        self.battery_state = 0
      if self.battery_level is None:
        self.battery_level = 0
    else:
      self.velocity = 0.
      self.position = 0.
      self.position_control_state = 0
      self.battery_state = 0
      self.battery_level = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_2f3i().pack(_x.velocity, _x.position, _x.position_control_state, _x.battery_state, _x.battery_level))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 20
      (_x.velocity, _x.position, _x.position_control_state, _x.battery_state, _x.battery_level,) = _get_struct_2f3i().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_2f3i().pack(_x.velocity, _x.position, _x.position_control_state, _x.battery_state, _x.battery_level))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 20
      (_x.velocity, _x.position, _x.position_control_state, _x.battery_state, _x.battery_level,) = _get_struct_2f3i().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2f3i = None
def _get_struct_2f3i():
    global _struct_2f3i
    if _struct_2f3i is None:
        _struct_2f3i = struct.Struct("<2f3i")
    return _struct_2f3i
