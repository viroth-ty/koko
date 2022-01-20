import 'dart:convert';

Status statusFromJson(String str) => Status.fromJson(json.decode(str));

String statusToJson(Status data) => json.encode(data.toJson());

class Status {
  Status({
    this.success,
    this.message,
  });

  bool? success;
  String? message;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    success: json["success"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message == null ? null : message,
  };
}
