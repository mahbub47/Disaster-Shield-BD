import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class OtpPhoneInputField extends StatelessWidget {
  const OtpPhoneInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: DSizes.spaceBtwSection),
        child: TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: "Enter phone number",
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 15, horizontal: 10),
              child: Text(
                "+880",
                style: DTextTheme.lightTextTheme.labelLarge,
              ),
            ),
          ),
        ));
  }
}