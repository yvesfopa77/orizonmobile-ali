import 'package:get/get.dart';

import '../controllers/add_business_details_controller.dart';

class AddBusinessDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBusinessDetailsController>(
      () => AddBusinessDetailsController(),
    );
  }
}
