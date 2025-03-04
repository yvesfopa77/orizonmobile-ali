import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/global_widgets/gradient_triangle.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/routes/app_pages.dart';

import '../controllers/profile_intro_controller.dart';

class ProfileIntroView extends GetView<ProfileIntroController> {
  const ProfileIntroView({super.key});
  @override
  Widget build(BuildContext context) {
    return GradientTriangle(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: HorizontalPadding(
            child: SafeArea(
              child: Column(
                children: [
                  250.verticalSpace,
                  Text(
                    " Welcome to ORIZON",
                    style: AppTextStyle.s24.medium.black,
                  ),
                  20.verticalSpace,
                  Text(
                    "Your accountisundervalidation and shouldbe active within 24h.",
                    style: AppTextStyle.s13.regular.grey,
                    textAlign: TextAlign.center,
                  ),
                  20.verticalSpace,
                  Text(
                    "Create your ORIZON profile nowto start building  yourworld of opportunities",
                    style: AppTextStyle.s13.regular.grey,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () => Get.toNamed(Routes.PROFILE_ACTIVITY),
                      child: const Text('Start Now')),
                  40.verticalSpace,
                ],
              ),
            ),
          )),
    );
  }
}
