import 'package:disaster_shield_bd/features/authentication/models/user_model.dart';
import 'package:disaster_shield_bd/features/authentication/screens/emergency_contact_add/emergency_contact_add.dart';
import 'package:disaster_shield_bd/repository/authentication_repository/authentication_repository.dart';
import 'package:disaster_shield_bd/repository/user/user_repository.dart';
import 'package:disaster_shield_bd/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserDetailsController extends GetxController {
  static UserDetailsController get instance => Get.find();

  final hidePass = true.obs;
  final username = TextEditingController();
  final district = TextEditingController();
  final division = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final userDetailsFormkey = GlobalKey<FormState>();
  final localStorage = GetStorage();

  Future<void> signUp() async {
    try {
      FullScreenLoader.openLoadingDialog("Authenticating");

      if (!userDetailsFormkey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      final userCredential = await AthenticationRepository.instance
          .registerWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      final newUser = UserModel(
        id: userCredential.user!.uid,
        username: username.text.trim(),
        division: division.text.trim(),
        district: district.text.trim(),
        email: email.text.trim(),
        password: password.text.trim(),
        phone: '',
        role: 'User',
        nid: '',
        organization: '',
        emergencyContact: '',
        emergencyMessage: '',
      );

      final userRepository = UserRepository.instance;
      await userRepository.saveUserRecords(newUser);

      localStorage.write("USER_EMAIL", email.text.trim());
      localStorage.write("USER_PASSWORD", password.text.trim());
      localStorage.write("USER_DISTRICT", district.text.trim());

      FullScreenLoader.stopLoading();

      Get.snackbar("Success", "Your information stored successfully");

      Get.to(() => const EmergencyContactAdd());

    } catch (e) {
      FullScreenLoader.stopLoading();
      Get.snackbar("Something went wrong", e.toString());
    }
  }
}
