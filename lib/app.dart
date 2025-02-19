import 'package:disaster_shield_bd/bindings/all_controller_binding.dart';
import 'package:disaster_shield_bd/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/authentication/screens/onboarding/welcome_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      initialBinding: AllControllerBinding(),
      title: "Disaster Shield BD",
      theme: DappTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
    );
  }
}
