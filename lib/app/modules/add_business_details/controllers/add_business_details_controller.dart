// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:orizon/app/core/constants/app_constants.dart';

import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/utils/custom_package/phone_number_field/custom_form_builder_phone_field.dart';
import 'package:orizon/app/data/provider/location_client.dart';
import 'package:orizon/app/modules/add_business_details/views/widgets/delete_dialog.dart';
import 'package:orizon/app/routes/app_pages.dart';

class AddBusinessDetailsController extends GetxController {
  late GoogleMapController mapController;
  LatLng markerPosition = const LatLng(0, 0); // Default position
  Rxn<Marker?> currentMarker = Rxn(null);
  final formKey_businessDetail = GlobalKey<FormBuilderState>();
  final formKey_phoneNumber = GlobalKey<FormBuilderState>();
  late BusinessDataTravalModel businessDataTravalModel;

  Future<void> getCurrentLocation({bool onlyMoveCamera = false}) async {
    var position = await LocationClient.getUserCurrentLocation();

    if (position != null) {
      markerPosition = LatLng(position.latitude, position.longitude);
    }

    // Update the map and marker

    if (!onlyMoveCamera) {
      currentMarker.value = Marker(
      markerId: const MarkerId("current_location"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: markerPosition,
      onTap: () => markerPosition,
      infoWindow: const InfoWindow(title: "You are here"),
    );
    }

    // Move the map camera to the current location
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: markerPosition, zoom: 16.0),
    ));
  }

  var businessHours = [
    BusinessHourModel(
      day: "Sunday",
      isOpen: false,
      openTime: const TimeOfDay(hour: 10, minute: 0),
      closeTime: const TimeOfDay(hour: 16, minute: 0),
    ),
    BusinessHourModel(
      day: "Monday",
      isOpen: true,
      openTime: const TimeOfDay(hour: 9, minute: 0), // 9:00 AM
      closeTime: const TimeOfDay(hour: 17, minute: 0), // 5:00 PM
    ),
    BusinessHourModel(
      day: "Tuesday",
      isOpen: true,
      openTime: const TimeOfDay(hour: 9, minute: 0),
      closeTime: const TimeOfDay(hour: 17, minute: 0),
    ),
    BusinessHourModel(
      day: "Wednesday",
      isOpen: true,
      openTime: const TimeOfDay(hour: 9, minute: 0),
      closeTime: const TimeOfDay(hour: 17, minute: 0),
    ),
    BusinessHourModel(
      day: "Thursday",
      isOpen: true,
      openTime: const TimeOfDay(hour: 9, minute: 0),
      closeTime: const TimeOfDay(hour: 17, minute: 0),
    ),
    BusinessHourModel(
      day: "Friday",
      isOpen: true,
      openTime: const TimeOfDay(hour: 9, minute: 0),
      closeTime: const TimeOfDay(hour: 17, minute: 0),
    ),
    BusinessHourModel(
      day: "Saturday",
      isOpen: false,
      openTime: const TimeOfDay(hour: 10, minute: 0),
      closeTime: const TimeOfDay(hour: 16, minute: 0),
    ),
  ].obs;

  String formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final formattedTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);

    return DateFormat.jm().format(formattedTime);
  }

  void updateOpenTime(BuildContext context, BusinessHourModel day, int index) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: day.openTime,
    );
    businessHours[index].openTime = pickedTime ?? day.openTime;
    businessHours.refresh();
  }

  void updateCloseTime(BuildContext context, BusinessHourModel day, int index) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: day.closeTime,
    );
    businessHours[index].closeTime = pickedTime ?? day.closeTime;
    businessHours.refresh();
  }

  /// presentation logic for add business phone mumber
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  var fieldNames = <int>[].obs;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  void addField() {
    int missing = _findMissingNumbers();

    fieldNames.add(missing);

    listKey.currentState?.insertItem(missing);
  }

  int _findMissingNumbers() {
    if (fieldNames.isEmpty) return 0;

    int max = fieldNames.fold(fieldNames[0], math.max);
    for (int i = 0; i <= max; i++) {
      if (!fieldNames.contains(i)) {
        return i;
      }
    }
    return fieldNames.length;
  }

  void removeField(int index) {
    final int removedFieldName = fieldNames[index];

    listKey.currentState?.removeItem(
      index,
      (context, animation) => buildField(removedFieldName, index, animation),
    );

    fieldNames.removeAt(index); // Remove the field from the list.
  }

  Widget buildField(int fieldName, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Row(
        children: [
          Expanded(
            child: CustomFormBuilderPhoneField(
              name: fieldName.toString(),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                  hintText: 'enter number',
                  suffixIcon: IconButton(
                      onPressed: () => removeField(index),
                      icon: SvgPicture.asset(Images.close_field))),
              priorityListByIsoCode: const ['KE'],
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///presentation logic for adding photos;
  ///
  ///
  ///
  ///
  ///
  var images = <File>[].obs; // List to store selected images.
  final ImagePicker _picker = ImagePicker(); // Instance of ImagePicker.
  final GlobalKey<AnimatedGridState> gridKey = GlobalKey<AnimatedGridState>();
  // Function to pick an image from the gallery.
  Future<void> pickImage() async {
    if (images.length == 5) return;
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final newImage = File(pickedFile.path);
        images.add(newImage);
        gridKey.currentState
            ?.insertItem(images.length - 1, duration: const Duration(milliseconds: 300));
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  // Function to remove an image.
  void removeImage(int index) {
    final removedImage = images[index];

    gridKey.currentState?.removeItem(
      index,
      (context, animation) => buildImageItem(removedImage, index, animation, isRemoving: true),
      duration: const Duration(milliseconds: 300),
    );

    images.removeAt(index);
  }

  Widget buildImageItem(File image, int index, Animation<double> animation,
      {bool isRemoving = false}) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
          scale: animation,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              GestureDetector(
                onTap: () => Get.dialog(DeleteDialog(
                  onDelete: () => removeImage(index),
                )),
                child: UnconstrainedBox(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16,
                    child: SvgPicture.asset(
                      Images.delete_icon,
                      colorFilter: const ColorFilter.mode(AppTheme.primary_color, BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  bool validateBusinessDetailContinue() {
    if (formKey_businessDetail.currentState!.validate()) {
      businessDataTravalModel = BusinessDataTravalModel(
          businessName:
              formKey_businessDetail.currentState?.fields[AppConstants.business_name]?.value,
          businessDescription:
              formKey_businessDetail.currentState?.fields[AppConstants.business_description]?.value,
          businessHours: businessHours);

      return true;
    }
    return false;
  }

  addBusinessLocationContinue() {
    businessDataTravalModel = businessDataTravalModel.copyWith(
      businessLocation: markerPosition,
    );
  }

  bool addPhoneNummberContinue() {
    if (formKey_phoneNumber.currentState!.validate()) {
      List<String> phoneNumbersList = [];

      phoneNumbersList.add(formKey_phoneNumber.currentState!.fields["primary"]!.value);

      for (int values in fieldNames) {
        phoneNumbersList.add(formKey_phoneNumber.currentState!.fields[values.toString()]!.value);
      }
      businessDataTravalModel = businessDataTravalModel.copyWith(
        businessPhones: phoneNumbersList,
      );

      return true;
    }
    return false;
  }

  addPictureAndToNextScreen() {
    if (formKey_businessDetail.currentState!.validate()) {
      businessDataTravalModel = businessDataTravalModel.copyWith(
        businessPhotos: images,
      );
      Get.toNamed(Routes.BUSINESS_DETAILS_CONFIRM, arguments: businessDataTravalModel);
    }
  }

  void mapOnCameraMove(CameraPosition position) {}

  void onMapTapped(LatLng position) {
    currentMarker.value = Marker(
      markerId: const MarkerId("current_location"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: position,
      onTap: () => markerPosition,
      infoWindow: const InfoWindow(title: "You are here"),
    );
  }
}

class BusinessHourModel {
  final String day;
  bool isOpen;
  TimeOfDay openTime;
  TimeOfDay closeTime;

  BusinessHourModel({
    required this.day,
    required this.isOpen,
    required this.openTime,
    required this.closeTime,
  });
}

class BusinessDataTravalModel {
  final String? businessName;
  final String? businessDescription;
  final List<BusinessHourModel>? businessHours;
  final LatLng? businessLocation;
  final List<String>? businessPhones;
  final List<File>? businessPhotos;
  BusinessDataTravalModel({
    this.businessName,
    this.businessDescription,
    this.businessHours,
    this.businessLocation,
    this.businessPhones,
    this.businessPhotos,
  });

  BusinessDataTravalModel copyWith({
    String? businessName,
    String? businessDescription,
    List<BusinessHourModel>? businessHours,
    LatLng? businessLocation,
    List<String>? businessPhones,
    List<File>? businessPhotos,
  }) {
    return BusinessDataTravalModel(
      businessName: businessName ?? this.businessName,
      businessDescription: businessDescription ?? this.businessDescription,
      businessHours: businessHours ?? this.businessHours,
      businessLocation: businessLocation ?? this.businessLocation,
      businessPhones: businessPhones ?? this.businessPhones,
      businessPhotos: businessPhotos ?? this.businessPhotos,
    );
  }
}
