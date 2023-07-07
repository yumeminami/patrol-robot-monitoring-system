
"use strict";

let position_control = require('./position_control.js');
let velocity_control = require('./velocity_control.js');
let gimbal_motion_control = require('./gimbal_motion_control.js');
let setposition_control = require('./setposition_control.js');
let stop_control = require('./stop_control.js');
let voice_control = require('./voice_control.js');
let robot_real_time_info = require('./robot_real_time_info.js');
let sensor_data = require('./sensor_data.js');
let gimbal_control = require('./gimbal_control.js');
let charge_control = require('./charge_control.js');
let camera_control = require('./camera_control.js');

module.exports = {
  position_control: position_control,
  velocity_control: velocity_control,
  gimbal_motion_control: gimbal_motion_control,
  setposition_control: setposition_control,
  stop_control: stop_control,
  voice_control: voice_control,
  robot_real_time_info: robot_real_time_info,
  sensor_data: sensor_data,
  gimbal_control: gimbal_control,
  charge_control: charge_control,
  camera_control: camera_control,
};
