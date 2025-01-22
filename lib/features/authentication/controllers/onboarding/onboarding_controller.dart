import 'package:disaster_shield_bd/features/authentication/screens/otp/first_otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final deviceStorage = GetStorage();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
    if(currentPageIndex.value == 3){
      deviceStorage.write('isFirstTime', false);
      Get.offAll(() => const FirstOtpScreen());
    }else {
      currentPageIndex.value = currentPageIndex.value + 1;
      pageController.jumpToPage(currentPageIndex.value);
    }
  }

  void skipPage() {
    deviceStorage.write('isFirstTime', false);
    Get.offAll(() => const FirstOtpScreen());
  }
}