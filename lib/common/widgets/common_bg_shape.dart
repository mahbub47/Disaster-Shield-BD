import 'package:disaster_shield_bd/common/clip_path/curved_edges.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class CommonBGShape extends StatelessWidget {
  const CommonBGShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DCustomCurveEdge(),
      child: Container(
        height: DDeviceUtils.getScreenHeight() * 0.4,
        width: DDeviceUtils.getScreenWidth(),
        color: DColors.primary,
      ),
    );
  }
}