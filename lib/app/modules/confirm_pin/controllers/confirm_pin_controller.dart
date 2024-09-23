import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class ConfirmPinController extends GetxController {
  GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();

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
