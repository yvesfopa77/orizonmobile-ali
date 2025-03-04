import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:orizon/app/core/constants/app_constants.dart';
import 'package:orizon/app/data/provider/api_client.dart';
import 'package:orizon/app/data/services/auth_service.dart';

class OtpVerificationRepo {
  final ApiClient _apiClient = ApiClient();
  final AuthService _authService = Get.find();
  Future<Response> verifiyOtp(String code) {
    var data = {
      'fcmtoken': _authService.fcmToken,
      'mobilephonenumber': Get.arguments,
      "code": code
    };

    return _apiClient.postData(AppConstants.verifiy_otp_endPoint, data);
  }


  Future<Response> resendOtp() {
    var data = json.encode({
      'fcmtoken': _authService.fcmToken,
      'mobilephonenumber': Get.arguments,
    });

    return _apiClient.postData(AppConstants.send_otp_endPoint, data);
  }
}
