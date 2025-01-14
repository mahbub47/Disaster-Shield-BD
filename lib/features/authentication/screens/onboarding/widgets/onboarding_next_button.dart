import 'package:disaster_shield_bd/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:flutter/material.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Positioned(
        bottom: DDeviceUtils.getBottomNavigationBarHeight() + 10,
        child: SizedBox(
          width: DDeviceUtils.getScreenWidth(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56),
            child: ElevatedButton(
                style: DElevatedButtonTheme.lightElevatedButtonTheme
                    .style,
                onPressed: () => controller.nextPage(),
                child: const Text("Next")),
          ),
        ));
  }
}