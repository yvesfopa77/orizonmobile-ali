import 'package:flutter/material.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'dart:math' as math;

class RotatedSign extends StatelessWidget {
  final bool isSelected;
  const RotatedSign({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Transform.rotate(
      angle: math.pi / 7,
      child: Container(
        margin: const EdgeInsets.only(left: 6, top: 6),
        height: isSelected ? 13 : 8,
        width: 3,
        decoration: BoxDecoration(
            color: isSelected ? AppTheme.yellow_color : Colors.white,
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
