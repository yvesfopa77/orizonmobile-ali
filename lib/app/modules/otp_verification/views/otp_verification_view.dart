import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/global_widgets/gradient_triangle.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/routes/app_pages.dart';
import 'package:pinput/pinput.dart';

import '../controllers/otp_verification_controller.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  const OtpVerificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientTriangle(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.verticalSpace,
              HorizontalPadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verification code',
                      style: AppTextStyle.s24.bold.black,
                    ),
                    16.verticalSpace,
                    RichText(
                      text: TextSpan(
                        style: AppTextStyle.s13.regular.grey,
                        text:
                            'We have to sent the code verification to your mobile number - ',
                        children: [
                          TextSpan(
                              style: AppTextStyle.s13.medium.black,
                              text: "Change Number"),
                        ],
                      ),
                    ),
                    40.verticalSpace,
                    SizedBox(
                      width: double.infinity,
                      child: Pinput(
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
                                  Get.toNamed(Routes.ADD_PIN);
                                }
                              : null,
                          child: const Text('Send Code')),
                    ),
                    30.verticalSpace,
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          style: AppTextStyle.s13.regular.grey,
                          text: "Didn't get code? ",
                          children: [
                            TextSpan(
                                style: AppTextStyle.s13.medium.black.copyWith(
                                    decoration: TextDecoration.underline),
                                text: "Send Again"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
