import 'package:disaster_shield_bd/features/bottom_navigation/navigation_bar.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEmergencySubmitButton extends StatelessWidget {
  const AddEmergencySubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: DDeviceUtils.getBottomNavigationBarHeight() + 30,
      child: SizedBox(
          width: DDeviceUtils.getScreenWidth(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56),
            child: ElevatedButton(
                onPressed: () {
                  Get.offAll(() => const BottomNavigationMenu());
                },
                child: const Text(
                  "Save",
                )),
          )),
    );
  }
}
