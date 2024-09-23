import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/utils/custom_package/form_builder/custom_date_picker.dart';
import 'package:orizon/app/core/utils/custom_package/form_builder/custom_form_field.dart';
import 'package:orizon/app/core/utils/custom_package/form_builder/form_dropdown.dart';
import 'package:orizon/app/global_widgets/gradient_triangle.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/global_widgets/top_bar.dart';
import 'package:orizon/app/routes/app_pages.dart';

import '../controllers/personal_data_controller.dart';

class PersonalDataView extends GetView<PersonalDataController> {
  const PersonalDataView({super.key});
  @override
  Widget build(BuildContext context) {
    return GradientTriangle(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: TopBar(
          title: "Personal Data",
          trailing: TopBarTrailingButton(
            onTap: () => Get.toNamed(Routes.PHONE_NUMBER),
            child: Text(
              "Done",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        body: Column(
          children: [
            40.verticalSpace,
            HorizontalPadding(
              child: FormBuilder(
                key: controller.formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomFormBuilderTextField(
                            hintText: "Adam",
                            name: 'firstName',
                            title: "First Name",
                          ),
                        ),
                        20.horizontalSpace,
                        Expanded(
                          child: CustomFormBuilderTextField(
                            hintText: "Gilchrist",
                            name: 'lastName',
                            title: "Last Name",
                          ),
                        )
                      ],
                    ),
                    20.verticalSpace,
                    CustomFormBuilderTextField(
                      readOnly: true,
                      decoration: _expandMoreIcon(),
                      name: controller.country_field,
                      onTap: () {
                        showCountryPicker(
                          context: context,

                          showPhoneCode:
                              true, // optional. Shows phone code before the country name.
                          onSelect: (Country country) {
                            controller.formKey.currentState
                                ?.fields[controller.country_field]
                                ?.didChange(country.name);
                          },
                        );
                      },
                      title: 'Country',
                      hintText: 'Select country',
                    ),
                    20.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: CustomFormBuilderDropdown(
                            isDense: true,
                            hintText: 'Male',
                            decoration: const InputDecoration(isDense: true),
                            items: const [
                              DropdownMenuItem(
                                value: 'male',
                                child: Text('Male'),
                              ),
                              DropdownMenuItem(
                                value: 'Female',
                                child: Text('Female'),
                              ),
                            ],
                            name: 'gender',
                            title: "Gender",
                          ),
                        ),
                        20.horizontalSpace,
                        Expanded(
                          child: CustomFormBuilderDateTimePicker(
                            format: DateFormat("MM/dd/yy"),
                            inputType: InputType.date,
                            title: "Select DOB",
                            name: 'dob',
                          ),
                        )
                      ],
                    ),
                    20.verticalSpace,
                    CustomFormBuilderTextField(
                      name: 'Address',
                      title: "Address",
                      hintText: "Enter your address",
                    ),
                    20.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: CustomFormBuilderTextField(
                            name: 'postal Code',
                            title: "Postal Code",
                            hintText: 'Enter Code',
                          ),
                        ),
                        20.horizontalSpace,
                        Expanded(
                          child: CustomFormBuilderTextField(
                            readOnly: true,
                            decoration: _expandMoreIcon(),
                            name: controller.residence_field,
                            onTap: () {
                              showCountryPicker(
                                context: context,

                                showPhoneCode:
                                    true, // optional. Shows phone code before the country name.
                                onSelect: (Country country) {
                                  controller.formKey.currentState
                                      ?.fields[controller.residence_field]
                                      ?.didChange(country.name);
                                },
                              );
                            },
                            title: 'Country of Residence',
                            hintText: 'Select',
                          ),
                        )
                      ],
                    ),
                    30.verticalSpace,
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          Images.map_icon,
                        ),
                        label: const Text('use Currnet Location'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration _expandMoreIcon() {
    return const InputDecoration(
        suffixIcon: Icon(
      Icons.expand_more_rounded,
      color: Colors.black,
    ));
  }
}
