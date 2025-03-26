import 'package:flutter/material.dart';
import 'package:orizon/app/core/utils/custom_package/country_map/src/helpers/map_attributes.dart';
import 'painter.dart';

class WorldMap extends StatefulWidget {
  final String instructions;

  final Color? defaultColor;

  final Map? colors;

  final SimpleMapMarker? originMarker;
  final SimpleMapMarker? residenceMarker;

  final BoxFit? fit;

  const WorldMap({
    required this.instructions,
    this.originMarker,
    this.residenceMarker,
    this.defaultColor,
    this.colors,
    this.fit,
    super.key,
  });

  @override
  State<WorldMap> createState() => _WorldMapState();
}

class _WorldMapState extends State<WorldMap> {
  @override
  Widget build(BuildContext context) {
    // Map map = jsonDecode(instructions);

    MapAttributes attributes = MapAttributes(widget.instructions);

    return FittedBox(
      fit: widget.fit ?? BoxFit.contain,
      child: SizedBox(
        width: attributes.mapWidth,
        height: attributes.mapHeight,
        child: Stack(clipBehavior: Clip.none, children: [
          RepaintBoundary(
              child: CustomPaint(
            isComplex: true,
            size: Size(attributes.mapWidth, attributes.mapHeight),
            painter: SimpleMapPainter(
                context: context,
                drawingInstructions: attributes.drawingInstructions,
                colors: widget.colors,
                defaultColor: widget.defaultColor ?? Colors.grey),
          )),
          if (widget.originMarker != null)
            Builder(
              builder: (context) {
                Size position = attributes
                    .latLngToPixelnewMethod(widget.originMarker!.latLong);

                return Positioned(
                    left: position.width -
                        (widget.originMarker!.markerSize.width / 2),
                    top: position.height -
                        (widget.originMarker!.markerSize.height),
                    child: SizedBox(
                      width: widget.originMarker!.markerSize.width,
                      height: widget.originMarker!.markerSize.height,
                      child: widget.originMarker!.marker,
                    ));
              },
            ),
          if (widget.residenceMarker != null)
            Builder(
              builder: (context) {
                Size position = attributes
                    .latLngToPixelnewMethod(widget.residenceMarker!.latLong);

                return Positioned(
                    left: position.width -
                        (widget.residenceMarker!.markerSize.width / 2),
                    top: position.height -
                        (widget.residenceMarker!.markerSize.height),
                    child: widget.residenceMarker!.marker);
              },
            )
        ]),
      ),
    );
  }
}

class SimpleMapMarker {
  final Size markerSize;
  final LatLong latLong;
  final Widget marker;

  const SimpleMapMarker({
    required this.markerSize,
    required this.latLong,
    required this.marker,
  });
}
