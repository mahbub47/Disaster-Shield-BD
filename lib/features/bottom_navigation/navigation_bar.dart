import 'package:disaster_shield_bd/features/bottom_navigation/controllers/navigation_controller.dart';
import 'package:disaster_shield_bd/features/bottom_navigation/controllers/send_sms_controller.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final smsController = Get.put(SendSmsController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 20,
            shadowColor: DColors.dark,
            backgroundColor: DColors.light,
            selectedIndex: controller.currentIndex.value,
            onDestinationSelected: (index) =>
                controller.currentIndex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
              NavigationDestination(
                  icon: Icon(Iconsax.menu_board), label: "Events"),
              Text(""),
              NavigationDestination(
                  icon: Icon(Iconsax.security_user), label: "Volunteers"),
              NavigationDestination(
                  icon: Icon(Iconsax.heart_circle),
                  label: "Donation"),
            ]),
      ),
      body: Obx(() => controller.screens[controller.currentIndex.value]),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: GestureDetector(
          onLongPress: () async{
            await smsController.sendSMS("+8801704481125", "Help me");
          },
          child: FloatingActionButton(
            elevation: 0,
            onPressed: () {Get.snackbar("Warning", "hold 2 seconds to confirm SOS");},
            backgroundColor: DColors.redAlert,
            foregroundColor: DColors.light,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: const BorderSide(width: 5, color: DColors.accent)),
            child: const Text(
              "SOS",
              style: TextStyle(
                  color: DColors.light,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
