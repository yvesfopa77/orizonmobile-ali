import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart' as dio;
import 'package:get/instance_manager.dart';
import 'package:http_parser/http_parser.dart';
import 'package:orizon/app/core/constants/app_constants.dart';
import 'package:orizon/app/data/model/onboarding_data_model.dart';
import 'package:orizon/app/data/provider/api_client.dart';
import 'package:orizon/app/data/services/auth_service.dart';

class PersonalDataRepo {
  final AuthService _authService = Get.find();
  final ApiClient _apiClient = ApiClient();
  final ApiClientGoogleCloud _apiClientGoogleCloud = ApiClientGoogleCloud();

  Future<dio.Response> saveSignature(Uint8List image) async {
    var data = dio.FormData.fromMap({
      'usersignature': dio.MultipartFile.fromBytes(
        image,
        filename: 'signature3.png',
        contentType: MediaType("image", "png"),
      ),
      'fcmtoken': _authService.fcmToken
    });
    return _apiClient.postData(
      AppConstants.onboarding_signature_endPoint,
      data,
    );
  }

  Future<dio.Response> userOnboarding() async {
    return _apiClient.postData(
      AppConstants.onboarding_customer_endPoint,
      onboardingDataModel.toJson(),
    );
  }

  Future<dio.Response> getCitySuggestions(String query) async {
    final requestBody = jsonEncode({
      'input': query,
      'includedPrimaryTypes': ['(cities)'],
    });
    const url = 'https://places.googleapis.com/v1/places:autocomplete';
    return _apiClientGoogleCloud.postData(
      url,
      requestBody,
      headers: {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': AppConstants.google_api_key,
        "X-Goog-FieldMask": "*"
      },
    );
  }
}
