// Auto-generated. Do not edit!

// (in-package ros_interfaces.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class velocity_command {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.velocity_f = null;
    }
    else {
      if (initObj.hasOwnProperty('velocity_f')) {
        this.velocity_f = initObj.velocity_f
      }
      else {
        this.velocity_f = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type velocity_command
    // Serialize message field [velocity_f]
    bufferOffset = _serializer.float32(obj.velocity_f, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type velocity_command
    let len;
    let data = new velocity_command(null);
    // Deserialize message field [velocity_f]
    data.velocity_f = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interfaces/velocity_command';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '67298657c9ef3f2768b496520fa1fd62';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 velocity_f #速度控制
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new velocity_command(null);
    if (msg.velocity_f !== undefined) {
      resolved.velocity_f = msg.velocity_f;
    }
    else {
      resolved.velocity_f = 0.0
    }

    return resolved;
    }
};

module.exports = velocity_command;
