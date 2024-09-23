import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/global_widgets/gradient_triangle.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/global_widgets/top_bar.dart';
import 'package:orizon/app/modules/id_type/views/id_list_tile.dart';
import 'package:orizon/app/routes/app_pages.dart';
import '../controllers/id_type_controller.dart';

class IdTypeView extends GetView<IdTypeController> {
  const IdTypeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GradientTriangle(
      child: Scaffold(
        appBar: const TopBar(
          title: "Select ID",
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.verticalSpace,
            HorizontalPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Please select to Scan Your ID from here",
                    style: AppTextStyle.s24.bold.black,
                  ),
                  30.verticalSpace,
                  GroupButton(
                    controller: controller.groupButtonController,
                    buttons: List.generate(
                      4,
                      (index) => 'National ID Card',
                    ),
                    buttonBuilder: (selected, value, context) => IdListTile(
                      isSelected: selected,
                      title: value,
                    ),
                  ),
                  40.verticalSpace,
                  Obx(() => ElevatedButton(
                      onPressed: controller.isButtonTapped.value
                          ? () => Get.toNamed(Routes.PERSONAL_DATA)
                          : null,
                      child: const Text("Next")))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
