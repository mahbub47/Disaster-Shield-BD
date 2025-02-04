import 'package:disaster_shield_bd/features/home/controllers/weather_controller.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreenTempWidget extends StatelessWidget {
  const HomeScreenTempWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final weatherController = Get.put(WeatherController());
    return Obx(() {
      return Positioned(
        top: 20,
        child: SizedBox(
          width: DDeviceUtils.getScreenWidth(),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: DDeviceUtils.getScreenWidth() * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          weatherController.localStorage
                                  .read("USER_DISTRICT") ??
                              "",
                          style: const TextStyle(
                            color: DColors.light,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const Icon(
                          Iconsax.location,
                          color: DColors.light,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          weatherController.weather.value?.weatherMain
                                  .toString() ??
                              "Clear",
                          style: const TextStyle(
                              color: DColors.light,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://openweathermap.org/img/wn/${weatherController.weather.value?.weatherIcon ?? '10d'}@2x.png"))),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${weatherController.weather.value?.temperature?.celsius!.toStringAsFixed(0) ?? '15'}°',
                      style: const TextStyle(
                          color: DColors.light,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '${weatherController.weather.value?.tempMin?.celsius?.toStringAsFixed(0) ?? '13'}/${weatherController.weather.value?.tempMax?.celsius?.toStringAsFixed(0) ?? '15'} feels like ${weatherController.weather.value?.tempFeelsLike?.celsius?.toStringAsFixed(0) ?? '12'}',
                      style: const TextStyle(
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
    });
  }
}
