import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:disaster_shield_bd/utils/constants/text_string.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class OTPPhoneLabel extends StatelessWidget {
  const OTPPhoneLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: DSizes.spaceBtwSection),
      child: Text(
        DText.otpPhoneLabel,
        style: DTextTheme.lightTextTheme.headlineSmall,
      ),
    );
  }
}