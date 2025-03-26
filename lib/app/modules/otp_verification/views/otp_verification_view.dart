import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/global_widgets/gradient_triangle.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/global_widgets/top_bar.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:pinput/pinput.dart';

import '../controllers/otp_verification_controller.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  const OtpVerificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(
        title: "Verification",
       
      ),
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
                    Text(
                      'Enter 6 digits code we have sent you on ',
                        style: AppTextStyle.s13.regular.grey,
                    ),
                    Text(
                      Get.arguments,
                      style: AppTextStyle.s13.medium.black,
                    ),
                    40.verticalSpace,
                    SizedBox(
                      width: double.infinity,
                      child: Obx(
                        () => Pinput(
                          controller: controller.otpController,
                          length: 6,
                          forceErrorState: controller.pinValidator.value.isNotEmpty ? true : false,
                          pinputAutovalidateMode: PinputAutovalidateMode.disabled,
                          onCompleted: controller.verifiyOtp,
                          errorText: controller.pinValidator.value.isNotEmpty
                              ? controller.pinValidator.value
                              : null,
                          preFilledWidget: Text(
                            '0',
                            style: TextStyle(
                                color: const Color.fromRGBO(156, 164, 180, 1),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    ),
                    30.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't get code?",
                          style: AppTextStyle.s13.regular.grey,
                        ),
                        OtpTimerButton(
                            onPressed: controller.resendOtp,
                            buttonType: ButtonType.text_button,
                            text: Text(
                              "Send Again",
                              style: AppTextStyle.s13.medium.black,
                            ),
                            duration: 60)
                      ],
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
