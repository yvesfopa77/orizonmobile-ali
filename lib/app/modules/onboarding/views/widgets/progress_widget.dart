import 'package:flutter/material.dart';
import 'package:orizon/app/core/theme/app_theme.dart';

class ProgressWidget extends StatelessWidget {
  final bool isSelected;
  const ProgressWidget({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
        margin: const EdgeInsets.only(right: 12),
        height: 9,
        width: 9,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? AppTheme.primary_color : Colors.grey));
  }
}
