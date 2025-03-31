import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/global_widgets/custom_sheet.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/modules/profile_activity/views/list_tile.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../controllers/profile_activity_controller.dart';

class ProfileActivityView extends GetView<ProfileActivityController> {
  const ProfileActivityView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const FractionallySizedBox(
            heightFactor: .5,
            alignment: Alignment.topCenter,
            child: ColoredBox(color: AppTheme.primary_color),
          ),
          SingleChildScrollView(
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
                        Text(
                          'Tell us more about you, select your activity',
                          style: AppTextStyle.s24.bold.white,
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
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(24))),
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
                            return ProfileActivityListTile(
                              isSelected: selected,
                              isSingleTile:
                                  index == controller.buttonList.length - 1,
                              image: controller.buttonList[index].icon,
                              title: controller.buttonList[index].title,
                              subTitle: controller.buttonList[index].subtitle,
                            );
                          },
                        ),
                      ),
                      20.verticalSpace,
                      HorizontalPadding(
                        child: ElevatedButton(
                            onPressed: controller.onContinue,
                            child: const Text("Continue")),
                      ),
                      40.verticalSpace
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class SignatureView extends GetView<ProfileActivityController> {
  const SignatureView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      isCloseButtonvisible: true,
      title: "Signature",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Please sign in the area and confirm to account Term & Conditions',
            style: AppTextStyle.s13.regular.grey,
          ),
          10.verticalSpace,
          DottedBorder(
            padding: const EdgeInsets.all(2),
            borderType: BorderType.RRect,
            dashPattern: const [8, 4],
            color: AppTheme.border_color,
            radius: const Radius.circular(18),
            child: SizedBox(
                height: 200.h,
                child: SfSignaturePad(
                  key: controller.signaturePadKey,
                )),
          ),
          20.verticalSpace,
          ElevatedButton(
              onPressed: controller.submitSignature,
              child: const Text('Submit Signature')),
          20.verticalSpace,
          Center(
              child: TextButton(
                  onPressed: () {
                    controller.signaturePadKey.currentState?.clear();
                  },
                  child:
                      Text('Clear All', style: AppTextStyle.s13.medium.grey)))
        ],
      ),
    );
  }
}
