import 'package:get/get.dart';

import '../controllers/profile_activity_3_controller.dart';

class ProfileActivity3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileActivity3Controller>(
      () => ProfileActivity3Controller(),
    );
  }
}
