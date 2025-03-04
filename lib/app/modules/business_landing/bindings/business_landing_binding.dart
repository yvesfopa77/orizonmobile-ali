import 'package:get/get.dart';

import '../controllers/business_landing_controller.dart';

class BusinessLandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusinessLandingController>(
      () => BusinessLandingController(),
    );
  }
}
