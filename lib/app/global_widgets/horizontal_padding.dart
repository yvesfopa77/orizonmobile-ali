import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalPadding extends StatelessWidget {
  final Widget child;
  final double? padding;
  const HorizontalPadding({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding?.w ?? 16.w),
      child: child,
    );
  }
}
