import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/core/utils/custom_package/phone_number_field/custom_form_builder_phone_field.dart';
import 'package:orizon/app/global_widgets/gradient_triangle.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/global_widgets/top_bar.dart';
import 'package:orizon/app/routes/app_pages.dart';

import '../controllers/phone_number_controller.dart';

class PhoneNumberView extends GetView<PhoneNumberController> {
  const PhoneNumberView({super.key});
  @override
  Widget build(BuildContext context) {
    return GradientTriangle(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const TopBar(
          title: "Phone Number",
        ),
        body: FormBuilder(
          key: controller.formKey,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: HorizontalPadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      40.verticalSpace,
                      Text(
                        "Enter Phone Number",
                        style: AppTextStyle.s24.bold.black,
                      ),
                      40.verticalSpace,
                      CustomFormBuilderPhoneField(
                        title: "Phone number",
                        name: controller.phone_field,
                        onChanged: (value) {},
                        decoration: const InputDecoration.collapsed(
                            hintText: 'enter number'),
                        priorityListByIsoCode: const ['KE'],
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      40.verticalSpace,
                      ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.OTP_VERIFICATION);
                          },
                          child: const Text('Send code')),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
