import 'package:disaster_shield_bd/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:disaster_shield_bd/utils/constants/images.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:disaster_shield_bd/utils/constants/text_string.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(56),
            child: Column(
              children: [
                Image(
                  width: DDeviceUtils.getScreenWidth() * 0.8,
                    image: const AssetImage(Dimages.mainLogo)),
                Text(
                  DText.welcomeTitle,
                  style: DTextTheme.lightTextTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: DSizes.defaultSpace,
                ),
                Text(
                  DText.welcomeSubTitle,
                  style: DTextTheme.lightTextTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: DDeviceUtils.getBottomNavigationBarHeight() + 10,
            child: SizedBox(
              width: DDeviceUtils.getScreenWidth(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 56),
                child: ElevatedButton(
                  style: DElevatedButtonTheme.lightElevatedButtonTheme.style,
                  onPressed: () => {
                    Get.off(() => const OnboardingScreen()),
                  },
                  child: const Text("Get Started"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
