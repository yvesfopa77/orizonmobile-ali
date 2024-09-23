import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/modules/onboarding/views/onboarding_3.dart';
import 'package:orizon/app/modules/onboarding/views/widgets/progress_widget.dart';
import 'package:orizon/app/routes/app_pages.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Images.splash_bg,
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.verticalSpace,
              HorizontalPadding(
                child: Row(
                  children: [
                    Text(
                      'Generate',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.s32.regular.white,
                    ),
                    const Spacer(),
                    const Row(children: [
                      RotatedSign(isSelected: false),
                      RotatedSign(isSelected: true),
                      RotatedSign(isSelected: false)
                    ])
                  ],
                ),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                      top: 0,
                      child:
                          SvgPicture.asset(Images.splash_text_background_line)),
                  HorizontalPadding(
                    child: Text(
                      'REVENUE',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.s40.bold.white.copyWith(height: 1),
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              const Spacer(),
              Row(
                children: [
                  TextButton(
                    onPressed: () => Get.offAllNamed(Routes.COUNTRY_SCREEN),
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    child: const Text("Skip"),
                  ),
                  const Spacer(),
                  HorizontalPadding(
                    child: ElevatedButton(
                      onPressed: () => Get.off(() => const Onboarding3(),
                          transition: Transition.fadeIn),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(110.w, 50)),
                      child: const Text("Next"),
                    ),
                  )
                ],
              ),
              20.verticalSpace,
            ],
          ))
        ],
      ),
    );
  }
}
