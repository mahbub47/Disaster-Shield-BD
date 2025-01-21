import 'package:disaster_shield_bd/features/home/screens/widgets/home_feature_card.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreenFeaturesBox extends StatelessWidget {
  const HomeScreenFeaturesBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: DDeviceUtils.getScreenHeight() * 0.15,
      child: SizedBox(
        width: DDeviceUtils.getScreenWidth(),
        child: Center(
          child: Container(
              width: 335,
              height: 230,
              decoration: BoxDecoration(
                  color: DColors.light,
                  border: Border.all(width: 5, color: DColors.accent),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  children: [
                    HomepageFeatureCard(
                      featureName: "Shelter\nlocations",
                      icon: Iconsax.home_hashtag,
                      ontap: () {},
                    ),
                    HomepageFeatureCard(
                      featureName: "Medical\nSupport",
                      icon: Iconsax.shield_tick,
                      ontap: () {},
                    ),
                    HomepageFeatureCard(
                      featureName: "Emergency\nhotlines",
                      icon: Iconsax.call,
                      ontap: () {},
                    ),
                    HomepageFeatureCard(
                      featureName: "Emergency\nchecklist",
                      icon: Iconsax.tick_square,
                      ontap: () {},
                    ),
                    HomepageFeatureCard(
                      featureName: "Evacuation\nguide",
                      icon: Iconsax.book,
                      ontap: () {},
                    ),
                    HomepageFeatureCard(
                      featureName: "Nearby\nvolunteer",
                      icon: Iconsax.heart,
                      ontap: () {},
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
