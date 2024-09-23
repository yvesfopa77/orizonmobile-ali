import 'package:get/get.dart';

import '../controllers/add_pin_controller.dart';

class AddPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPinController>(
      () => AddPinController(),
    );
  }
}
