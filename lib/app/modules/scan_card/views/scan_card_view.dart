import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/global_widgets/top_bar.dart';
import 'package:orizon/app/routes/app_pages.dart';

import '../controllers/scan_card_controller.dart';

class ScanCardView extends GetView<ScanCardController> {
  const ScanCardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(
        () => Stack(
          fit: StackFit.expand,
          children: [
            controller.isCamerainit.value
                ? CameraPreview(controller.cameraController)
                : const SizedBox(),
            const BlackMashWithCardHole(),
            WaveAnimationOnCardHole(alignmentTween: controller.alignmentTween),
            const SideCorderAroundCard(),
            Column(
              children: [
                5.verticalSpace,
                TopBar(
                    foregroundColor: Colors.white,
                    title: "Scan Card",
                    trailing: TopBarTrailingButton(
                      onTap: () {
                        Get.toNamed(Routes.SCAN_FACE);
                      },
                      child: Row(
                        children: [
                          Text("1", style: AppTextStyle.s16.extraBold.white),
                          Text("/2", style: AppTextStyle.s16.regular.white),
                        ],
                      ),
                    )),
                Text("Place your front side of your card\n on the blue box",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.s13.medium.white),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (controller.sliderValue.value > 1.5) {
                            controller.sliderValue.value -= .5;
                            controller.cameraController
                                .setZoomLevel(controller.sliderValue.value);
                          }
                        },
                        icon: const Icon(Icons.remove),
                        color: Colors.white,
                      ),
                      Expanded(
                        child: Slider(
                          min: 1,
                          value: controller.sliderValue.value,
                          max: controller.maxZoomLevel.value,
                          onChanged: (value) {
                            controller.cameraController.setZoomLevel(value);

                            controller.sliderValue(value);
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (controller.sliderValue.value <=
                              controller.maxZoomLevel.value - .5) {
                            controller.sliderValue.value += .5;
                            controller.cameraController
                                .setZoomLevel(controller.sliderValue.value);
                          }
                        },
                        icon: const Icon(Icons.add),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                40.verticalSpace,
                HorizontalPadding(
                  child: AnimatedToggleSwitch<int>.size(
                      current: controller.toggleSwitchIndex.value,
                      height: 50.h,
                      foregroundIndicatorIconBuilder: (context, global) => Text(
                            global.currentIndex == 0 ? 'Recto' : "Verso",
                            style: AppTextStyle.s13.bold.white,
                          ),
                      values: const [0, 1],
                      iconList: [
                        Text("Recto", style: AppTextStyle.s13.bold.black),
                        Text("Verso", style: AppTextStyle.s13.bold.black)
                      ],
                      iconOpacity: 1,
                      selectedIconScale: 1,
                      indicatorSize: Size.fromWidth(Get.width),
                      borderWidth: 2.0,
                      iconAnimationType: AnimationType.onHover,
                      styleList: [
                        ToggleStyle(
                            borderColor: Colors.white,
                            indicatorColor: AppTheme.black_color,
                            indicatorBorderRadius:
                                const BorderRadius.horizontal(
                                    left: Radius.circular(20)),
                            borderRadius: BorderRadius.circular(20)),
                        ToggleStyle(
                            borderColor: Colors.white,
                            indicatorColor: AppTheme.black_color,
                            indicatorBorderRadius:
                                const BorderRadius.horizontal(
                                    right: Radius.circular(20)),
                            borderRadius: BorderRadius.circular(20)),
                      ],
                      onChanged: (i) {
                        controller.toggleSwitchIndex(i);
                      }),
                ),
                10.verticalSpace,
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Cancel Scanning',
                      style: AppTextStyle.s13.medium.white,
                    )),
                40.verticalSpace,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BlackMashWithCardHole extends StatelessWidget {
  final double opacityvalue;
  const BlackMashWithCardHole([
    this.opacityvalue = .5,
    Key? key,
  ]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(opacityvalue),
        BlendMode.srcOut,
      ), // This one will create the magic
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              backgroundBlendMode: BlendMode.dstOut,
            ), // This one  will handle background + difference out
          ),
          Align(
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500, minWidth: 200),
              child: AspectRatio(
                aspectRatio: 2,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SideCorderAroundCard extends StatelessWidget {
  const SideCorderAroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500, minWidth: 200),
        child: AspectRatio(
          aspectRatio: 2,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -10,
                left: 30,
                child: SvgPicture.asset(
                  Images.curve_icon,
                  width: 40.r,
                  height: 40.r,
                ),
              ),
              Positioned(
                top: -10,
                right: 30,
                child: Transform.flip(
                  flipX: true,
                  child: SvgPicture.asset(
                    Images.curve_icon,
                    width: 40.r,
                    height: 40.r,
                  ),
                ),
              ),
              Positioned(
                bottom: -10,
                right: 30,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: SvgPicture.asset(
                    Images.curve_icon,
                    width: 40.r,
                    height: 40.r,
                  ),
                ),
              ),
              Positioned(
                bottom: -10,
                left: 30,
                child: Transform.flip(
                  flipX: true,
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset(
                      Images.curve_icon,
                      width: 40.r,
                      height: 40.r,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WaveAnimationOnCardHole extends StatelessWidget {
  const WaveAnimationOnCardHole({
    super.key,
    required Animation<Alignment> alignmentTween,
  }) : _alignmentTween = alignmentTween;

  final Animation<Alignment> _alignmentTween;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _alignmentTween,
      builder: (context, child) => Align(
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500, minWidth: 200),
          child: AspectRatio(
            aspectRatio: 2.2,
            child: Container(
              // clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(20),
              // ),
              child: Stack(
                alignment: _alignmentTween.value,
                children: [
                  Container(
                    height: 2,
                    color: Colors.white,
                    width: double.infinity,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
