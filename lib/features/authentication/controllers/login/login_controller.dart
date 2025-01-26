import 'package:disaster_shield_bd/repository/authentication_repository/authentication_repository.dart';
import 'package:disaster_shield_bd/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {

  final hidePass = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    email.text = localStorage.read("USER_EMAIL") ?? "";
    password.text = localStorage.read("USER_PASSWORD") ?? "";
    super.onInit();
  }

  Future<void> login() async {
    try {
      FullScreenLoader.openLoadingDialog("Loging in...");

      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      final userCredential = await AthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      
      localStorage.write("USER_EMAIL", email.text.trim());
      localStorage.write("USER_PASSWORD", password.text.trim());

      FullScreenLoader.stopLoading();
      AthenticationRepository.instance.setScreen();

    } catch (e){
      FullScreenLoader.stopLoading();
      Get.snackbar("Error", "Something went wrong");
    }
  }
}