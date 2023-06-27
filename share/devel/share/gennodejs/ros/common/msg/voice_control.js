// Auto-generated. Do not edit!

// (in-package common.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class voice_control {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.voice_command = null;
    }
    else {
      if (initObj.hasOwnProperty('voice_command')) {
        this.voice_command = initObj.voice_command
      }
      else {
        this.voice_command = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type voice_control
    // Serialize message field [voice_command]
    bufferOffset = _serializer.int32(obj.voice_command, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type voice_control
    let len;
    let data = new voice_control(null);
    // Deserialize message field [voice_command]
    data.voice_command = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'common/voice_control';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ab142bb934096e43e563146c9b3dc6ca';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 voice_command 
    #语音控制命令 0停止
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new voice_control(null);
    if (msg.voice_command !== undefined) {
      resolved.voice_command = msg.voice_command;
    }
    else {
      resolved.voice_command = 0
    }

    return resolved;
    }
};

module.exports = voice_control;
