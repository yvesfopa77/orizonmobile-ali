import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/modules/onboarding/controllers/onboarding_controller.dart';

class BottomImage extends GetView<OnboardingController> {
  const BottomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -35.r,
      right: -35.r,
      child: Obx(
        () => Transform.scale(
          alignment: Alignment.bottomRight,
          scale: controller.animationValue.value,
          child: SvgPicture.asset(
            Images.onboarding_logo,
            width: 234.r,
            colorFilter: const ColorFilter.mode(AppTheme.primary_color, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
