import 'package:disaster_shield_bd/features/home/controllers/update_location_controller.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:disaster_shield_bd/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UpdateLocationScreen extends StatelessWidget {
  const UpdateLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateLocationController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Update Location"),
        centerTitle: false,
        backgroundColor: DColors.primary,
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: DSizes.defaultSpace),
          child: Form(
            key: controller.updateLocationFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Division",
                  style: DTextTheme.lightTextTheme.labelMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) => DValidator.validateEmptiTextField("Division", value),
                  controller: controller.userDivision,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.map,
                          color: DColors.gray,
                        ),
                        hintText: "Enter division name",
                        hintStyle:
                            TextStyle(fontSize: 12, color: DColors.gray))),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "District",
                  style: DTextTheme.lightTextTheme.labelMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) => DValidator.validateEmptiTextField("District", value),
                  controller: controller.userDistrict,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.location,
                          color: DColors.gray,
                        ),
                        hintText: "Enter district name",
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
                      controller.updateUserLocation();
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
