import 'package:countries_world_map/countries_world_map.dart';
import 'package:countries_world_map/data/maps/world_map.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/core/utils/custom_package/form_builder/custom_form_field.dart';
import 'package:orizon/app/global_widgets/gradient_triangle.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/global_widgets/top_bar.dart';
import 'package:orizon/app/modules/country_screen/views/country_tile.dart';
import 'package:orizon/app/routes/app_pages.dart';

import '../controllers/country_screen_controller.dart';

class CountryScreenView extends GetView<CountryScreenController> {
  const CountryScreenView({super.key});
  @override
  Widget build(BuildContext context) {
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
                    20.verticalSpace,
                    CustomFormBuilderTextField(
                      readOnly: true,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                        Icons.expand_more_rounded,
                        color: Colors.black,
                      )),
                      name: controller.residentialCountry_field,
                      onTap: () {
                        showCountryPicker(
                          context: context,

                          showPhoneCode:
                              true, // optional. Shows phone code before the country name.
                          onSelect: (Country country) {
                            controller.Selectedcountry?.value = country;
                            controller.formKey.currentState
                                ?.fields[controller.residentialCountry_field]
                                ?.didChange(country.name);
                          },
                        );
                      },
                      title: 'Residential Country',
                      hintText: 'Select country',
                    ),
                    20.verticalSpace,
                    CustomFormBuilderTextField(
                      readOnly: true,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                        Icons.expand_more_rounded,
                        color: Colors.black,
                      )),
                      name: controller.origincountry_field,
                      onTap: () {
                        showCountryPicker(
                          context: context,

                          showPhoneCode:
                              true, // optional. Shows phone code before the country name.
                          onSelect: (Country country) {
                            controller.formKey.currentState
                                ?.fields[controller.origincountry_field]
                                ?.didChange(country.name);
                          },
                        );
                      },
                      title: 'Origin Country',
                      hintText: 'Select country',
                    ),
                    20.verticalSpace,
                    Row(
                      children: [
                        Checkbox(
                            side:
                                const BorderSide(color: AppTheme.border_color),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            value: controller.ischeckBoxEnable.value,
                            onChanged: (value) =>
                                controller.ischeckBoxEnable(value)),
                        Expanded(
                          child: Text(
                            'Allow to check if country of residence is same as country of origin',
                            style: AppTextStyle.s11.regular.grey,
                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    SimpleMap(
                      instructions: SMapWorld.instructions,
                      defaultColor: Colors.grey,
                      colors: SMapWorldColors(
                        uS: AppTheme.sea_blue_color,
                        cN: AppTheme.sea_blue_color,
                        aU: AppTheme.sea_blue_color,
                      ).toMap(),
                      callback: (id, name, tapdetails) {},
                    ),
                    20.verticalSpace,
                    Obx(
                      () => CountryTile(
                        country: controller.Selectedcountry!.value,
                        subtitle: "",
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
                        onPressed: () => Get.toNamed(Routes.ID_TYPE),
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
