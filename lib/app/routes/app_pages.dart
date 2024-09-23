import 'package:get/get.dart';

import '../modules/add_pin/bindings/add_pin_binding.dart';
import '../modules/add_pin/views/add_pin_view.dart';
import '../modules/confirm_pin/bindings/confirm_pin_binding.dart';
import '../modules/confirm_pin/views/confirm_pin_view.dart';
import '../modules/country_screen/bindings/country_screen_binding.dart';
import '../modules/country_screen/views/country_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/id_type/bindings/id_type_binding.dart';
import '../modules/id_type/views/id_type_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/otp_verification/bindings/otp_verification_binding.dart';
import '../modules/otp_verification/views/otp_verification_view.dart';
import '../modules/personal_data/bindings/personal_data_binding.dart';
import '../modules/personal_data/views/personal_data_view.dart';
import '../modules/phone_number/bindings/phone_number_binding.dart';
import '../modules/phone_number/views/phone_number_view.dart';
import '../modules/profile_settings/bindings/profile_settings_binding.dart';
import '../modules/profile_settings/views/profile_settings_view.dart';
import '../modules/scan_card/bindings/scan_card_binding.dart';
import '../modules/scan_card/views/scan_card_view.dart';
import '../modules/scan_face/bindings/scan_face_binding.dart';
import '../modules/scan_face/views/scan_face_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_CARD,
      page: () => const ScanCardView(),
      binding: ScanCardBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_FACE,
      page: () => const ScanFaceView(),
      binding: ScanFaceBinding(),
    ),
    GetPage(
      name: _Paths.ID_TYPE,
      page: () => const IdTypeView(),
      binding: IdTypeBinding(),
    ),
    GetPage(
      name: _Paths.PHONE_NUMBER,
      page: () => const PhoneNumberView(),
      binding: PhoneNumberBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFICATION,
      page: () => const OtpVerificationView(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PIN,
      page: () => const AddPinView(),
      binding: AddPinBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRM_PIN,
      page: () => const ConfirmPinView(),
      binding: ConfirmPinBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_DATA,
      page: () => const PersonalDataView(),
      binding: PersonalDataBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SETTINGS,
      page: () => const ProfileSettingsView(),
      binding: ProfileSettingsBinding(),
    ),
    GetPage(
      name: _Paths.COUNTRY_SCREEN,
      page: () => const CountryScreenView(),
      binding: CountryScreenBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
  ];
}
