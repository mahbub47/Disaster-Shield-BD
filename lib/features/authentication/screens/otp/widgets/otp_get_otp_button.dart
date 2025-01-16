import 'package:disaster_shield_bd/features/authentication/screens/otp/second_otp_screen.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetOTPButton extends StatelessWidget {
  const GetOTPButton({
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
                  onPressed: () {Get.to(() => const SecondOtpScreen());}, child: const Text("Get OTP")),
            )));
  }
}
