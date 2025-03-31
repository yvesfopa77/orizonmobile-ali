// ignore_for_file: non_constant_identifier_names

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:orizon/app/core/constants/app_constants.dart';
import 'package:orizon/app/core/utils/custom_package/country_map/data/model/map/map_model.dart';
import 'package:orizon/app/data/model/onboarding_data_model.dart';
import 'package:orizon/app/data/provider/location_client.dart';
import 'package:orizon/app/routes/app_pages.dart';

class CountryScreenController extends GetxController {
  @override
  void onInit() {
    getUserCurrentLocation();
    super.onInit();
  }

  final formKey = GlobalKey<FormBuilderState>();

  var ischeckBoxEnable = false.obs;
  Rxn<Country>? SelectedResidencecountry = Rxn();
  Rxn<Country>? SelectedOrigincountry = Rxn();

  /// this code is only for map widget so does not touch it
  ///
  Rxn<CountryWithCenterPoint> originCountryPoint =
      Rxn<CountryWithCenterPoint>();
  Rxn<CountryWithCenterPoint> residentialCountrypoint =
      Rxn<CountryWithCenterPoint>();
  void _addMarkerResidential(String countryCode) {
    var matchedCountry = countryList
        .firstWhereOrNull((item) => item.name == countryCode.toUpperCase());
    if (matchedCountry != null) {
      residentialCountrypoint(matchedCountry);
    }
  }

  void _addMarkerOrigin(String countryCode) {
    var matchedCountry = countryList
        .firstWhereOrNull((item) => item.name == countryCode.toUpperCase());
    if (matchedCountry != null) {
      originCountryPoint(matchedCountry);
    }
  }

  void _removeMarkerResidential() {
    residentialCountrypoint.value = null;
    formKey.currentState?.fields[AppConstants.residentail_country_field]
        ?.reset();
  }

  void onResidentialCountryTap() {
    showCountryPicker(
      context: Get.context!,
      useSafeArea: true,
      countryFilter:
          countryList.map((item) => item.name.toUpperCase()).toList(),
      onSelect: (Country country) {
        SelectedResidencecountry?.value = country;
        formKey.currentState?.fields[AppConstants.residentail_country_field]
            ?.didChange(country.name);
        _addMarkerResidential(country.countryCode);
      },
    );
  }

  void onOriginCountryTap() {
    showCountryPicker(
      context: Get.context!,
      useSafeArea: true,
      countryFilter:
          countryList.map((item) => item.name.toUpperCase()).toList(),
      onSelect: (Country country) {
        SelectedOrigincountry?.value = country;
        formKey.currentState?.fields[AppConstants.origin_country_field]
            ?.didChange(country.name);
        _addMarkerOrigin(country.countryCode);
      },
    );
  }

  /// When check box is selected then reset the origin country field and remove the marker of origin country from map
  void checkBoxOnChanged(bool? value) {
    ischeckBoxEnable(value);
    if (value == true) {
      _removeMarkerResidential();
      SelectedResidencecountry?.value = SelectedOrigincountry?.value;
    } else {
      SelectedResidencecountry?.value = null;
    }
  }

  void ConfirmationButton() {
    var formState = formKey.currentState!;
    if (ischeckBoxEnable.isTrue) {
      if (formState.fields[AppConstants.origin_country_field]!.validate()) {
        onboardingDataModel = onboardingDataModel.copyWith(
          countryofbirth:
              formState.fields[AppConstants.origin_country_field]!.value,
          countryofresidence:
              formState.fields[AppConstants.origin_country_field]!.value,
          residentialCountry: SelectedOrigincountry?.value,
        );
        Get.toNamed(Routes.PHONE_NUMBER);
      }
    } else {
      if (formState.validate()) {
        onboardingDataModel = onboardingDataModel.copyWith(
            countryofbirth:
                formState.fields[AppConstants.origin_country_field]!.value,
            countryofresidence:
                formState.fields[AppConstants.residentail_country_field]!.value,
            residentialCountry: SelectedResidencecountry?.value
        );
        Get.toNamed(Routes.PHONE_NUMBER);
      }
    }
  }

  void getUserCurrentLocation() async {
    final CountryService countryService = CountryService();
    var country = await LocationClient.countryFromUserLocation();
    if (country != null) {
      formKey.currentState?.fields[AppConstants.residentail_country_field]
          ?.didChange(country.name);

      Country? selectedCountry = countryService.findByCode(country.iso);
      SelectedResidencecountry?.value = selectedCountry;
      _addMarkerResidential(country.iso!);
    }
  }
}
