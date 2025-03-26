import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:orizon/app/core/constants/app_constants.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/core/utils/custom_package/form_builder/custom_form_field.dart';
import 'package:orizon/app/global_widgets/custom_sheet.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/global_widgets/top_bar.dart';
import 'package:orizon/app/modules/add_business_details/views/widgets/location_sheet.dart';
import 'package:orizon/app/modules/add_business_details/views/widgets/time_box.dart';
import '../controllers/add_business_details_controller.dart';

class AddBusinessDetailsView extends GetView<AddBusinessDetailsController> {
  const AddBusinessDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: "Add Business Details",
        trailing: TopBarTrailingButton(
          onTap: null,
          child: Row(
            children: [
              Text("1 ", style: AppTextStyle.s16.extraBold.white),
              Opacity(opacity: .6, child: Text("/ 4", style: AppTextStyle.s16.regular.white)),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: HorizontalPadding(
          child: FormBuilder(
            key: controller.formKey_businessDetail,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                CustomFormBuilderTextField(
                  name: AppConstants.business_name,
                  title: AppConstants.business_name,
                  validator: FormBuilderValidators.required(),
                  hintText: AppConstants.enter_business_name,
                ),
                20.verticalSpace,
                CustomFormBuilderTextField(
                  name: AppConstants.business_description,
                  title: AppConstants.business_description,
                  validator: FormBuilderValidators.required(),
                  hintText: "Enter business description here...",
                  minLines: 4,
                  maxLines: 4,
                ),
                20.verticalSpace,
                Text(
                  "Business Hours",
                  style: AppTextStyle.s13.medium.black,
                ),
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.businessHours.length,
                    itemBuilder: (context, index) {
                      var day = controller.businessHours[index];
                      return SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                day.day,
                                style: AppTextStyle.s12.regular.grey,
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                              child: FittedBox(
                                child: Switch(
                                  value: day.isOpen,
                                  onChanged: (value) {
                                    controller.businessHours[index].isOpen = value;
                                    controller.businessHours.refresh();
                                  },
                                ),
                              ),
                            ),
                            20.horizontalSpace,
                            Expanded(
                              flex: 5,
                              child: AnimatedCrossFade(
                                firstChild: SizedBox(
                                  height: 32.h,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () =>
                                              controller.updateOpenTime(context, day, index),
                                          child:
                                              TimeBox(controller: controller, time: day.openTime),
                                        ),
                                      ),
                                      5.horizontalSpace,
                                      Text(
                                        "To",
                                        style: AppTextStyle.s10.regular.grey,
                                      ),
                                      5.horizontalSpace,
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () =>
                                              controller.updateCloseTime(context, day, index),
                                          child:
                                              TimeBox(controller: controller, time: day.closeTime),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                secondChild: Text(
                                  "Closed",
                                  style: AppTextStyle.s10.regular.grey,
                                ),
                                crossFadeState: day.isOpen
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                duration: const Duration(milliseconds: 500),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (controller.validateBusinessDetailContinue()) {
                        Get.bottomSheet(
                            const CustomBottomSheet(
                              title: "Business Location",
                              body: LocationSheet(),
                            ),
                            isScrollControlled: true,
                            enableDrag: false,
                            isDismissible: false,
                            clipBehavior: Clip.hardEdge,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
                      }
                    },
                    child: const Text("Continue")),
                40.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
