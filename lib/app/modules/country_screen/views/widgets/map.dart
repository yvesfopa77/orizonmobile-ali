import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/utils/custom_package/country_map/data/maps/world_map.dart';
import 'package:orizon/app/core/utils/custom_package/country_map/src/helpers/map_attributes.dart';
import 'package:orizon/app/core/utils/custom_package/country_map/src/map.dart';
import 'package:orizon/app/modules/country_screen/controllers/country_screen_controller.dart';

class MapWidget extends GetView<CountryScreenController> {
  const MapWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WorldMap(
        instructions: SMapWorld.instructions,
        defaultColor: const Color.fromRGBO(208, 214, 226, 1),
        originMarker: controller.originCountryPoint.value == null
            ? null
            : SimpleMapMarker(
                markerSize: const Size(350, 320),
                latLong: LatLong(
                    latitude: controller.originCountryPoint.value!.latitude,
                    longitude: controller.originCountryPoint.value!.longitude),
                marker: CountryMarker(
                    countryCode:
                        controller.SelectedOrigincountry!.value!.countryCode,
                    name: "Origin")),
        residenceMarker: controller.residentialCountrypoint.value == null
            ? null
            : SimpleMapMarker(
                markerSize: const Size(470, 320),
                latLong: LatLong(
                    latitude:
                        controller.residentialCountrypoint.value!.latitude,
                    longitude:
                        controller.residentialCountrypoint.value!.longitude),
                marker: CountryMarker(
                  countryCode:
                      controller.SelectedResidencecountry!.value!.countryCode,
                  name: "Residence",
                )),
        colors: {
          if (controller.originCountryPoint.value != null)
            controller.originCountryPoint.value!.name.toLowerCase():
                AppTheme.primary_color,
          if (controller.residentialCountrypoint.value != null)
            controller.residentialCountrypoint.value!.name.toLowerCase():
                AppTheme.primary_color
        },
      ),
    );
  }
}

class CountryMarker extends StatelessWidget {
  const CountryMarker({
    super.key,
    required this.countryCode,
    required this.name,
  });

  final String countryCode;

  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CountryFlag.fromCountryCode(
                  countryCode,
                  shape: const Circle(),
                ),
              ),
              20.horizontalSpace,
              Text(
                name,
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        CustomPaint(
          size: const Size(70, 30),
          painter: TrianglePainter(),
        ),
        20.verticalSpace,
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 4, color: Colors.black),
          ),
          alignment: Alignment.center,
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..lineTo(x / 2, y)
      ..lineTo(x, 0)
      ..lineTo(0, 0);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return true;
  }
}
