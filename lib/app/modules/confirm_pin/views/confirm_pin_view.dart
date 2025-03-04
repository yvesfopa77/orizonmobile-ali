import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
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
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(5),
                      ],
                      controller: controller.otpController,
                      length: 5,
                      preFilledWidget: Text(
                        '0',
                        style: TextStyle(
                            color: const Color.fromRGBO(156, 164, 180, 1),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      validator: (value) =>
                          value == Get.arguments ? null : "Pin code is not matched",
                      defaultPinTheme: PinTheme(
                        textStyle: const TextStyle(color: Color.fromRGBO(156, 164, 180, 1)),
                        height: 52.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppTheme.border_color,
                          ),
                          color: Colors.transparent,
                        ),
                      ),
                      errorPinTheme: PinTheme(
                        height: 52.r,
                        textStyle: AppTextStyle.s14.semiBold.white,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
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
                        onPressed:
                            controller.isButtonEnable.value ? controller.confirmPinButton : null,
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
