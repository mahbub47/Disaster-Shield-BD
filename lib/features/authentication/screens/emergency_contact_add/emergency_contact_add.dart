import 'package:disaster_shield_bd/features/authentication/controllers/add_emergency_contact/add_emergency_contact_controller.dart';
import 'package:disaster_shield_bd/features/authentication/screens/emergency_contact_add/widgets/add_emergency_submit_button.dart';
import 'package:disaster_shield_bd/features/bottom_navigation/navigation_bar.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:disaster_shield_bd/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmergencyContactAdd extends StatelessWidget {
  const EmergencyContactAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddEmergencyContactController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: DSizes.defaultSpace),
            child: Form(
              key: controller.addEmergencyContactFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: Text(
                      "Emergency contact",
                      style: DTextTheme.lightTextTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Your phone",
                    style: DTextTheme.lightTextTheme.labelMedium,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: (value) => DValidator.validatePhoneNumber(value),
                    controller: controller.userPhone,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          hintText: "Enter phone number",
                          hintStyle:
                              TextStyle(fontSize: 12, color: DColors.gray))),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Emergency contact",
                    style: DTextTheme.lightTextTheme.labelMedium,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: (value) => DValidator.validatePhoneNumber(value),
                    controller: controller.emergencyPhone,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          hintText: "Enter phone number",
                          hintStyle:
                          TextStyle(fontSize: 12, color: DColors.gray))),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Emergency message",
                    style: DTextTheme.lightTextTheme.labelMedium,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: (value) => DValidator.validateEmptiTextField("Message", value),
                    controller: controller.emergencyMessage,
                      maxLines: 3,
                      keyboardType: TextInputType.streetAddress,
                      decoration: const InputDecoration(
                          hintText: "Enter emergency message",
                          hintStyle:
                              TextStyle(fontSize: 12, color: DColors.gray))),
                ],
              ),
            ),
          ),
          const AddEmergencySubmitButton(),
          Positioned(
            bottom: DDeviceUtils.getBottomNavigationBarHeight() - 20,
              child: SizedBox(
                width: DDeviceUtils.getScreenWidth(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: TextButton(
                      onPressed: () {Get.offAll(() => const BottomNavigationMenu()); },
                      child: Text(
                        "Skip",
                        style: DTextTheme.lightTextTheme.labelMedium,
                      )),
                ),
              ))
        ],
      ),
    );
  }
}
