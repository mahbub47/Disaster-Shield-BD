import 'package:disaster_shield_bd/features/authentication/screens/user_details/user_details_screen.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/constants/images.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class SecondOtpScreen extends StatelessWidget {
  const SecondOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: DDeviceUtils.getAppBarHeight() + 10),
                child: Center(
                  child: Image(
                      width: DDeviceUtils.getScreenWidth() * 0.6,
                      image: const AssetImage(Dimages.otpScreenImage)),
                ),
              ),
              Text("Enter the otp sent at +880 1704 4811 25",
                style: DTextTheme.lightTextTheme.headlineSmall,),
              const SizedBox(height: 10,),
              OtpTextField(
                numberOfFields: 6,
                filled: true,
                fillColor: DColors.accent.withOpacity(0.5),
              ),
              const SizedBox(height: 10,),
              TextButton(onPressed: () {},
                  child: Text("Resend OTP",
                    style: DTextTheme.lightTextTheme.labelSmall,)),
            ],
          ),
          Positioned(
            bottom: DDeviceUtils.getBottomNavigationBarHeight() + 10,
            child: SizedBox(
                width: DDeviceUtils.getScreenWidth(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56),
                  child: ElevatedButton(onPressed: () {Get.offAll(() => const UserDetailsScreen());}, child: const Text("Confirm")),
                )),
          )
        ],
      ),
    );
  }
}
