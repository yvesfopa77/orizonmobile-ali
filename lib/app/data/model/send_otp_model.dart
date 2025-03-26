// To parse this JSON data, do
//
//     final sendOtpModel = sendOtpModelFromJson(jsonString);

import 'dart:convert';

SendOtpModel sendOtpModelFromJson(String str) => SendOtpModel.fromJson(json.decode(str));

String sendOtpModelToJson(SendOtpModel data) => json.encode(data.toJson());

class SendOtpModel {
  bool success;
  String msg;
  List<dynamic> data;

  SendOtpModel({
    required this.success,
    required this.msg,
    required this.data,
  });

  SendOtpModel copyWith({
    bool? success,
    String? msg,
    List<dynamic>? data,
  }) =>
      SendOtpModel(
        success: success ?? this.success,
        msg: msg ?? this.msg,
        data: data ?? this.data,
      );

  factory SendOtpModel.fromJson(Map<String, dynamic> json) => SendOtpModel(
        success: json["success"],
        msg: json["msg"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
