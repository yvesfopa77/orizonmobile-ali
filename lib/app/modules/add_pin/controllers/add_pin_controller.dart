import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPinController extends GetxController {
  TextEditingController otpController = TextEditingController();
  var isButtonEnable = false.obs;

  @override
  void onInit() {
    otpController.addListener(() {
      if (otpController.text.length == 5) {
        isButtonEnable(true);
      } else {
        isButtonEnable(false);
      }
    });
    super.onInit();
  }
}
