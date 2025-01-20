import 'package:disaster_shield_bd/features/authentication/controllers/otp/otp_controller.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/constants/images.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class SecondOtpScreen extends StatelessWidget {
  const SecondOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String otp = '';
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
              Text(
                "Enter the otp sent at +880 1704 4811 25",
                style: DTextTheme.lightTextTheme.headlineSmall,
              ),
              const SizedBox(
                height: 10,
              ),
              OtpTextField(
                numberOfFields: 6,
                filled: true,
                fillColor: DColors.accent.withOpacity(0.5),
                onSubmit: (code) {
                  otp = code;
                  OtpController.instance.verifyOtp(otp);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Resend OTP",
                    style: DTextTheme.lightTextTheme.labelSmall,
                  )),
            ],
          ),
          Positioned(
            bottom: DDeviceUtils.getBottomNavigationBarHeight() + 10,
            child: SizedBox(
                width: DDeviceUtils.getScreenWidth(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56),
                  child: ElevatedButton(
                      onPressed: () {
                        OtpController.instance.verifyOtp(otp);
                      }, child: const Text("Confirm")),
                )),
          )
        ],
      ),
    );
  }
}
