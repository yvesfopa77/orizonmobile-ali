import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/routes/app_pages.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
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
              child: SizedBox.expand(
            child: Column(
              children: [
                30.verticalSpace,
                Container(
                  height: 72.r,
                  width: 72.r,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.1),
                      shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    Images.splash_omega,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
                AnimatedBuilder(
                  animation: controller.imageController,
                  builder: (context, child) => Opacity(
                    opacity: controller.imageController.value,
                    child: Transform.scale(
                      scale: controller.imageSize.value,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: AspectRatio(
                          aspectRatio: 1.09,
                          child: SvgPicture.asset(
                            Images.splash_fidget,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                40.verticalSpace,
                Text(
                  'From your everyday\nspending',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.s30.regular.white,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        left: 25.w,
                        top: -5,
                        child: AnimatedBuilder(
                          animation: controller.textLineController,
                          builder: (context, child) => Opacity(
                            opacity: controller.textLineController.value,
                            child: Transform.scale(
                              scale: controller.textLineSize.value,
                              child: SvgPicture.asset(
                                  Images.splash_text_background_line),
                            ),
                          ),
                        )),
                    Text(
                      'TO INVESTMENT',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.s30.extraBold.white,
                    ),
                  ],
                ),
                const Spacer(),
                HorizontalPadding(
                  child: ElevatedButton(
                      onPressed: () => Get.toNamed(Routes.ID_TYPE),
                      child: const Text("Lets's Get Started")),
                ),
                20.verticalSpace,
              ],
            ),
          ))
        ],
      ),
    );
  }
}
