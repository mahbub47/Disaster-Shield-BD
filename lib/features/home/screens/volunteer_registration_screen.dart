import 'package:disaster_shield_bd/features/home/controllers/volunteer_registration_controller.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:disaster_shield_bd/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class VolunteerRegistrationScreen extends StatelessWidget {
  const VolunteerRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VolunteerRegistrationController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Register as a volunteer"),
        centerTitle: false,
        backgroundColor: DColors.primary,
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: DSizes.defaultSpace),
          child: Form(
            key: controller.volunteerRegistrationFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Your NID Number",
                  style: DTextTheme.lightTextTheme.labelMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                    enabled: controller.isVolunteer.value == true ? false : true,
                  validator: (value) => DValidator.validateNID(value),
                  controller: controller.userNID,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.card,
                          color: DColors.gray,
                        ),
                        hintText: "Enter your NID number",
                        hintStyle:
                        TextStyle(fontSize: 12, color: DColors.gray))),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Organization",
                  style: DTextTheme.lightTextTheme.labelMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  enabled: controller.isVolunteer.value == true ? false : true,
                  validator: (value) => DValidator.validateEmptiTextField("Organization", value),
                  controller: controller.organization,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Iconsax.building,
                        color: DColors.gray,
                      ),
                        hintText: "Enter your organization name",
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
                    onPressed: controller.isVolunteer.value == true ? null : () {controller.volunteerRegistration();},
                    child: const Text(
                      "Register",
                    )),
              )),
        )
      ]),
    );
  }
}
