import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orizon/main.dart';

class ScanCardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late CameraController cameraController;

  var isCamerainit = false.obs;
  late AnimationController waveAnimationController;
  late Animation<Alignment> alignmentTween;

  var sliderValue = 1.0.obs;
  var maxZoomLevel = 1.0.obs;
  var toggleSwitchIndex = 0.obs;
  var frontImage = Rxn<XFile>();
  var backImage = Rxn<XFile>();

  @override
  void onInit() {
    initCamera();
    animaitonInitilization();
    cameraController.addListener(() {
      if (cameraController.value.isInitialized) {
        isCamerainit(true);
        cameraController.getMaxZoomLevel().then((value) {
          if (value > 10) {
            maxZoomLevel(10);
          } else {
            maxZoomLevel(value);
          }
        });
      }
    });

    super.onInit();
  }

  initCamera() async {
    cameraController = CameraController(cameras[0], ResolutionPreset.max);
    cameraController.initialize().then((_) {}).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  void animaitonInitilization() {
    //if you want to change the duration of wave animation, change both duration and reverse duration with same value
    waveAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(seconds: 2),
    );

    alignmentTween =
        AlignmentTween(begin: Alignment.topCenter, end: Alignment.bottomCenter)
            .animate(CurvedAnimation(
                parent: waveAnimationController,
                curve: Curves.easeInOut,
                reverseCurve: Curves.easeInOut));
    //
    //it will allow animation to repeat with infinity time
    waveAnimationController.repeat(reverse: true);
    waveAnimationController.addListener(() {});
  }
}
