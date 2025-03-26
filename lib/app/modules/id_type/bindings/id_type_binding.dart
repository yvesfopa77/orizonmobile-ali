import 'package:get/get.dart';
import '../controllers/id_type_controller.dart';

class IdTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IdTypeController>(
      () => IdTypeController(),
    );
  }
}
