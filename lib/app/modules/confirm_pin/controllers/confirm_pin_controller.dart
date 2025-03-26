import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:orizon/app/data/model/onboarding_data_model.dart';
import 'package:orizon/app/routes/app_pages.dart';

class ConfirmPinController extends GetxController {

  TextEditingController otpController = TextEditingController();
  var isButtonEnable = false.obs;

  @override
  void onInit() {
    otpController.addListener(() {
      if (otpController.text.length == 5 && otpController.text == Get.arguments) {
        isButtonEnable(true);
      } else {
        isButtonEnable(false);
      }
    });
    super.onInit();
  }

  void confirmPinButton() {
    if (otpController.text == Get.arguments) {
      onboardingDataModel = onboardingDataModel.copyWith(pinccode: otpController.text);
      Get.toNamed(Routes.PERSONAL_DATA);
    } 
  }

  /// Converts the signature pad image to a Uint8List and sends it to the server.
  /// Throws an exception if the image cannot be converted to a Uint8List.
  /// Prints a message if the image is not sent (i.e. the response status code is not 200).
 
}
