import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orizon/app/core/constants/google_map_style.dart';
import 'package:orizon/app/global_widgets/custom_sheet.dart';
import 'package:orizon/app/modules/add_business_details/controllers/add_business_details_controller.dart';
import 'package:orizon/app/modules/add_business_details/views/widgets/phone_number_sheet.dart';

class LocationSheet extends GetView<AddBusinessDetailsController> {
  const LocationSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => SizedBox(
            height: 300.h,
            child: Stack(
              children: [
                GoogleMap(
                  myLocationEnabled: true,
                  style: GoogleMapStyle.style,
                  myLocationButtonEnabled: false,
                  onCameraMove: controller.mapOnCameraMove,
                  markers: controller.currentMarker.value != null
                      ? {controller.currentMarker.value!}
                      : {},
                  onTap: controller.onMapTapped,
                  initialCameraPosition: CameraPosition(
                    target: controller.markerPosition, // Initial position (will be updated)
                    zoom: 12.0,
                  ),
                  onMapCreated: (GoogleMapController controller1) {
                    controller.mapController = controller1;

                    controller.getCurrentLocation();
                  },
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: FloatingActionButton.small(
                      backgroundColor: Colors.white,
                      child: const Icon(
                        Icons.my_location_rounded,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        controller.getCurrentLocation(onlyMoveCamera: true);
                      },
                    ))
              ],
            ),
          ),
        ),
        20.verticalSpace,
        ElevatedButton(
            onPressed: () {
              controller.addBusinessLocationContinue();
              Get.bottomSheet(
                  const CustomBottomSheet(
                    title: "Business Phone Number",
                    body: PhoneNumberSheet(),
                  ),
                  isScrollControlled: false,
                  enableDrag: false,
                  isDismissible: false,
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
            },
            child: const Text('Continue')),
        40.verticalSpace,
      ],
    );
  }
}
