import 'package:koko/model/status.dart';

class BaseResponse extends Status {

  dynamic data;

  BaseResponse(bool success, String? message, this.data) : super(success: success, message: message);

  factory BaseResponse.fromJson(Map<String, dynamic> json, dynamic data) {
    return _$BaseResponseFromJson(json, data);
  }

}

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json, dynamic data) {
  return BaseResponse(
    json['success'] as bool,
    json['message'] == null ? null : json['message'] as String,
    data == null ? null : data,
  );
}
