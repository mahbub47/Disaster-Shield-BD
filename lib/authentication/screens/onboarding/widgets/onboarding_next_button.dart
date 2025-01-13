import 'package:disaster_shield_bd/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/themes/custom_themes/elevated_button_theme.dart';
class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Positioned(
        bottom: DDeviceUtils.getBottomNavigationBarHeight() + 10,
        right: 0,
        left: 0,
        child: Center(
          child: ElevatedButton(
              style: DElevatedButtonTheme.lightElevatedButtonTheme
                  .style,
              onPressed: () => controller.nextPage(),
              child: const Text("    Next    ")),
        ));
  }
}