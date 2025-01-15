import 'package:disaster_shield_bd/common/widgets/common_bg_shape.dart';
import 'package:disaster_shield_bd/features/authentication/screens/otp/widgets/otp_get_otp_button.dart';
import 'package:disaster_shield_bd/features/authentication/screens/otp/widgets/otp_phone_input_field.dart';
import 'package:disaster_shield_bd/features/authentication/screens/otp/widgets/otp_phone_label.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class FirstOtpScreen extends StatelessWidget {
  const FirstOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonBGShape(),
              SizedBox( height: DSizes.spaceBtwSection * 2),
              OtpPhoneInputField(),
              SizedBox(height: DSizes.spaceBtwItems,),
              OTPPhoneLabel(),
            ],
          ),
          GetOTPButton(buttonText: "Get OTP",)
        ]
      ),
    );
  }
}

