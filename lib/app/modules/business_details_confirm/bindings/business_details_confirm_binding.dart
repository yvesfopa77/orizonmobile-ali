import 'package:get/get.dart';

import '../controllers/business_details_confirm_controller.dart';

class BusinessDetailsConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusinessDetailsConfirmController>(
      () => BusinessDetailsConfirmController(),
    );
  }
}
