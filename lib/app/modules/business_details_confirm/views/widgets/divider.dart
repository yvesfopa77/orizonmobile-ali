import 'package:flutter/material.dart';
import 'package:orizon/app/core/theme/app_theme.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  const CustomDivider({
    super.key,
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: AppTheme.border_color,
      thickness: 1,
    );
  }
}
