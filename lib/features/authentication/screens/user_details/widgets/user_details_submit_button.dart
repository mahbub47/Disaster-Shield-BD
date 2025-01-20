import 'package:disaster_shield_bd/features/authentication/screens/emergency_contact_add/emergency_contact_add.dart';
import 'package:disaster_shield_bd/features/authentication/screens/onboarding/welcome_screen.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailsSubmitButton extends StatelessWidget {
  const UserDetailsSubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: DDeviceUtils.getBottomNavigationBarHeight() + 10,
      child: SizedBox(
          width: DDeviceUtils.getScreenWidth(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56),
            child: ElevatedButton(
                onPressed: () {
                  Get.offAll(() => const EmergencyContactAdd());
                },
                child: const Text(
                  "Next",
                )),
          )),
    );
  }
}