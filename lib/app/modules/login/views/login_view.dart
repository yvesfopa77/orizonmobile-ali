import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:orizon/app/core/constants/images_string.dart';
import 'package:orizon/app/core/theme/app_theme.dart';
import 'package:orizon/app/core/theme/text_theme.dart';
import 'package:orizon/app/core/utils/custom_package/phone_number_field/custom_form_builder_phone_field.dart';
import 'package:orizon/app/global_widgets/gradient_triangle.dart';
import 'package:orizon/app/global_widgets/horizontal_padding.dart';
import 'package:orizon/app/global_widgets/top_bar.dart';
import 'package:orizon/app/routes/app_pages.dart';
import 'package:pinput/pinput.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return GradientTriangle(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const TopBar(
          showleading: false,
          title: 'Login',
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.verticalSpace,
            HorizontalPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back, Sabir!",
                    style: AppTextStyle.s24.bold.black,
                  ),
                  16.verticalSpace,
                  Text(
                    "Hello there, enter phone number and your 5 digits code to continue.",
                    style: AppTextStyle.s13.regular.grey,
                  ),
                  40.verticalSpace,
                  CustomFormBuilderPhoneField(
                    title: "Phone number",
                    name: 'phone_number',
                    decoration: const InputDecoration.collapsed(
                        hintText: 'enter number'),
                    priorityListByIsoCode: const ['KE'],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  20.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    child: Pinput(
                      length: 5,
                      preFilledWidget: Text(
                        '0',
                        style: TextStyle(
                            color: const Color.fromRGBO(156, 164, 180, 1),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      defaultPinTheme: PinTheme(
                        textStyle: const TextStyle(
                            color: Color.fromRGBO(156, 164, 180, 1)),
                        height: 52.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppTheme.border_color,
                          ),
                          color: Colors.transparent,
                        ),
                      ),
                      submittedPinTheme: PinTheme(
                        height: 52.r,
                        textStyle: AppTextStyle.s14.semiBold.white,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppTheme.border_color,
                          ),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  40.verticalSpace,
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.CONFIRM_PIN);
                      },
                      child: const Text('Login')),
                  40.verticalSpace,
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "or login with Face ID",
                      style: AppTextStyle.s13.medium.grey,
                    ),
                  ),
                  40.verticalSpace,
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 120.r,
                      height: 120.r,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.sea_blue_color),
                      child: SvgPicture.asset(
                        height: 44.r,
                        width: 44.r,
                        Images.face_id_icon,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
