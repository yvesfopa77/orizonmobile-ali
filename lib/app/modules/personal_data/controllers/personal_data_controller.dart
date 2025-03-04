// ignore_for_file: non_constant_identifier_names

import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart' hide Response;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:orizon/app/core/constants/app_constants.dart';
import 'package:orizon/app/core/utils/custom_package/loading_toast.dart';
import 'package:orizon/app/core/utils/error_dialogs.dart';
import 'package:orizon/app/data/model/onboarding_data_model.dart';
import 'package:orizon/app/data/model/places_api_model.dart';
import 'package:orizon/app/data/provider/location_client.dart';
import 'package:orizon/app/modules/personal_data/repository/personal_data_repo.dart';
import 'package:orizon/app/modules/personal_data/views/personal_data_view.dart';
import 'package:orizon/app/routes/app_pages.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class PersonalDataController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();
  final PersonalDataRepo _repo = PersonalDataRepo();
  var citiesTypeAheadList = <String>[].obs;

  /// Converts the signature pad image to a Uint8List and sends it to the server.
  /// Throws an exception if the image cannot be converted to a Uint8List.
  /// Prints a message if the image is not sent (i.e. the response status code is not 200).
  void submitSignature() async {
    LoadingToast.showLoading();
    ui.Image image = await signaturePadKey.currentState!.toImage();
    final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) {
      throw Exception("Unable to convert image to byte data.");
    } else {
      final Uint8List imageData = byteData.buffer.asUint8List();
      Response response = await _repo.saveSignature(imageData);
      LoadingToast.closeLoading();
      if (response.statusCode == 200) {
        Get.offAllNamed(Routes.PROFILE_INTRO);
      } else {
        ErrorDialogs.errorbottomSheet();
      }
    }
  }

  void doneButton() async {
    var formState = formKey.currentState!;
    if (formState.validate()) {
      onboardingDataModel = onboardingDataModel.copyWith(
        firstname: formState.fields[AppConstants.first_name_field]!.value,
        lastname: formState.fields[AppConstants.last_name_field]!.value,
        gender: formState.fields[AppConstants.gender_field]!.value,
        birthdate:
            DateFormat('yyyy-MM-dd').format(formState.fields[AppConstants.birth_date_field]!.value),
        city: formState.fields[AppConstants.city_field]!.value,
        streetaddress: formState.fields[AppConstants.address_field]!.value,
      );
      LoadingToast.showLoading();
      var response = await _repo.userOnboarding();
      LoadingToast.closeLoading();
      if (response.statusCode == 200) {
        Get.bottomSheet(const SignatureView(),
            isScrollControlled: false, enableDrag: false, isDismissible: false);
      } else {
        ErrorDialogs.errorbottomSheet();
      }
    }
  }

  Future<List<String>?> fetchCitySuggestions(String query) async {
    try {
      final response = await _repo.getCitySuggestions(query);

      if (response.statusCode == 200 && response.data != null) {
        final placesApiModel = placesApiModelFromJson(response.data);
        if (placesApiModel.suggestions != null) {
          final mainTextList = placesApiModel.suggestions!
              .map((suggestion) =>
                  suggestion.placePrediction?.structuredFormat?.mainText?.text ?? "")
              .where((text) => text.isNotEmpty)
              .toList();
          return mainTextList;
        }
      }
    } catch (e) {
      return [];
    }
    return [];
  }

  ///typeahead funt
  Future<List<String>?> TypeAheadSeggestionCallback(pattern) async {
    if (pattern.isEmpty) return [];
    return fetchCitySuggestions(pattern);
  }

  void typeAheadOnSelect(String city) {
    formKey.currentState!.fields[AppConstants.city_field]!.didChange(city);
  }

  void populateAddressFromLocation() async {
    var currentLocation = await LocationClient.getUserCurrentLocation();

    if (currentLocation != null) {
      LocationAddress? address = await LocationClient.getAddressFromLatLng(
        LatLng(currentLocation.latitude, currentLocation.longitude),
      );
      if (address.address != null) {
        formKey.currentState!.fields[AppConstants.address_field]!.didChange(address.address);
      }
      if (address.placemark != null && address.placemark!.locality!.isNotEmpty) {
        formKey.currentState!.fields[AppConstants.city_field]!
            .didChange(address.placemark!.locality);
      }
    } else {
      ErrorDialogs.errorbottomSheet(text: "unable to get location");
    }
  }
}
