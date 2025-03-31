import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:orizon/app/core/utils/custom_package/loading_toast.dart';
import 'package:orizon/app/modules/otp_verification/repository/otp_verification_repo.dart';
import 'package:orizon/app/routes/app_pages.dart';

class OtpVerificationController extends GetxController {
  final OtpVerificationRepo _otpVerificationRepo = OtpVerificationRepo();
  TextEditingController otpController = TextEditingController();
  var isButtonEnable = false.obs;

  var pinValidator = "".obs;

  @override
  void onInit() {
    otpController.addListener(() {
      if (otpController.text.length <= 5) {
        pinValidator("");
      }
    });

    super.onInit();
  }

  void verifiyOtp(String value) async {
    LoadingToast.showLoading();
    Response response = await _otpVerificationRepo.verifiyOtp(value);
    LoadingToast.closeLoading();
    if (response.statusCode == 200) {
      pinValidator.value = "";
      Get.offAllNamed(Routes.ADD_PIN);
    } else {
      pinValidator("Pin is incorrect");
    }
  }

  void resendOtp() {
    _otpVerificationRepo.resendOtp();
  }
}
