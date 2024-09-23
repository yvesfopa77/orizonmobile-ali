import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orizon/app/routes/app_pages.dart';
import 'package:pinput/pinput.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/global_widgets/gradient_triangle.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/global_widgets/top_bar.dart';

import '../controllers/confirm_pin_controller.dart';

class ConfirmPinView extends GetView<ConfirmPinController> {
  const ConfirmPinView({super.key});
  @override
  Widget build(BuildContext context) {
    return GradientTriangle(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const TopBar(
          title: 'Confirm Pin',
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.verticalSpace,
            HorizontalPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Confirm Your Pin Code',
                    style: AppTextStyle.s24.bold.black,
                  ),
                  16.verticalSpace,
                  Text(
                    "Once, confirmed, you transaction will be complete.",
                    style: AppTextStyle.s13.regular.grey,
                  ),
                  40.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    child: Pinput(
                      length: 5,
                      controller: controller.otpController,
                      preFilledWidget: Text(
                        '0',
                        style: TextStyle(
                            color: const Color.fromRGBO(156, 164, 180, 1),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      defaultPinTheme: PinTheme(
                        textStyle: const TextStyle(
                            color: Color.fromRGBO(156, 164, 180, 1)),
                        height: 52.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppTheme.border_color,
                          ),
                          color: Colors.transparent,
                        ),
                      ),
                      submittedPinTheme: PinTheme(
                        height: 52.r,
                        textStyle: AppTextStyle.s14.semiBold.white,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  40.verticalSpace,
                  Obx(
                    () => ElevatedButton(
                        onPressed: controller.isButtonEnable.value
                            ? () {
                                Get.bottomSheet(
                                    SignatureSheet(
                                      controller: controller,
                                    ),
                                    isScrollControlled: true,
                                    isDismissible: false);
                              }
                            : null,
                        child: const Text('Confirm Pin')),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SignatureSheet extends StatelessWidget {
  final ConfirmPinController controller;
  const SignatureSheet({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(),
          height: 14,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.topCenter,
            fit: StackFit.expand,
            children: [
              CustomPaint(
                painter: SheetCurePaint(),
              ),
              Positioned(
                  top: 2,
                  child: Container(
                    height: 3,
                    width: 31.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white),
                  ))
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 11.w),
          decoration: BoxDecoration(
              color: AppTheme.apptheme.scaffoldBackgroundColor,
              border:
                  Border.all(color: AppTheme.apptheme.scaffoldBackgroundColor)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Signature",
                    style: AppTextStyle.s24.medium.black,
                  ),
                  GestureDetector(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset(Images.cross_icon))
                ],
              ),
              16.verticalSpace,
              Text(
                'Please sign in the area and confirm to account',
                style: AppTextStyle.s13.regular.grey,
              ),
              Text(
                'Term & Condition',
                style: AppTextStyle.s13.regular.black,
              ),
              10.verticalSpace,
              DottedBorder(
                padding: const EdgeInsets.all(2),
                borderType: BorderType.RRect,
                dashPattern: const [8, 4],
                color: AppTheme.border_color,
                radius: const Radius.circular(18),
                child: SizedBox(
                    height: 200.h,
                    child: SfSignaturePad(
                      key: controller.signaturePadKey,
                    )),
              ),
              20.verticalSpace,
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.SCAN_CARD);
                  },
                  child: const Text('Submit Signature')),
              20.verticalSpace,
              Center(
                  child: TextButton(
                      onPressed: () {
                        controller.signaturePadKey.currentState?.clear();
                      },
                      child: Text('Clear All',
                          style: AppTextStyle.s13.medium.grey)))
            ],
          ),
        )
      ],
    );
  }
}

class SheetCurePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.46, 10);
    path_0.cubicTo(
        size.width * 0.42, 10, size.width * 0.41, 0, size.width * 0.37, 0);
    path_0.lineTo(0, 0);

    path_0.lineTo(0, size.height);

    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width * 0.63, 0);
    path_0.cubicTo(
        size.width * 0.59, 0, size.width * 0.58, 10, size.width * 0.54, 10);

    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = AppTheme.apptheme.scaffoldBackgroundColor;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
