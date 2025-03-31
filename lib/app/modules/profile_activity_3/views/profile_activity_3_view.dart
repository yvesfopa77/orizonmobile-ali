import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/global_widgets/gradient_triangle.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/modules/profile_activity_3/views/list_tile.dart';
import 'package:orizon/app/routes/app_pages.dart';

import '../controllers/profile_activity_3_controller.dart';

class ProfileActivity3View extends GetView<ProfileActivity3Controller> {
  const ProfileActivity3View({super.key});
  @override
  Widget build(BuildContext context) {
    return GradientTriangle(
      redBackGround: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              SafeArea(
                child: HorizontalPadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '👋 Hello, Yves',
                        style: AppTextStyle.s16.regular.white,
                      ),
                      10.verticalSpace,
                      GestureDetector(
                        onTap: () => Get.offAllNamed(Routes.BUSINESS_LANDING),
                        child: Text(
                          'Tell us more about you, select your activity',
                          style: AppTextStyle.s24.bold.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              24.verticalSpace,
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Get.theme.scaffoldBackgroundColor,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(24))),
                child: Column(
                  children: [
                    25.verticalSpace,
                    HorizontalPadding(
                      child: GroupButton<List<ListButtonItem>>(
                        maxSelected: controller.buttonList.length,
                        isRadio: false,
                        controller: controller.groupButtonController,
                        options: const GroupButtonOptions(
                            mainGroupAlignment:
                                MainGroupAlignment.spaceBetween),
                        buttons: List.generate(
                          controller.buttonList.length,
                          (index) => controller.buttonList,
                        ),
                        buttonIndexedBuilder: (selected, index, context) {
                          return ProfileActivity3ListTile(
                            isSelected: selected,
                            image: controller.buttonList[index].icon,
                            title: controller.buttonList[index].title,
                            subTitle: controller.buttonList[index].subtitle,
                          );
                        },
                      ),
                    ),
                    40.verticalSpace
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
