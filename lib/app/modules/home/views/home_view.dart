import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/global_widgets/gradient_triangle.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/global_widgets/top_bar.dart';
import 'package:orizon/app/modules/home/views/card_inner_design.dart';
import 'package:orizon/app/modules/home/widgets/bottom_navigation_bar.dart';
import 'package:orizon/app/modules/profile_settings/views/profile_settings_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GradientTriangle(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigation(
          currentIndex: controller.bottombarCurrentIndex,
          onTap: (index) {
            controller.bottombarCurrentIndex.call(index);
            controller.pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear);
          },
        ),
        backgroundColor: Colors.transparent,
        body: PageView(
          controller: controller.pageController,
          children: const [
            HomePage(),
            SizedBox(),
            ProfileSettingsView(),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(
            leading: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: const CircleAvatar(
                radius: 25,
              ),
            ),
            trailing: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: CircleAvatar(
                  radius: 25,
                  child: SvgPicture.asset(Images.setting_icon),
                )),
          ),
          30.verticalSpace,
          HorizontalPadding(
            child: Container(
              height: 185.h,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const CardInnerDesign(),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 20.w,
                    bottom: 20.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Balance',
                              style: AppTextStyle.s12.semiBold.white,
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: (() {}),
                              icon: const Icon(Icons.more_vert),
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '597',
                              style: AppTextStyle.s34.bold.white
                                  .copyWith(letterSpacing: -2),
                            ),
                            Text('.84',
                                style: AppTextStyle.s34.bold.white.copyWith(
                                    color: Colors.white.withOpacity(.5),
                                    letterSpacing: -2)),
                            Text('\$',
                                style:
                                    AppTextStyle.s24.extraBold.white.copyWith(
                                  color: Colors.white.withOpacity(.5),
                                )),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    color: AppTheme.white_color,
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                    Images.home_card_business_icon)),
                            10.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '** 4322',
                                  style: AppTextStyle.s11.medium.white,
                                ),
                                Text(
                                  'Current Account',
                                  style: AppTextStyle.s11.medium.white,
                                )
                              ],
                            ),
                            const Spacer(),
                            Container(
                              margin: EdgeInsets.only(right: 10.w),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: AppTheme.white_color,
                                  borderRadius: BorderRadius.circular(40)),
                              child: Text(
                                '+ add Credit / Debit card',
                                style: AppTextStyle.s8.semiBold.peach_orange,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          24.verticalSpace,
          HorizontalPadding(
            child: Text(
              "Last Opertation",
              style: AppTextStyle.s18.medium.black,
            ),
          ),
          5.verticalSpace,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                16.horizontalSpace,
                const ButtonChip(
                  color: Colors.black,
                  title: "All",
                ),
                const ButtonChip(
                  color: Color(0xffd85202),
                  title: "Grocery",
                ),
                const ButtonChip(
                  color: Color(0xff117492),
                  title: "Investment",
                ),
                const ButtonChip(
                  color: Colors.black,
                  title: "Shopping",
                ),
                const ButtonChip(
                  color: Color(0xffe8b01f),
                  title: "Salary",
                ),
                const ButtonChip(
                  color: Color(0xffe8b01f),
                  title: "Payment",
                ),
                const ButtonChip(
                  color: Color(0xff117492),
                  title: "Investment",
                ),
                const ButtonChip(
                  color: Color(0xffd85202),
                  title: "Grocery",
                ),
              ],
            ),
          ),
          20.verticalSpace,
          Column(
            children: List.generate(
              10,
              (index) => const HomeListTile(),
            ),
          )
        ],
      ),
    );
  }
}

class HomeListTile extends StatelessWidget {
  const HomeListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HorizontalPadding(
      child: Container(
        margin: EdgeInsets.only(bottom: 20.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Row(
          children: [
            Container(
              height: 56.r,
              width: 56.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppTheme.peach_orange_color.withOpacity(.1),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "JS",
                style: AppTextStyle.s18.semiBold.peach_orange,
              ),
            ),
            10.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('John Smith', style: AppTextStyle.s15.semiBold.black),
                Row(
                  children: [
                    Text('Shopping', style: AppTextStyle.s10.regular.black),
                    Text(' - 29 Aug - 2:00 ',
                        style: AppTextStyle.s10.regular.grey),
                  ],
                )
              ],
            ),
            const Spacer(),
            Text(
              '-\$420',
              style: AppTextStyle.s14.semiBold.peach_orange,
            )
          ],
        ),
      ),
    );
  }
}

class ButtonChip extends StatelessWidget {
  final Color color;
  final String title;
  const ButtonChip({
    super.key,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
          color: color.withOpacity(.08),
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        style: TextStyle(fontSize: 10, color: color),
      ),
    );
  }
}
