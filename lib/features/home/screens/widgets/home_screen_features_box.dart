import 'package:disaster_shield_bd/features/disaster_training/screens/training_screen.dart';
import 'package:disaster_shield_bd/features/emergency_checklist/screens/emergency_checklist_screen.dart';
import 'package:disaster_shield_bd/features/emergency_hotline/screens/hotline_screen.dart';
import 'package:disaster_shield_bd/features/evacuation_guide/screens/evacuation_guide_screen.dart';
import 'package:disaster_shield_bd/features/home/screens/widgets/home_feature_card.dart';
import 'package:disaster_shield_bd/features/medical_support/screens/medical_support_screen.dart';
import 'package:disaster_shield_bd/features/shelter_locations/screens/shelter_location_screen.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                      ontap: () {Get.to(() => const ShelterLocationScreen());},
                    ),
                    HomepageFeatureCard(
                      featureName: "Medical\nSupport",
                      icon: Iconsax.shield_tick,
                      ontap: () {Get.to(() => const MedicalSupportScreen());},
                    ),
                    HomepageFeatureCard(
                      featureName: "Emergency\nhotlines",
                      icon: Iconsax.call,
                      ontap: () {Get.to(() => const HotlineScreen());},
                    ),
                    HomepageFeatureCard(
                      featureName: "Emergency\nchecklist",
                      icon: Iconsax.tick_square,
                      ontap: () {Get.to(() => const EmergencyChecklistScreen()); },
                    ),
                    HomepageFeatureCard(
                      featureName: "Evacuation\nguide",
                      icon: Iconsax.book,
                      ontap: () {Get.to(() => const EvacuationGuideScreen());},
                    ),
                    HomepageFeatureCard(
                      featureName: "Disaster\nTraining",
                      icon: Icons.book_outlined,
                      ontap: () {Get.to(() => const TrainingScreen());},
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
