import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/data/model/onboarding_data_model.dart';
import 'package:orizon/app/global_widgets/gradient_triangle.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/global_widgets/top_bar.dart';

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
                      FormBuilderField(
                        name: controller.phone_field,
                        validator:
                            FormBuilderValidators.required(errorText: "Phone number is required"),
                        builder: (field) => IntlPhoneField(
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          controller: controller.phoneController,
                          pickerDialogStyle: PickerDialogStyle(
                            countryCodeStyle: AppTextStyle.s11.medium.black,
                            countryNameStyle: const TextStyle(fontSize: 16),
                            listTileDivider: const SizedBox(),
                          ),
                          autovalidateMode: AutovalidateMode.disabled,
                          dropdownTextStyle:
                              const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                          decoration: InputDecoration(
                            errorText: field.errorText,
                            hintText: 'Phone Number',
                          ),
                          initialCountryCode: onboardingDataModel
                              .residentialCountry!.countryCode,
                          onChanged: (phone) {
                            if (phone.number.isEmpty) {
                              field.didChange('value');
                            } else {
                              field.didChange("${phone.countryCode}${phone.number}");
                            }

                           
                          },
                        ),
                      ),
                    
                      40.verticalSpace,
                      Obx(
                        () => ElevatedButton(
                            onPressed: !controller.isformValid.value ? null : controller.sendOtp,
                            child: const Text('Send code')),
                      ),
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
