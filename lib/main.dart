import 'package:disaster_shield_bd/firebase_options.dart';
import 'package:disaster_shield_bd/repository/authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding= WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((onValue) => Get.put(AthenticationRepository()));

  runApp(const MyApp());
}
