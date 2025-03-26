import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:orizon/app/core/constants/app_constants.dart';
import 'package:orizon/app/data/provider/api_client.dart';
import 'package:orizon/app/data/services/auth_service.dart';

class SplashRepo {
  final ApiClient _apiClient = ApiClient();
  final AuthService _authService = Get.find();

  Future<Response> registerUser() {
    var data = json
        .encode({'fcmtoken': _authService.fcmToken, 'password': '38934893'});

    return _apiClient.postData(AppConstants.register_endPoint, data);
  }
}
