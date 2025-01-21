import 'package:disaster_shield_bd/utils/constants/images.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class HomeScreenMainImage extends StatelessWidget {
  const HomeScreenMainImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: DDeviceUtils.getScreenHeight() * 0.45,
      child: SizedBox(
        width: DDeviceUtils.getScreenWidth(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: DDeviceUtils.getScreenWidth() * 0.2),
          child: const Image(
            image: AssetImage(Dimages.homwScreenImage),
          ),
        ),
      ),
    );
  }
}
