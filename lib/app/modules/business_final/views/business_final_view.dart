import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/global_widgets/gradient_triangle.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/routes/app_pages.dart';

import '../controllers/business_final_controller.dart';

class BusinessFinalView extends GetView<BusinessFinalController> {
  const BusinessFinalView({super.key});
  @override
  Widget build(BuildContext context) {
    return GradientTriangle(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: HorizontalPadding(
            child: SingleChildScrollView(
              child: GestureDetector(
                onTap: () => Get.toNamed(Routes.LOGIN),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,
                    Text(
                      ' All Set!',
                      style: AppTextStyle.s16.bold.black,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "ORIZON’s", style: AppTextStyle.s24.bold.green),
                          TextSpan(
                              text: " team is now processing your onboarding",
                              style: AppTextStyle.s24.bold.black),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    Text(
                      'Once your account will be validated, you will join ORIZON community and start building your dreams !',
                      style: AppTextStyle.s14.medium.grey,
                    ),
                    20.verticalSpace,
                    const CustomCard(
                      title: "Revenues Opportunities",
                      subtitle:
                          "Reach millions of potential customers, partners, investors, here and worldwide, propose your services or sell your products.",
                    ),
                    const CustomCard(
                        title: "Any brilliant idea? Looking for funding ?",
                        subtitle:
                            "Publish your project with help of ORIZON expert team and raise funding worldwide."),
                    const CustomCard(
                        title: "ORIZON bank account",
                        subtitle:
                            "Pay, get paid, access loans, receive funds from anywhere at the lowest fees with the best security"),
                    20.verticalSpace,
                    Text(
                      "Follow us on",
                      style: AppTextStyle.s18.medium.black,
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        SvgPicture.asset(Images.instagram_icon),
                        10.horizontalSpace,
                        SvgPicture.asset(Images.facebook_icon),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.s18.medium.black,
          ),
          5.verticalSpace,
          Text(
            subtitle,
            style: AppTextStyle.s14.medium.grey,
          ),
        ],
      ),
    );
  }
}
