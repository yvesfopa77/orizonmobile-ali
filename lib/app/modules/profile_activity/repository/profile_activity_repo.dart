import 'dart:typed_data';
import 'package:dio/dio.dart' as dio;
import 'package:get/instance_manager.dart';
import 'package:http_parser/http_parser.dart';
import 'package:orizon/app/core/constants/app_constants.dart';
import 'package:orizon/app/data/provider/api_client.dart';
import 'package:orizon/app/data/services/auth_service.dart';

class ProfileActivityRepo {
  final AuthService _authService = Get.find();
  final ApiClient _apiClient = ApiClient();

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
}
