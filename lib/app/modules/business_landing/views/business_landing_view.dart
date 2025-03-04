import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/global_widgets/gradient_triangle.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/routes/app_pages.dart';

import '../controllers/business_landing_controller.dart';

class BusinessLandingView extends GetView<BusinessLandingController> {
  const BusinessLandingView({super.key});
  @override
  Widget build(BuildContext context) {
    return GradientTriangle(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: HorizontalPadding(
            child: SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60.r,
                    height: 60.r,
                    padding: EdgeInsets.all(12.r),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.primary_color,
                    ),
                    child: SvgPicture.asset(Images.logo),
                  ),
                  20.verticalSpace,
                  Text(
                    "Running your own business ?",
                    style: AppTextStyle.s30.semiBold.black,
                    textAlign: TextAlign.center,
                  ),
                  20.verticalSpace,
                  Text(
                    "Add your business details to reach millions of customers",
                    style: AppTextStyle.s14.medium.grey,
                    textAlign: TextAlign.center,
                  ),
                  50.verticalSpace,
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.ADD_BUSINESS_DETAILS);
                      },
                      child: const Text('Add your business details now')),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Skip',
                      style: AppTextStyle.s14.medium.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
