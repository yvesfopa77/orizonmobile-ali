import 'package:get/get.dart';

import '../controllers/country_screen_controller.dart';

class CountryScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountryScreenController>(
      () => CountryScreenController(),
    );
  }
}
