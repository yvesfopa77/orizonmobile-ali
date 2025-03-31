import 'package:get/get.dart';

import '../controllers/profile_activity_controller.dart';

class ProfileActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileActivityController>(
      () => ProfileActivityController(),
    );
  }
}
