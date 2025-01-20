import 'package:disaster_shield_bd/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:disaster_shield_bd/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:disaster_shield_bd/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:disaster_shield_bd/features/authentication/screens/onboarding/widgets/onboarding_skip_button.dart';
import 'package:disaster_shield_bd/utils/constants/images.dart';
import 'package:disaster_shield_bd/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/onboarding/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: const [
                OnboardingPage(
                  image: Dimages.onboardingImage01,
                  title: DText.onboardingTitle01,
                  subtitle: DText.onboardingSubTitle01,
                ),
                OnboardingPage(
                  image: Dimages.onboardingImage02,
                  title: DText.onboardingTitle02,
                  subtitle: DText.onboardingSubTitle02,
                ),
                OnboardingPage(
                  image: Dimages.onboardingImage03,
                  title: DText.onboardingTitle03,
                  subtitle: DText.onboardingSubTitle03,
                ),
                OnboardingPage(
                  image: Dimages.onboardingImage04,
                  title: DText.onboardingTitle04,
                  subtitle: DText.onboardingSubTitle04,
                ),
              ],
            ),
            const OnboardingSkipButton(),
            const OnboardingDotNavigation(),
            const OnboardingNextButton()
          ],
        ));
  }
}




