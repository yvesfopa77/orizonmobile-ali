import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart' hide Response;
import 'package:orizon/app/core/utils/custom_package/loading_toast.dart';
import 'package:orizon/app/core/utils/error_dialogs.dart';
import 'package:orizon/app/data/model/otp_error_model.dart';
import 'package:orizon/app/modules/phone_number/repository/phone_number_repo.dart';
import 'package:orizon/app/routes/app_pages.dart';

class PhoneNumberController extends GetxController {
  final PhoneNumberRepo _repo = PhoneNumberRepo();
  final formKey = GlobalKey<FormBuilderState>();
  final TextEditingController phoneController = TextEditingController();

  // ignore: non_constant_identifier_names
  final phone_field = 'phone_field';
  var isformValid = true.obs;
  var initialCountryCode = "+1";

  /// Asynchronously attempts to add a phone number by sending an OTP.
  ///
  /// Validates the form and retrieves the phone number from the form field.
  /// Sends the phone number to the repository to request an OTP.
  /// If the response status is 200, navigates to the OTP verification screen.
  /// Otherwise, logs an error message.

  void sendOtp() async {
    if (formKey.currentState!.validate()) {
      var phone = formKey.currentState!.fields[phone_field]!.value;

      LoadingToast.showLoading();
      Response response = await _repo.sendPhoneOtp(phone);
      LoadingToast.closeLoading();
      if (response.statusCode == 200) {
        Get.toNamed(Routes.OTP_VERIFICATION, arguments: phone);
      } else if (response.statusCode == 500) {
        var errorResponse = otpErrorModelFromJson(response.data);
        if (errorResponse.data.status == 429) {
          ErrorDialogs.tooManyRequest();
        } else {
          ErrorDialogs.internalServerError();
        }
      }
    }
  }
}
