import 'package:get/get.dart';

import '../controllers/profile_intro_controller.dart';

class ProfileIntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileIntroController>(
      () => ProfileIntroController(),
    );
  }
}
