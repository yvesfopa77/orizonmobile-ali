import 'package:get/get.dart';
import 'package:orizon/app/data/services/app_config_service.dart';

class AuthService {
  Future<AuthService> init() async => this;
  final AppConfigService _appConfigService = Get.find();

  String get fcmToken => _appConfigService.fcmToken ?? "";

  String? accessToken;
}
