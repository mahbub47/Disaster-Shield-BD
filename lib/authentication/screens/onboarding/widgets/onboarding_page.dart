import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helper/helper_functions.dart';
import '../../../../utils/themes/custom_themes/text_theme.dart';
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key, required this.image, required this.title, required this.subtitle,
  });

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const SizedBox(height: 100,),
          Image(
              width: DHelperFunctions.screenWidth() * 0.6,
              image: AssetImage(image)),
          const SizedBox(height: DSizes.defaultSpace,),
          Text(
            title,
            style: DTextTheme.lightTextTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: DSizes.defaultSpace,),
          Text(
            subtitle,
            style: DTextTheme.lightTextTheme.bodyMedium,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}