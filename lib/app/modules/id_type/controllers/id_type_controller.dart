import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

class IdTypeController extends GetxController {
  final GroupButtonController groupButtonController = GroupButtonController();
  var isButtonTapped = false.obs;

  @override
  void onInit() {
    groupButtonController.addListener(() {
      isButtonTapped(true);
    });

    super.onInit();
  }
}
