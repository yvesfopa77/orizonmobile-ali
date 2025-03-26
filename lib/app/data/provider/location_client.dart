// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:orizon/app/core/utils/error_dialogs.dart';

class LocationClient {
  LocationClient._();

  static final LocationClient _instance = LocationClient._();

  factory LocationClient() {
    return _instance;
  }

  static Future<Position?> getUserCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return null;
      }
    }

    // Get the current location
    try {
      final position = await Geolocator.getCurrentPosition();
      return position;
    } on Exception {
      return null;
    }
  }

  static Future<LocationAddress> getAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String address =
            "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";

        return LocationAddress(
          placemark: place,
          address: address,
        );
      } else {
        ErrorDialogs.errorbottomSheet(text: "No address found for the location");
      }
    } catch (e) {
      return LocationAddress();
    }
    return LocationAddress();
  }
}

class LocationAddress {
  final Placemark? placemark;
  final String? address;
  LocationAddress({
    this.placemark,
    this.address,
  });
}
