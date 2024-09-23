import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/core/utils/custom_package/form_builder/custom_date_picker.dart';
import 'package:orizon/app/core/utils/custom_package/form_builder/custom_form_field.dart';
import 'package:orizon/app/core/utils/custom_package/phone_number_field/custom_form_builder_phone_field.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/global_widgets/top_bar.dart';

import '../controllers/profile_settings_controller.dart';

class ProfileSettingsView extends GetView<ProfileSettingsController> {
  const ProfileSettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: TopBar(
            showleading: false,
            title: "Profile Settings",
            trailing: TopBarTrailingButton(
                onTap: () {},
                child: Text("Save", style: AppTextStyle.s16.extraBold.white))),
        body: HorizontalPadding(
          child: Column(
            children: [
              40.verticalSpace,
              SizedBox(
                height: 140.h,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      Images.profile_background,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Container(
                            height: 92.r,
                            width: 92.r,
                            decoration: BoxDecoration(
                                color: const Color(0xffdbacac),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          10.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'John Smith',
                                  style: AppTextStyle.s24.bold.white,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      Images.location_icon,
                                    ),
                                    5.horizontalSpace,
                                    Text('United State',
                                        style: AppTextStyle.s12.medium.white),
                                    20.verticalSpace,
                                  ],
                                ),
                                20.verticalSpace,
                                Text('Profile Conpletation',
                                    style: AppTextStyle.s8.medium.white),
                                10.verticalSpace,
                                SizedBox(
                                  height: 7,
                                  child: LinearProgressIndicator(
                                    color: AppTheme.peach_orange_color,
                                    value: .2,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              10.verticalSpace,
              const TabBar(
                labelPadding: EdgeInsets.only(bottom: 10),
                dividerColor: AppTheme.border_color,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Text("Personal"),
                  Text("Business"),
                ],
              ),
              10.verticalSpace,
              const Expanded(
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [PersonalView(), BusinessView()]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PersonalView extends StatelessWidget {
  const PersonalView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomFormBuilderTextField(
            name: 'name',
            title: "Full Name",
            hintText: "Enter full name",
          ),
          20.verticalSpace,
          CustomFormBuilderDateTimePicker(
            inputType: InputType.date,
            name: 'dob',
            title: "Date of Birth",
          ),
          20.verticalSpace,
          CustomFormBuilderTextField(
            name: 'birthplace',
            title: "Birth Place ",
            hintText: "Where you born?",
          ),
          20.verticalSpace,
          CustomFormBuilderPhoneField(
            name: 'phonenumber',
            title: "phone Number",
            decoration: const InputDecoration(hintText: "Enter Number"),
          ),
          20.verticalSpace,
          CustomFormBuilderTextField(
            name: 'country',
            title: "Country of Residence",
            hintText: "Enter Residence Country",
          ),
          20.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomFormBuilderTextField(
                  name: 'regin',
                  title: "Country of Origin",
                  hintText: "Enter Origin",
                ),
              ),
              20.horizontalSpace,
              Expanded(
                  child: CustomFormBuilderTextField(
                name: 'regin',
                title: "Pin Code",
                hintText: "Enter Pin",
              )),
            ],
          ),
          100.verticalSpace,
        ],
      ),
    );
  }
}

class BusinessView extends StatelessWidget {
  const BusinessView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomFormBuilderTextField(
            name: 'name',
            title: "Company Name",
            hintText: "Enter Company name",
          ),
          20.verticalSpace,
          CustomFormBuilderDateTimePicker(
            inputType: InputType.date,
            name: 'dob',
            title: "Established Date",
          ),
          20.verticalSpace,
          CustomFormBuilderTextField(
            name: 'birthplace',
            title: "Address ",
            hintText: "Enter company Address",
          ),
          20.verticalSpace,
          CustomFormBuilderPhoneField(
            name: 'phonenumber',
            title: "phone Number",
            decoration: const InputDecoration(hintText: "Enter Number"),
          ),
          20.verticalSpace,
          CustomFormBuilderTextField(
            name: 'country',
            title: "Country of Residence",
            hintText: "Enter Residence Country",
          ),
          20.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomFormBuilderTextField(
                  name: 'regin',
                  title: "Country of Origin",
                  hintText: "Enter Origin",
                ),
              ),
              20.horizontalSpace,
              Expanded(
                  child: CustomFormBuilderTextField(
                name: 'regin',
                title: "Pin Code",
                hintText: "Enter Pin",
              )),
            ],
          ),
          100.verticalSpace,
        ],
      ),
    );
  }
}
