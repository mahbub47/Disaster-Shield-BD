import 'package:disaster_shield_bd/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/themes/custom_themes/text_theme.dart';
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