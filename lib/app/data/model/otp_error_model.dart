// To parse this JSON data, do
//
//     final otpErrorModel = otpErrorModelFromJson(jsonString);

import 'dart:convert';

OtpErrorModel otpErrorModelFromJson(String str) => OtpErrorModel.fromJson(json.decode(str));

String otpErrorModelToJson(OtpErrorModel data) => json.encode(data.toJson());

class OtpErrorModel {
  bool success;
  String msg;
  Data data;

  OtpErrorModel({
    required this.success,
    required this.msg,
    required this.data,
  });

  OtpErrorModel copyWith({
    bool? success,
    String? msg,
    Data? data,
  }) =>
      OtpErrorModel(
        success: success ?? this.success,
        msg: msg ?? this.msg,
        data: data ?? this.data,
      );

  factory OtpErrorModel.fromJson(Map<String, dynamic> json) => OtpErrorModel(
        success: json["success"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  int status;
  int code;
  String moreInfo;

  Data({
    required this.status,
    required this.code,
    required this.moreInfo,
  });

  Data copyWith({
    int? status,
    int? code,
    String? moreInfo,
  }) =>
      Data(
        status: status ?? this.status,
        code: code ?? this.code,
        moreInfo: moreInfo ?? this.moreInfo,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        code: json["code"],
        moreInfo: json["moreInfo"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "moreInfo": moreInfo,
      };
}
