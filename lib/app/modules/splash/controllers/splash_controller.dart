import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart' hide Response;
import 'package:orizon/app/core/utils/error_dialogs.dart';
import 'package:orizon/app/data/model/register_model.dart';
import 'package:orizon/app/data/provider/local_storage.dart';
import 'package:orizon/app/data/services/app_config_service.dart';
import 'package:orizon/app/data/services/auth_service.dart';
import 'package:orizon/app/modules/splash/repository/splash_repo.dart';
import 'package:orizon/app/routes/app_pages.dart';
import 'package:orizon/firebase_options.dart';
import 'package:orizon/main.dart';

class SplashController extends GetxController {
 

  @override
  void onReady() async {
    await initializeServices();
    registerUser();
    super.onReady();
  }

  Future<void> initializeServices() async {
    await LocalStorageClient.getInstance().init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.playIntegrity,
      appleProvider: AppleProvider.debug,
    );
    cameras = await availableCameras();
    await Get.putAsync(() => AppConfigService().init(), permanent: true);
    await Get.putAsync(() => AuthService().init(), permanent: true);
  }

  void registerUser() async {

    final SplashRepo splashRepo = SplashRepo();
    final AuthService authService = Get.find();
    Response response = await splashRepo.registerUser();

    if (response.statusCode == 200) {
      RegisterModel data = registerModelFromJson(response.data);
      authService.accessToken = data.token;
      Get.toNamed(Routes.ONBOARDING);
    } else {
      ErrorDialogs.errorbottomSheet();
    }
  }
}
