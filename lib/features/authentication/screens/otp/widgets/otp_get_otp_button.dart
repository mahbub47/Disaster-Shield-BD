import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class GetOTPButton extends StatelessWidget {
  const GetOTPButton({
    super.key,
    required this.buttonText
  });

  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: DDeviceUtils.getBottomNavigationBarHeight() + 10,
        child: SizedBox(
            width: DDeviceUtils.getScreenWidth(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 56),
              child: ElevatedButton(
                  onPressed: () {}, child: const Text("Get OTP")),
            )));
  }
}