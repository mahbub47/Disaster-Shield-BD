import 'package:disaster_shield_bd/features/home/controllers/update_emergency_contact_controller.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:disaster_shield_bd/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UpdateEmergencyContactScreen extends StatelessWidget {
  const UpdateEmergencyContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateEmergencyContactController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Update Emergency contact"),
        centerTitle: false,
        backgroundColor: DColors.primary,
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: DSizes.defaultSpace),
          child: Form(
            key: controller.updateEmergencyContactFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 50,
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
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.user,
                          color: DColors.gray,
                        ),
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
                    keyboardType: TextInputType.text,
                    maxLines: 3,
                    decoration: const InputDecoration(
                        hintText: "Write something",
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
                      controller.updateEmergencyContact();
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
