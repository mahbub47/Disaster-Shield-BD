import 'package:disaster_shield_bd/features/home/controllers/username_update_controller.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:disaster_shield_bd/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UpdateUsernameScreen extends StatelessWidget {
  const UpdateUsernameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UsernameUpdateController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Update Name and Phone"),
        centerTitle: false,
        backgroundColor: DColors.primary,
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: DSizes.defaultSpace),
          child: Form(
            key: controller.updateUsernameFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Your name",
                  style: DTextTheme.lightTextTheme.labelMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) => DValidator.validateEmptiTextField("Name", value),
                  controller: controller.userName,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.user,
                          color: DColors.gray,
                        ),
                        hintText: "Enter your name",
                        hintStyle:
                            TextStyle(fontSize: 12, color: DColors.gray))),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Your phone number",
                  style: DTextTheme.lightTextTheme.labelMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) => DValidator.validatePhoneNumber(value),
                  controller: controller.phone,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        hintText: "Enter phone number",
                        hintStyle:
                            TextStyle(fontSize: 12, color: DColors.gray))),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: DDeviceUtils.getBottomNavigationBarHeight() + 10,
          child: SizedBox(
              width: DDeviceUtils.getScreenWidth(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 56),
                child: ElevatedButton(
                    onPressed: () {
                      controller.updateUsernameAndPhone();
                    },
                    child: const Text(
                      "Update",
                    )),
              )),
        )
      ]),
    );
  }
}
