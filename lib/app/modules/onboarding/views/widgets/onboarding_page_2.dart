import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';

class OnboardingPageTwo extends StatelessWidget {
  const OnboardingPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalPadding(
      padding: 43,
      child: Column(
        children: [
          100.verticalSpace,
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "02", style: AppTextStyle.s30.semiBold.green),
                TextSpan(
                    text: " Lorem ipsum dolor sit amet, consectetur",
                    style: AppTextStyle.s30.semiBold.black),
              ],
            ),
          ),
          30.verticalSpace,
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.",
            style: AppTextStyle.s14.medium.grey,
          ),
        ],
      ),
    );
  }
}
