import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

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
                },
                child: const Text(
                  "Save",
                )),
          )),
    );
  }
}
