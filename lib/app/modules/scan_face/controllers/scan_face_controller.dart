import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:orizon/main.dart';

class ScanFaceController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late CameraController cameraController;

  var isCamerainit = false.obs;

//this animation used for oval shape
  //late AnimationController _waveAnimationController;
  //this animation is used for scaling the timer widget
  late Animation<Alignment> alignmentTween;

  @override
  void onInit() {
    // _animationInitilization();
    _initCamera();

    cameraController.addListener(() {
      if (cameraController.value.isInitialized) {
        isCamerainit(true);
      }
    });
    super.onInit();
  }

  _initCamera() async {
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

  // void _animationInitilization() {
  //   _waveAnimationController = AnimationController(
  //     vsync: this,
  //     duration: const Duration(seconds: 2),
  //     reverseDuration: const Duration(seconds: 2),
  //   );

  //   alignmentTween =
  //       AlignmentTween(begin: Alignment.topCenter, end: Alignment.bottomCenter)
  //           .animate(
  //     CurvedAnimation(
  //       parent: _waveAnimationController,
  //       curve: Curves.easeInOut,
  //       reverseCurve: Curves.easeInOut,
  //     ),
  //   );

  //   //repeat wave animaiton
  //   _waveAnimationController.repeat(reverse: true);
  // }
}
