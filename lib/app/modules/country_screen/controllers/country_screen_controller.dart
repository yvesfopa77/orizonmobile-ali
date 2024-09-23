// ignore_for_file: non_constant_identifier_names

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class CountryScreenController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  var ischeckBoxEnable = false.obs;
  Rxn<Country>? Selectedcountry = Rxn();

  ///form fields
  final residentialCountry_field = 'residentialCountry';
  final origincountry_field = 'originCountry';
}
