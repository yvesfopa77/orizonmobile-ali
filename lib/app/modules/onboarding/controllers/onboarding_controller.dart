import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var pageController = PageController();
  var pageIndex = 0.obs;
  var animationValue = 1.0.obs;
  @override
  void onInit() {
    pageController.addListener(() {
      if (pageController.hasClients) {
        pageIndex(pageController.page?.round());
      }

      pageAnimationValue(pageController.page!);
    });
    super.onInit();
  }

  void pageAnimationValue(double pageValue) {
    int basePage = pageValue.floor();
    double fractionalPart = pageValue - basePage;

    if (fractionalPart <= 0.5) {
      animationValue((1 + (fractionalPart * 0.2)));
    } else {
      animationValue(1.1 - ((fractionalPart - 0.5) * 0.2));
    }
  }
}
