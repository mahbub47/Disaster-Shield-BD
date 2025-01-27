import 'package:disaster_shield_bd/features/authentication/controllers/add_emergency_contact/add_emergency_contact_controller.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class AddEmergencySubmitButton extends StatelessWidget {
  const AddEmergencySubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddEmergencyContactController.instance;
    return Positioned(
      bottom: DDeviceUtils.getBottomNavigationBarHeight() + 30,
      child: SizedBox(
          width: DDeviceUtils.getScreenWidth(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56),
            child: ElevatedButton(
                onPressed: () {
                  controller.addEmergencyContact();
                },
                child: const Text(
                  "Save",
                )),
          )),
    );
  }
}
