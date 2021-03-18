class MacDevice {
  String uniqueID;
  String modelID;
  String description;
  String deviceName;
  MacDeviceType type;
  MacDevice();
  MacDevice.fromjson(json) {
    this.uniqueID = json["UniqueID"];
    this.modelID = json["ModelID"];
    this.deviceName = json["LocalName"];
    this.description = json["Description"];
    print(json);
  }
  @override
  String toString() {
    return description;
  }
}
enum MacDeviceType{Audio,Video}