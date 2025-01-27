import 'package:disaster_shield_bd/features/home/screens/update_username_screen.dart';
import 'package:disaster_shield_bd/features/user_information/controllers/user_controller.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DrawerProfileWidget extends StatelessWidget {
  const DrawerProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Container(
      color: DColors.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Text(
                            controller.user.value.username,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: DColors.lightText),
                          )),
                      Obx(() => Text(
                            controller.user.value.phone,
                            style: const TextStyle(
                                color: DColors.lightText,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () => Get.to(() => const UpdateUsernameScreen()),
              icon: const Icon(Iconsax.edit,size: 20,
                color: DColors.light,),
            )
          ],
        ),
      ),
    );
  }
}
