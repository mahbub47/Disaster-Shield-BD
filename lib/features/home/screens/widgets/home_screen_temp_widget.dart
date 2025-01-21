import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreenTempWidget extends StatelessWidget {
  const HomeScreenTempWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      child: SizedBox(
        width: DDeviceUtils.getScreenWidth(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: DDeviceUtils.getScreenWidth() * 0.05),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Iconsax.location,
                        color: DColors.light,
                      ),
                      Text(
                        "Sylhet Sadar",
                        style: TextStyle(
                          color: DColors.light,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        "cloudy",
                        style: TextStyle(
                            color: DColors.light,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Iconsax.cloud,
                        color: DColors.light,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "30°",
                    style: TextStyle(
                        color: DColors.light,
                        fontSize: 40,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "30/31 feels like 36",
                    style: TextStyle(
                        color: DColors.light,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
