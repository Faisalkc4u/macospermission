class CameraDevice {
  String uniqueID;
  String modelID;
  String description;
  String deviceName;
  CameraDevice();
  CameraDevice.fromjson(json) {
    this.uniqueID = json["UniqueID"];
    this.modelID = json["ModelID"];
    this.deviceName = json["LocalName"];
    this.description = json["Description"];
  }
  @override
  String toString() {
    return description;
  }
}
