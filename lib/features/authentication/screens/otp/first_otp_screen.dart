import 'package:disaster_shield_bd/common/clip_path/curved_edges.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/input_field_theme.dart';
import 'package:flutter/material.dart';

class FirstOtpScreen extends StatelessWidget {
  const FirstOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: DCustomCurveEdge(),
            child: Container(
              height: DDeviceUtils.getScreenHeight() * 0.4,
              width: DDeviceUtils.getScreenWidth(),
              color: DColors.primary,
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              fillColor: DColors.darkText,
            ),
          )
        ],
      ),
    );
  }
}
