import 'package:get/get.dart';

import '../controllers/business_final_controller.dart';

class BusinessFinalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusinessFinalController>(
      () => BusinessFinalController(),
    );
  }
}
