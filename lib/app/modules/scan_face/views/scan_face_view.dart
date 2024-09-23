import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/global_widgets/top_bar.dart';
import 'package:orizon/app/routes/app_pages.dart';

import '../controllers/scan_face_controller.dart';

class ScanFaceView extends GetView<ScanFaceController> {
  const ScanFaceView({super.key});
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
            const BlackMaskWithOvalShape(),
            const OvalBorder(),
            //  WaveAnimaitonOnOvalShape(alignmentTween: controller.alignmentTween),
            Column(
              children: [
                5.verticalSpace,
                TopBar(
                    foregroundColor: Colors.white,
                    title: "Scan Face",
                    trailing: TopBarTrailingButton(
                      onTap: () => Get.offAllNamed(Routes.HOME),
                      child: Row(
                        children: [
                          Text("2", style: AppTextStyle.s16.extraBold.white),
                          Text("/2", style: AppTextStyle.s16.regular.white),
                        ],
                      ),
                    )),
                const Spacer(),
                Text("100%",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.s30.medium.white),
                Text("Verifying Your Face...",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.s14.regular.white),
                40.verticalSpace,
                HorizontalPadding(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(left: 20, right: 6)),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'How my dara are protected?',
                            style: AppTextStyle.s13.medium.white,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.5),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Icon(Icons.arrow_forward_rounded),
                          )
                        ],
                      )),
                ),
                40.verticalSpace,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WaveAnimaitonOnOvalShape extends StatelessWidget {
  const WaveAnimaitonOnOvalShape({
    super.key,
    required Animation<Alignment> alignmentTween,
  }) : _alignmentTween = alignmentTween;

  final Animation<Alignment> _alignmentTween;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            100.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 310.h, minHeight: 250.h),
                child: AspectRatio(
                  aspectRatio: .8,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.elliptical(800, 1000)),
                        border: Border.all(
                            color: const Color(0xFFFDD400), width: 2)),
                    child: AnimatedBuilder(
                      animation: _alignmentTween,
                      builder: (context, child) => Stack(
                        alignment: _alignmentTween.value,
                        children: [
                          Container(
                            height: 8,
                            clipBehavior: Clip.hardEdge,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.yellow.shade400.withOpacity(.01),
                                  Colors.yellow.shade400,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlackMaskWithOvalShape extends StatelessWidget {
  const BlackMaskWithOvalShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(0.5),
        BlendMode.srcOut,
      ), // This one will create the magic
      child: Stack(
        //  fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              backgroundBlendMode: BlendMode.dstOut,
            ), // This one  will handle background + difference out
          ),
          SizedBox.expand(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                150.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(maxHeight: 310.h, minHeight: 250.h),
                    child: AspectRatio(
                      aspectRatio: .8,
                      child: ClipOval(
                        child: Container(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OvalBorder extends StatelessWidget {
  const OvalBorder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      //  fit: StackFit.expand,
      children: [
        SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              150.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(maxHeight: 310.h, minHeight: 250.h),
                  child: AspectRatio(
                    aspectRatio: .8,
                    child: ClipOval(
                      child: Container(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(
                            eccentricity: 1,
                            side: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
