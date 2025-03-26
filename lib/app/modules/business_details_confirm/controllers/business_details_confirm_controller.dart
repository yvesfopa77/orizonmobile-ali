import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orizon/app/data/provider/location_client.dart';
import 'package:orizon/app/modules/add_business_details/controllers/add_business_details_controller.dart';

class BusinessDetailsConfirmController extends GetxController {
  late BusinessDataTravalModel businessDataTravalModel;
  final PageController pageController = PageController();
  var pageActiveIndex = 0.obs;
  var locationAddress = "".obs;
  Marker? currentMarker;

  @override
  void onInit() {
    businessDataTravalModel = Get.arguments;
    _getAddressFromLatLng();
    _setMarker();
    pageListner();
    super.onInit();
  }

  void pageListner() {
    pageController.addListener(() {
      pageActiveIndex((pageController.page ?? 0).round());
    });
  }

  Future<void> _getAddressFromLatLng() async {
    LocationAddress? address = await LocationClient.getAddressFromLatLng(
      LatLng(businessDataTravalModel.businessLocation!.latitude,
          businessDataTravalModel.businessLocation!.longitude),
    );
    if (address.address != null) {
      locationAddress(address.address);
    }
  }

  Future<void> _setMarker() async {
    currentMarker = Marker(
      markerId: const MarkerId("current_location"),
      position: businessDataTravalModel.businessLocation!,
      infoWindow: const InfoWindow(title: "You are here"),
    );

    // Move the map camera to the current location
  }
}
