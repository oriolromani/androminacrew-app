class FCMDevice {
  //final int id;
  String name;
  String registration_id;
  String device_id;
  bool active;
  String type;

  FCMDevice(
      {required this.name,
        required this.registration_id,
        required this.device_id,
        required this.active,
        required this.type,
      });

  FCMDevice.fromJson(Map<String, dynamic> json) :
        name = json['name'],
        registration_id = json['registration_id'],
        device_id = json['device_id'],
        active = json['active'],
        type = json['type'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['registration_id'] = this.registration_id;
    data['device_id'] = this.device_id;
    data['active'] = this.active;
    data['type'] = this.type;
    return data;
  }
}