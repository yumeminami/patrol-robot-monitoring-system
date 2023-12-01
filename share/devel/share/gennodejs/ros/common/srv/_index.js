
"use strict";

let ResetMap = require('./ResetMap.js')
let PanoramicVideoUrl = require('./PanoramicVideoUrl.js')
let XmlData = require('./XmlData.js')
let RecordPosition = require('./RecordPosition.js')
let X3CameraControl = require('./X3CameraControl.js')
let TakePicture = require('./TakePicture.js')
let GimbalMotionControl = require('./GimbalMotionControl.js')
let VelocityControl = require('./VelocityControl.js')
let LedControl = require('./LedControl.js')
let CameraControl = require('./CameraControl.js')
let ReportError = require('./ReportError.js')
let Upgrade = require('./Upgrade.js')
let PTZControl = require('./PTZControl.js')
let PositionControl = require('./PositionControl.js')
let FirmwareUpdate = require('./FirmwareUpdate.js')
let FireDoorControl = require('./FireDoorControl.js')
let PatrolPicture = require('./PatrolPicture.js')
let VideoData = require('./VideoData.js')
let ContinousXmlData = require('./ContinousXmlData.js')
let GimbalControl = require('./GimbalControl.js')
let Mapping = require('./Mapping.js')
let StopControl = require('./StopControl.js')
let PID = require('./PID.js')
let PatrolControl = require('./PatrolControl.js')

module.exports = {
  ResetMap: ResetMap,
  PanoramicVideoUrl: PanoramicVideoUrl,
  XmlData: XmlData,
  RecordPosition: RecordPosition,
  X3CameraControl: X3CameraControl,
  TakePicture: TakePicture,
  GimbalMotionControl: GimbalMotionControl,
  VelocityControl: VelocityControl,
  LedControl: LedControl,
  CameraControl: CameraControl,
  ReportError: ReportError,
  Upgrade: Upgrade,
  PTZControl: PTZControl,
  PositionControl: PositionControl,
  FirmwareUpdate: FirmwareUpdate,
  FireDoorControl: FireDoorControl,
  PatrolPicture: PatrolPicture,
  VideoData: VideoData,
  ContinousXmlData: ContinousXmlData,
  GimbalControl: GimbalControl,
  Mapping: Mapping,
  StopControl: StopControl,
  PID: PID,
  PatrolControl: PatrolControl,
};
