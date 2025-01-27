import 'package:disaster_shield_bd/features/bottom_navigation/controllers/navigation_controller.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 80,
            elevation: 20,
            shadowColor: DColors.dark,
            backgroundColor: DColors.light,
            selectedIndex: controller.currentIndex.value,
            onDestinationSelected: (index) => controller.currentIndex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
              NavigationDestination(icon: Icon(Icons.map_outlined), label: "Map"),
              Text(""),
              NavigationDestination(
                  icon: Icon(Icons.book_outlined), label: "Training"),
              NavigationDestination(
                  icon: Icon(Icons.volunteer_activism_outlined), label: "Donation"),
            ]),
      ),
      body: Obx(() => controller.screens[controller.currentIndex.value]),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          elevation: 0,
          onPressed: () {},
          backgroundColor: DColors.redAlert,
          foregroundColor: DColors.light,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: const BorderSide(
              width: 5,
              color: DColors.accent
            )
          ),
          child: const Icon(Icons.add_alert),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
