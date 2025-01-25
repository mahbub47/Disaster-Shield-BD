import 'package:disaster_shield_bd/common/widgets/common_bg_shape.dart';
import 'package:disaster_shield_bd/features/authentication/screens/login_with_email/login_with_email_screen.dart';
import 'package:disaster_shield_bd/features/authentication/screens/otp/first_otp_screen.dart';
import 'package:disaster_shield_bd/features/home/screens/widgets/drawer_item_widget.dart';
import 'package:disaster_shield_bd/features/home/screens/widgets/drawer_profile_widget.dart';
import 'package:disaster_shield_bd/features/home/screens/widgets/home_screen_features_box.dart';
import 'package:disaster_shield_bd/features/home/screens/widgets/home_screen_main_image.dart';
import 'package:disaster_shield_bd/features/home/screens/widgets/home_screen_temp_widget.dart';
import 'package:disaster_shield_bd/repository/authentication_repository/authentication_repository.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      drawer: Drawer(
        backgroundColor: DColors.light,
        shape: const BeveledRectangleBorder(),
        child: Padding(
          padding: EdgeInsets.only(top: DDeviceUtils.getAppBarHeight()),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const DrawerProfileWidget(),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      DrawerItemWidget(
                        icon: Iconsax.global,
                        label: "Language",
                        ontap: () {},
                      ),
                      DrawerItemWidget(
                        icon: Iconsax.call,
                        label: "Emergency contact",
                        ontap: () {},
                      ),
                      DrawerItemWidget(
                        icon: Iconsax.user,
                        label: "About us",
                        ontap: () {},
                      ),
                      DrawerItemWidget(
                        icon: Iconsax.logout,
                        label: "Logout",
                        ontap: () {
                          AthenticationRepository.instance.logout();
                          Get.offAll(() => const LoginWithEmailScreen());
                        },
                      ),
                      const Divider(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


