import 'package:disaster_shield_bd/features/authentication/screens/otp/widgets/otp_get_otp_button.dart';
import 'package:disaster_shield_bd/features/authentication/screens/otp/widgets/otp_phone_input_field.dart';
import 'package:disaster_shield_bd/features/authentication/screens/otp/widgets/otp_phone_label.dart';
import 'package:disaster_shield_bd/utils/constants/images.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class FirstOtpScreen extends StatelessWidget {
  const FirstOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: DDeviceUtils.getAppBarHeight() + 10),
              child: Image(
                  width: DDeviceUtils.getScreenWidth() * 0.65,
                  image: const AssetImage(Dimages.phoneNumberScreenImage)),
            ),
            const OtpPhoneInputField(),
            const SizedBox(height: DSizes.spaceBtwItems,),
            const OTPPhoneLabel(),
          ],
        ),
        const GetOTPButton()
      ]),
    );
  }
}
