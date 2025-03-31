import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/modules/add_business_details/controllers/add_business_details_controller.dart';

class TimeBox extends StatelessWidget {
  const TimeBox({
    super.key,
    required this.controller,
    required this.time,
  });

  final AddBusinessDetailsController controller;
  final TimeOfDay time;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.border_color),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            controller.formatTime(time),
            style: AppTextStyle.s10.regular.grey,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatedBox(
                  quarterTurns: 1,
                  child: SvgPicture.asset(
                    Images.arrow_left_icon,
                    colorFilter: const ColorFilter.mode(AppTheme.grey_color, BlendMode.srcIn),
                    height: 10,
                  )),
              2.verticalSpace,
              RotatedBox(
                  quarterTurns: 3,
                  child: SvgPicture.asset(
                    Images.arrow_left_icon,
                    colorFilter: const ColorFilter.mode(AppTheme.grey_color, BlendMode.srcIn),
                    height: 10,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
