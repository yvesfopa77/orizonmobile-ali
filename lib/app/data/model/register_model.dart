// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  bool success;
  String msg;
  Data data;
  String token;

  RegisterModel({
    required this.success,
    required this.msg,
    required this.data,
    required this.token,
  });

  RegisterModel copyWith({
    bool? success,
    String? msg,
    Data? data,
    String? token,
  }) =>
      RegisterModel(
        success: success ?? this.success,
        msg: msg ?? this.msg,
        data: data ?? this.data,
        token: token ?? this.token,
      );

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        success: json["success"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
        token: json["token"],
      );
  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data.toJson(),
        "token": token,
      };
}

class Data {
  List<CustomerId> customerId;

  Data({
    required this.customerId,
  });

  Data copyWith({
    List<CustomerId>? customerId,
  }) =>
      Data(
        customerId: customerId ?? this.customerId,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        customerId: List<CustomerId>.from(json["customerId"].map((x) => CustomerId.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customerId": List<dynamic>.from(customerId.map((x) => x.toJson())),
      };
}

class CustomerId {
  String id;

  CustomerId({
    required this.id,
  });

  CustomerId copyWith({
    String? id,
  }) =>
      CustomerId(
        id: id ?? this.id,
      );

  factory CustomerId.fromJson(Map<String, dynamic> json) => CustomerId(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
