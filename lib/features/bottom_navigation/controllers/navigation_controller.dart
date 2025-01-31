import 'package:disaster_shield_bd/features/donation/screens/donation_main_screen.dart';
import 'package:disaster_shield_bd/features/home/screens/home.dart';
import 'package:disaster_shield_bd/features/nearby_volunteers/screens/nearby_volunteers_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final Rx<int> currentIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    Container(color: Colors.red,),
    Container(color: Colors.black,),
    const NearbyVolunteersScreen(),
    const DonationMainScreen(),
  ];
}