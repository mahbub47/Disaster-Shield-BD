import 'package:disaster_shield_bd/features/authentication/controllers/otp/otp_controller.dart';
import 'package:disaster_shield_bd/firebase_options.dart';
import 'package:disaster_shield_bd/repository/authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((onValue) => Get.put(AthenticationRepository()));
  Get.put(OtpController());

  runApp(const MyApp());
}
