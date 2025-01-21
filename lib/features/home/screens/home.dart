import 'package:disaster_shield_bd/common/widgets/common_bg_shape.dart';
import 'package:disaster_shield_bd/features/home/screens/widgets/home_screen_features_box.dart';
import 'package:disaster_shield_bd/features/home/screens/widgets/home_screen_main_image.dart';
import 'package:disaster_shield_bd/features/home/screens/widgets/home_screen_temp_widget.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: DColors.primary,
        title: Text(
          "D S B D",
          style: DTextTheme.lightTextTheme.headlineLarge!
              .apply(color: DColors.lightText),
        ),
        centerTitle: true,
        leading: const Icon(
          Iconsax.menu_14,
          color: DColors.light,
        ),
        actions: const [
          Icon(Iconsax.notification),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SizedBox(
        height: DDeviceUtils.getScreenHeight(),
        width: DDeviceUtils.getScreenWidth(),
        child: const Stack(
          children: [
            CommonBGShape(),
            HomeScreenTempWidget(),
            HomeScreenFeaturesBox(),
            HomeScreenMainImage()
          ],
        ),
      ),
    );
  }
}
