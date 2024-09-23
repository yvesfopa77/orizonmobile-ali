import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController imageController;
  late Animation<double> imageSize;
  late AnimationController textLineController;
  late Animation<double> textLineSize;

  @override
  void onInit() {
    imageController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    imageSize = Tween<double>(begin: 1.5, end: 1).animate(
        CurvedAnimation(parent: imageController, curve: Curves.bounceOut));
    textLineController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    textLineSize = Tween<double>(begin: 4, end: 1).animate(
        CurvedAnimation(parent: textLineController, curve: Curves.bounceOut));

    imageController.forward().then((_) {
      textLineController.forward();
    });

    super.onInit();
  }

  @override
  void onClose() {
    imageController.dispose();
    super.onClose();
  }
}
