// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class PhoneNumberController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();

  final phone_field = 'phone_field';
  var isformValid = false.obs;
}
