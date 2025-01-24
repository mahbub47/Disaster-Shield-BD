import 'package:disaster_shield_bd/features/authentication/controllers/user_details/user_details_controller.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class UserDetailsSubmitButton extends StatelessWidget {
  final controller = UserDetailsController.instance;
  UserDetailsSubmitButton({
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
                  controller.signUp();
                },
                child: const Text(
                  "Next",
                )),
          )),
    );
  }
}