import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/global_widgets/custom_sheet.dart';

class ErrorDialogs {
  ErrorDialogs._();

  static void errorbottomSheet({String text = "Something went wrong"}) {
    Get.bottomSheet(
      CustomBottomSheet(
          body: SafeArea(
        child: Column(
          children: [
            SvgPicture.asset(Images.erorr_404),
            20.verticalSpace,
            Text(
              text,
              style: AppTextStyle.s20.bold.black,
            ),
            20.verticalSpace,
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
              style: AppTextStyle.s10.medium.grey,
            ),
            20.verticalSpace,
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Close"))
          ],
        ),
      )),
    );
  }

  static void internalServerError() {
    Get.bottomSheet(
      CustomBottomSheet(
          body: SafeArea(
        child: Column(
          children: [
            SvgPicture.asset(Images.internal_server_error),
            10.verticalSpace,
            10.verticalSpace,
            Text(
              "Internal Server error",
              style: AppTextStyle.s20.bold.black,
            ),
            10.verticalSpace,
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Close"))
          ],
        ),
      )),
    );
  }

  static void tooManyRequest() {
    Get.bottomSheet(
      CustomBottomSheet(
          body: SafeArea(
        child: Column(
          children: [
            SvgPicture.asset(Images.internal_server_error),
            10.verticalSpace,
            10.verticalSpace,
            Text(
              "Too many requests",
              style: AppTextStyle.s20.bold.black,
            ),
            10.verticalSpace,
            Text(
              "Please try after some time",
              style: AppTextStyle.s13.medium.grey,
            ),
            10.verticalSpace,
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Close"))
          ],
        ),
      )),
    );
  }

  static void otpErrorIcon() {
    Get.bottomSheet(
      CustomBottomSheet(
          body: SafeArea(
        child: Column(
          children: [
            SvgPicture.asset(Images.otp_error_icon),
            10.verticalSpace,
            Text(
              "Incorrect opt Code",
              style: AppTextStyle.s20.bold.black,
            ),
            10.verticalSpace,
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Close"))
          ],
        ),
      )),
    );
  }
}
