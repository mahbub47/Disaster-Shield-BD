import 'package:disaster_shield_bd/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/device/device_utility.dart';

class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;


    return Positioned(
        bottom: DDeviceUtils.getBottomNavigationBarHeight() +
            DDeviceUtils.getScreenHeight() * 0.12,
        right: 0,
        left: 0,
        child: Center(
            child: SmoothPageIndicator(
              controller: controller.pageController, count: 4, onDotClicked: controller.dotNavigationClick, effect: const WormEffect(
              dotWidth: 8,
                dotHeight: 8,
                dotColor: DColors.gray,
                activeDotColor: DColors.primary
            ),)));
  }
}