import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/modules/onboarding/views/widgets/bottom_image.dart';
import 'package:orizon/app/modules/onboarding/views/widgets/onboarding_page_1.dart';
import 'package:orizon/app/modules/onboarding/views/widgets/onboarding_page_2.dart';
import 'package:orizon/app/modules/onboarding/views/widgets/onboarding_page_3.dart';
import 'package:orizon/app/modules/onboarding/views/widgets/progress_widget.dart';
import 'package:orizon/app/routes/app_pages.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Obx(
          () => Stack(
            fit: StackFit.expand,
            children: [
              const BottomImage(),
              PageView(
                controller: controller.pageController,
                children: const [
                  OnboardingPageOne(),
                  OnboardingPageTwo(),
                  OnboardingPageThree()
                ],
              ),
              Positioned(
                top: 335.h,
                right: 0,
                left: 0,
                child: HorizontalPadding(
                  padding: 43,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Row(
                          children: List.generate(
                            3,
                            (index) => ProgressWidget(
                                isSelected: controller.pageIndex.value == index
                                    ? true
                                    : false),
                          ),
                        ),
                      ),
                      15.verticalSpace,

                      AnimatedCrossFade(
                          alignment: Alignment.center,
                          firstChild: const SizedBox(
                            width: 100,
                          ),
                          secondChild: FittedBox(
                            child: SizedBox(
                              width: 100,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        color: AppTheme.primary_color),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    )),
                                onPressed: () =>
                                    Get.offAllNamed(Routes.COUNTRY_SCREEN),
                                child: Text(
                                  'Join',
                                  style: AppTextStyle.s14.medium.black,
                                ),
                              ),
                            ),
                          ),
                          crossFadeState: controller.pageIndex.value == 2
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: const Duration(milliseconds: 300))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
