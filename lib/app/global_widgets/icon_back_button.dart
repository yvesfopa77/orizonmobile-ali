// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';

class IconBackButton extends StatelessWidget {
  final Color foregroundColor;
  const IconBackButton({
    super.key,
    this.foregroundColor = AppTheme.black_color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        width: 50.r,
        height: 50.r,
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: foregroundColor)),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          Images.arrow_left_icon,
          width: 24.r,
          height: 24.r,
          colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}
