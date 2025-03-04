import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:orizon/app/core/utils/custom_package/phone_number_field/custom_form_builder_phone_field.dart';
import 'package:orizon/app/global_widgets/custom_sheet.dart';
import 'package:orizon/app/modules/add_business_details/controllers/add_business_details_controller.dart';
import 'package:orizon/app/modules/add_business_details/views/widgets/photo_sheet.dart';

class PhoneNumberSheet extends GetView<AddBusinessDetailsController> {
  const PhoneNumberSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FormBuilder(
        key: controller.formKey_phoneNumber,
        child: Column(
          children: [
            10.verticalSpace,
            CustomFormBuilderPhoneField(
              name: "primary",
              decoration: const InputDecoration(hintText: 'enter number'),
              validator: FormBuilderValidators.required(),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            TextButton(
                onPressed: () {
                  controller.addField();
                },
                child: const Text('Add new phone number')),
            AnimatedList(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              key: controller.listKey,
              initialItemCount: controller.fieldNames.length,
              itemBuilder: (context, index, animation) {
                return controller.buildField(controller.fieldNames[index], index, animation);
              },
            ),
            40.verticalSpace,
            ElevatedButton(
                onPressed: () {
                  if (controller.addPhoneNummberContinue()) {
                    Get.bottomSheet(
                        const CustomBottomSheet(
                          title: "Business Presentation Photos",
                          body: PhotoSheet(),
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
    );
  }
}
