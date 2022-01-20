import 'dart:convert';

Authorize authorizeFromJson(String str) => Authorize.fromJson(json.decode(str));

String authorizeToJson(Authorize data) => json.encode(data.toJson());

class Authorize {
  Authorize({
    required this.token,
    this.deviceId,
    this.deviceName,
    this.deviceInfo,
    required this.deviceOs,
    this.expiredDate,
  });

  String token;
  String? deviceId;
  String? deviceName;
  String? deviceInfo;
  String deviceOs;
  int? expiredDate;

  factory Authorize.fromJson(Map<String, dynamic> json) => Authorize(
    token: json["token"],
    deviceId: json["device_id"],
    deviceName: json["device_name"],
    deviceInfo: json["device_info"],
    deviceOs: json["device_os"],
    expiredDate: json["expired_date"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "device_id": deviceId,
    "device_name": deviceName,
    "device_info": deviceInfo,
    "device_os": deviceOs,
    "expired_date": expiredDate,
  };
}
