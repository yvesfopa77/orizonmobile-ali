import 'package:bot_toast/bot_toast.dart';
import 'package:camera/camera.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show ScreenUtilInit;
import 'package:get/get.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/data/provider/local_storage.dart';
import 'package:orizon/app/data/services/app_config_service.dart';
import 'package:orizon/app/data/services/auth_service.dart';
import 'package:orizon/firebase_options.dart';
import 'app/routes/app_pages.dart';

late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageClient.getInstance().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
    appleProvider: AppleProvider.appAttestWithDeviceCheckFallback,
  );

  cameras = await availableCameras();
  await initServices();
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "orizon",
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: AppTheme.apptheme,
        getPages: AppPages.routes,
        initialRoute: Routes.SPLASH,
      ),
    ),
  );
}

Future<void> initServices() async {
  await Get.putAsync(() => AppConfigService().init());
  await Get.putAsync(() => AuthService().init());
}
