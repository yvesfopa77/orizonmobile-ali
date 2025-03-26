import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:orizon/app/core/constants/app_constants.dart';
import 'package:orizon/app/data/provider/api_client.dart';
import 'package:orizon/app/data/services/auth_service.dart';

class PhoneNumberRepo {
  final ApiClient _apiClient = ApiClient();
  final AuthService _authService = Get.find();

  Future<Response> sendPhoneOtp(String phoneNumber) {
    var data = json.encode({
      'fcmtoken': _authService.fcmToken,
      'mobilephonenumber': phoneNumber,
    });

    return _apiClient.postData(AppConstants.send_otp_endPoint, data);
  }
}
