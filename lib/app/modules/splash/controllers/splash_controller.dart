import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:orizon/app/core/utils/error_dialogs.dart';
import 'package:orizon/app/data/model/register_model.dart';
import 'package:orizon/app/data/services/auth_service.dart';
import 'package:orizon/app/modules/splash/repository/splash_repo.dart';
import 'package:orizon/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final SplashRepo _splashRepo = SplashRepo();

  final AuthService _authService = Get.find();

  @override
  void onInit() {
    registerUser();
    super.onInit();
  }

  void registerUser() async {
    Response response = await _splashRepo.registerUser();

    if (response.statusCode == 200) {
      RegisterModel data = registerModelFromJson(response.data);
      _authService.accessToken = data.token;
      Get.toNamed(Routes.ONBOARDING);
    } else {
      ErrorDialogs.errorbottomSheet();
    }
  }
}
