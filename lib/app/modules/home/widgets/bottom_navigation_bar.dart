// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/text_theme.dart';

class CustomBottomNavigation extends StatelessWidget {
  final ValueChanged<int>? onTap;
  final RxInt currentIndex;
  CustomBottomNavigation({
    super.key,
    this.onTap,
    required this.currentIndex,
  });

  final List<BottomBarItem> items = [
    BottomBarItem(
      name: "Home",
      icon: Images.home_icon,
    ),
    BottomBarItem(
      name: "Wallet",
      icon: Images.wallet_icon,
    ),
    BottomBarItem(
      name: "Setting",
      icon: Images.setting_wheel_icon,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black),
                height: 68,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    items.length,
                    (index) => GestureDetector(
                      onTap: () {
                        onTap!.call(index);
                      },
                      child: BottombarElement(
                        icon: items[index].icon,
                        title: items[index].name,
                        isSelected: index == currentIndex.value ? true : false,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            25.horizontalSpace,
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.black),
              height: 68,
              width: 68,
              alignment: Alignment.center,
              child: SvgPicture.asset(Images.transation_icon),
            )
          ],
        ),
      ),
    );
  }
}

class BottombarElement extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  const BottombarElement({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        alignment: Alignment.center,
        firstChild: FittedBox(
          child: Container(
            margin: const EdgeInsets.all(5),
            height: 67,
            padding: EdgeInsets.only(right: 30.w, left: 13.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.white),
            child: Row(
              children: [
                SvgPicture.asset(icon,
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn)),
                6.horizontalSpace,
                Text(
                  title,
                  style: AppTextStyle.s12.medium.black,
                ),
              ],
            ),
          ),
        ),
        secondChild: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        crossFadeState:
            isSelected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 300));
  }
}

class BottomBarItem {
  final String name;
  final String icon;

  BottomBarItem({
    required this.name,
    required this.icon,
  });
}
