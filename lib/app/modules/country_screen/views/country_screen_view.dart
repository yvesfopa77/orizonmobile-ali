import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:orizon/app/core/constants/app_constants.dart';
import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/core/utils/custom_package/country_map/data/model/map/map_model.dart';
import 'package:orizon/app/core/utils/custom_package/form_builder/custom_form_field.dart';
import 'package:orizon/app/global_widgets/gradient_triangle.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/global_widgets/top_bar.dart';
import 'package:orizon/app/modules/country_screen/views/country_tile.dart';
import 'package:orizon/app/modules/country_screen/views/widgets/map.dart';

import '../controllers/country_screen_controller.dart';

class CountryScreenView extends GetView<CountryScreenController> {
  const CountryScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    print(controller.SelectedResidencecountry);
    return GradientTriangle(
      child: Obx(
        () => Scaffold(
          backgroundColor: Colors.transparent,
          appBar: TopBar(
            leading: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: const CircleAvatar(
                radius: 25,
              ),
            ),
            trailing: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: CircleAvatar(
                  radius: 25,
                  child: SvgPicture.asset(Images.setting_icon),
                )),
          ),
          body: SingleChildScrollView(
            child: HorizontalPadding(
              child: FormBuilder(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    40.verticalSpace,
                    Text(
                      "Enter Residential and Origin Country",
                      style: AppTextStyle.s24.bold.black,
                    ),
                    AnimatedCrossFade(
                        firstChild: Column(
                          children: [
                            20.verticalSpace,
                            CustomFormBuilderTextField(
                              readOnly: true,
                              decoration: const InputDecoration(
                                suffixIcon: Icon(
                                  Icons.expand_more_rounded,
                                  color: Colors.black,
                                ),
                              ),
                              name: AppConstants.residentail_country_field,
                              onTap: controller.onResidentialCountryTap,
                              title: AppConstants.residentail_country_field,
                              validator: FormBuilderValidators.required(
                                errorText: "Residentail country is required",
                              ),
                              hintText: 'Select country',
                            ),
                          ],
                        ),
                        secondChild: const SizedBox(
                          width: double.infinity,
                        ),
                        crossFadeState: controller.ischeckBoxEnable.value
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 300)),
                    20.verticalSpace,
                    CustomFormBuilderTextField(
                      readOnly: true,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                        Icons.expand_more_rounded,
                        color: Colors.black,
                      )),
                      name: AppConstants.origin_country_field,
                      onTap: controller.onOriginCountryTap,
                      title: AppConstants.origin_country_field,
                      hintText: 'Select country',
                      validator: FormBuilderValidators.required(
                          errorText: "Orgin country is required"),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          side: const BorderSide(color: AppTheme.border_color),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          value: controller.ischeckBoxEnable.value,
                          onChanged: controller.checkBoxOnChanged,
                        ),
                        Expanded(
                          child: Text(
                            'I currently live in my native country',
                            style: AppTextStyle.s11.regular.grey,
                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    const MapWidget(),
                    20.verticalSpace,
                    Obx(
                      () => controller.SelectedResidencecountry?.value == null
                          ? const SizedBox.shrink()
                          : CountryTile(
                              country:
                                  controller.SelectedResidencecountry!.value,
                              subtitle: countriesCapitals
                                  .firstWhere((item) =>
                                      item.code ==
                                      controller.SelectedResidencecountry!
                                          .value!.countryCode)
                                  .capital,
                            ),
                    ),
                    20.verticalSpace,
                    Text(
                      'Available Service',
                      style: AppTextStyle.s13.medium.black,
                    ),
                    10.verticalSpace,
                    const Row(
                      children: [
                        Expanded(
                          child: CustomCheck(
                            text: "Savings",
                          ),
                        ),
                        Expanded(
                          child: CustomCheck(
                            text: "Send Money",
                          ),
                        ),
                        Expanded(
                          child: CustomCheck(
                            text: "Payment",
                            alignToEnd: true,
                          ),
                        ),
                      ],
                    ),
                    5.verticalSpace,
                    const Row(
                      children: [
                        Expanded(
                          child: CustomCheck(
                            text: "Djangui",
                          ),
                        ),
                        Expanded(
                          child: CustomCheck(
                            text: "Crypto",
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                      ],
                    ),
                    40.verticalSpace,
                    ElevatedButton(
                        onPressed: controller.ConfirmationButton,
                        child: const Text('Confirmation')),
                    10.verticalSpace,
                    SizedBox(
                      width: double.infinity,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Read ",
                                style: AppTextStyle.s11.regular.grey),
                            TextSpan(
                                text: "Terms & Conditions",
                                style: AppTextStyle.s11.regular.black),
                            TextSpan(
                                text: " of your Country",
                                style: AppTextStyle.s11.regular.grey),
                          ],
                        ),
                      ),
                    ),
                    70.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCheck extends StatelessWidget {
  final Color color;
  final String text;
  final bool alignToEnd;
  const CustomCheck({
    super.key,
    this.color = Colors.black,
    required this.text,
    this.alignToEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          alignToEnd ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          width: 18.r,
          height: 18.r,
          padding: const EdgeInsets.all(5),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: SvgPicture.asset(
            Images.check_icon,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
        ),
        10.horizontalSpace,
        Text(
          text,
          textAlign: TextAlign.end,
          style: AppTextStyle.s11.regular.black.copyWith(color: color),
        )
      ],
    );
  }
}
