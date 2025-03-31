import 'package:bot_toast/bot_toast.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show ScreenUtilInit;
import 'package:get/get.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'app/routes/app_pages.dart';

late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
