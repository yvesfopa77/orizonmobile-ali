import 'dart:convert';

import 'package:get/get.dart';
import 'package:orizon/app/data/services/auth_service.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
OnboardingDataModel onboardingDataModel = OnboardingDataModel();

class OnboardingDataModel {
  final String? firstname;
  final String? lastname;
  final String? birthdate;
  final String? city;
  final String? streetaddress;
  final String? iddoctype;
  final String? gender;
  final String? countryofresidence;
  final String? countryofbirth;
  final String? pinccode;
  OnboardingDataModel({
    this.firstname,
    this.lastname,
    this.birthdate,
    this.city,
    this.streetaddress,
    this.iddoctype,
    this.gender,
    this.countryofresidence,
    this.countryofbirth,
    this.pinccode,
  });


  OnboardingDataModel copyWith({
    String? firstname,
    String? lastname,
    String? birthdate,
    String? city,
    String? streetaddress,
    String? iddoctype,
    String? gender,
    String? countryofresidence,
    String? countryofbirth,
    String? pinccode,
  }) {
    return OnboardingDataModel(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      birthdate: birthdate ?? this.birthdate,
      city: city ?? this.city,
      streetaddress: streetaddress ?? this.streetaddress,
      iddoctype: iddoctype ?? this.iddoctype,
      gender: gender ?? this.gender,
      countryofresidence: countryofresidence ?? this.countryofresidence,
      countryofbirth: countryofbirth ?? this.countryofbirth,
      pinccode: pinccode ?? this.pinccode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fcmtoken': Get.find<AuthService>().fcmToken,
      'firstname': firstname,
      'lastname': lastname,
      'birthdate': birthdate,
      'city': city,
      'streetaddress': streetaddress,
      'iddoctype': "NATIONALID",
      'gender': gender,
      'countryofresidence': countryofresidence,
      'countryofbirth': countryofbirth,
      'pinccode': pinccode,
    };
  }

  String toJson() => json.encode(toMap());

}
