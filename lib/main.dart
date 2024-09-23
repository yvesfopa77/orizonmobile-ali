import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show ScreenUtilInit;

import 'package:get/get.dart';
import 'package:orizon/app/core/theme/app_theme.dart';

import 'app/routes/app_pages.dart';

late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "orizon",
        initialRoute: Routes.SPLASH,
        theme: AppTheme.apptheme,
        getPages: AppPages.routes,
      ),
    ),
  );
}
