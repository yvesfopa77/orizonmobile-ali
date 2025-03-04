import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:orizon/app/core/constants/app_constants.dart';
import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/core/utils/custom_package/form_builder/custom_date_picker.dart';
import 'package:orizon/app/core/utils/custom_package/form_builder/custom_form_field.dart';
import 'package:orizon/app/core/utils/custom_package/form_builder/form_dropdown.dart';
import 'package:orizon/app/global_widgets/custom_sheet.dart';
import 'package:orizon/app/global_widgets/gradient_triangle.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/global_widgets/top_bar.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import '../controllers/personal_data_controller.dart';

class PersonalDataView extends GetView<PersonalDataController> {
  const PersonalDataView({super.key});
  @override
  Widget build(BuildContext context) {
    return GradientTriangle(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        appBar: TopBar(
          title: "Personal Data",
          trailing: TopBarTrailingButton(
            onTap: controller.doneButton,
            child: Text(
              "Done",
              style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
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
                              name: AppConstants.first_name_field,
                              title: AppConstants.first_name_field,
                              validator: FormBuilderValidators.required(
                                  errorText: "First Name is Required"),
                            ),
                          ),
                          20.horizontalSpace,
                          Expanded(
                            child: CustomFormBuilderTextField(
                              hintText: "Gilchrist",
                              name: AppConstants.last_name_field,
                              title: AppConstants.last_name_field,
                              validator: FormBuilderValidators.required(
                                  errorText: "Last Name is Required"),
                            ),
                          )
                        ],
                      ),
                      20.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: CustomFormBuilderDropdown(
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
                              name: AppConstants.gender_field,
                              title: AppConstants.gender_field,
                              validator:
                                  FormBuilderValidators.required(errorText: "Gender is Required"),
                            ),
                          ),
                          20.horizontalSpace,
                          Expanded(
                            child: CustomFormBuilderDateTimePicker(
                              decoration: const InputDecoration(isDense: true),
                              format: DateFormat("MM/dd/yy"),
                              inputType: InputType.date,
                              title: AppConstants.birth_date_field,
                              name: AppConstants.birth_date_field,
                              validator:
                                  FormBuilderValidators.required(errorText: "DOB is Required"),
                            ),
                          )
                        ],
                      ),
                      20.verticalSpace,
                      TypeAheadField<String>(
                        builder: (context, controller, focusNode) => CustomFormBuilderTextField(
                          controller: controller,
                          focusNode: focusNode,
                          name: AppConstants.city_field,
                      
                          title: AppConstants.city_field,
                          hintText: "Enter your City",
                          validator: FormBuilderValidators.required(errorText: "City is Required"),
                        ),
                        suggestionsCallback: controller.TypeAheadSeggestionCallback,
                        itemBuilder: (context, text) => ListTile(
                          title: Text(text),
                        ),
                        hideKeyboardOnDrag: true,
                        autoFlipDirection: true,
                    
                        onSelected: controller.typeAheadOnSelect,
                        transitionBuilder: (context, animation, child) {
                          return FadeTransition(
                            opacity:
                                CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
                            child: child,
                          );
                        },
                      ),
                      20.verticalSpace,
                      CustomFormBuilderTextField(
                        name: AppConstants.address_field,
                        title: AppConstants.address_field,
                        hintText: "Enter your address",
                        validator: FormBuilderValidators.required(errorText: "Address is Required"),
                      ),
                      30.verticalSpace,
                      ElevatedButton.icon(
                          onPressed: controller.populateAddressFromLocation,
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
      ),
    );
  }
}

class SignatureView extends GetView<PersonalDataController> {
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
              onPressed: controller.submitSignature, child: const Text('Submit Signature')),
          20.verticalSpace,
          Center(
              child: TextButton(
                  onPressed: () {
                    controller.signaturePadKey.currentState?.clear();
                  },
                  child: Text('Clear All', style: AppTextStyle.s13.medium.grey)))
        ],
      ),
    );
  }
}
