import 'package:disaster_shield_bd/features/authentication/screens/onboarding/welcome_screen.dart';
import 'package:disaster_shield_bd/repository/authentication_repository/authentication_repository.dart';
import 'package:disaster_shield_bd/utils/popups/confirm_popup.dart';
import 'package:disaster_shield_bd/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DeleteUserController extends GetxController {
  static DeleteUserController get instance => Get.find();
  final authRepository = AthenticationRepository.instance;

  Future<void> deletUser() async {
    try {
      ConfirmPopup.showConfirmPopup(
          "Warning",
          "This will permanently delete your data",
              () async {FullScreenLoader.openLoadingDialog("Deleting user");
            await authRepository.deleteUserAccount();
            FullScreenLoader.stopLoading();
            Get.offAll(() => const WelcomeScreen());
            },
              () {Navigator.of(Get.overlayContext!).pop();
          return;});
    } catch (e) {
      FullScreenLoader.stopLoading();
      Get.snackbar("Error", "Something went wrong");
    }
  }
}
