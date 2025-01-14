import 'package:disaster_shield_bd/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Positioned(
        top: DDeviceUtils.getAppBarHeight(),
        right: DSizes.defaultSpace,
        child: TextButton(
            onPressed: () => controller.skipPage(),
            child: Text(
              "Skip",
              style: DTextTheme.lightTextTheme.headlineSmall,
            )));
  }
}