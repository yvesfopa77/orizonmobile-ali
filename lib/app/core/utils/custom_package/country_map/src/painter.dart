import 'package:flutter/material.dart';
import 'package:orizon/app/core/utils/custom_package/country_map/src/helpers/map_instructions.dart';

/// This painter will paint a world map with all///
/// Giving countries a different color based on a data set can help visualize data.

class SimpleMapPainter extends CustomPainter {
  final List<Map<String, dynamic>> drawingInstructions;

  /// This Color is used for all the countries that have no custom color
  final Color defaultColor;
  final BuildContext context;

  /// The CountryColors is basically a list of Countries and Colors to give a Countrie a color of choice.
  final Map? colors;

  const SimpleMapPainter({
    required this.drawingInstructions,
    required this.defaultColor,
    this.colors,
    required this.context,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw background Path
    Path backgroundPath = Path();
    backgroundPath.moveTo(0, 0);
    backgroundPath.lineTo(size.width, 0);
    backgroundPath.lineTo(size.width, size.height);
    backgroundPath.lineTo(0, size.height);
    canvas.drawPath(
      backgroundPath,
      Paint()..color = Colors.transparent,
    );

    // Get country paths from Json
    // List countryPaths = json.decode(jsonData);
    List<SimpleMapInstruction> countryPathList = <SimpleMapInstruction>[];
    for (var path in drawingInstructions) {
      countryPathList.add(SimpleMapInstruction.fromJson(path));
    }

    // Draw paths
    for (int i = 0; i < countryPathList.length; i++) {
      List<String> paths = countryPathList[i].instructions;
      Path path = Path();

      // Read path instructions and start drawing
      for (int j = 0; j < paths.length; j++) {
        String instruction = paths[j];
        if (instruction == "c") {
          path.close();
        } else {
          List<String> coordinates = instruction.substring(1).split(',');
          double x = double.parse(coordinates[0]);
          double y = double.parse(coordinates[1]);

          if (instruction[0] == 'm') {
            path.moveTo(size.width * x, size.height * y);
          }
          if (instruction[0] == 'l') {
            path.lineTo(size.width * x, size.height * y);
          }
        }
      }

      // Draw country body
      String uniqueID = countryPathList[i].uniqueID;
      Paint paint = Paint()..color = colors?[uniqueID] ?? defaultColor;
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(SimpleMapPainter oldDelegate) =>
      oldDelegate.colors != colors;
}
