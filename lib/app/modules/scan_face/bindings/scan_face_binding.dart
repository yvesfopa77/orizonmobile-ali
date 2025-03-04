import 'package:get/get.dart';

import '../controllers/scan_face_controller.dart';

class ScanFaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanFaceController>(
      () => ScanFaceController(),
    );
  }
}
