import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class HomepageFeatureCard extends StatelessWidget {
  const HomepageFeatureCard({
    super.key,
    required this.featureName,
    required this.icon,
    required this.ontap,
  });

  final String featureName;
  final IconData icon;
  final GestureTapCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            color: DColors.light,
            border: Border.all(color: DColors.accent, width: 2),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Icon(
              icon,
              size: 30,
              color: DColors.darkText,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              featureName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: DColors.darkText,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}