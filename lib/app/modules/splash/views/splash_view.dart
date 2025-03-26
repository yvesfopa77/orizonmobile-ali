import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary_color,
      body: Center(
          child: SvgPicture.asset(
        Images.home_card_business_icon,
        width: 122.w,
        colorFilter: const ColorFilter.mode(AppTheme.white_color, BlendMode.srcIn),
      )),
    );
  }
}
