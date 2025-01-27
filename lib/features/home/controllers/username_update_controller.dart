import 'package:disaster_shield_bd/features/bottom_navigation/navigation_bar.dart';
import 'package:disaster_shield_bd/features/user_information/controllers/user_controller.dart';
import 'package:disaster_shield_bd/repository/user/user_repository.dart';
import 'package:disaster_shield_bd/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UsernameUpdateController extends GetxController {
  static UsernameUpdateController get instance => Get.find();

  final userName = TextEditingController();
  final phone = TextEditingController();
  final userController = UserController.instance;
  final userRepository = UserRepository.instance;
  final updateUsernameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeTextFields();
    super.onInit();
  }

  Future<void> initializeTextFields() async{
    userName.text = userController.user.value.username;
    phone.text = userController.user.value.phone;
  }

  Future<void> updateUsernameAndPhone() async{
    try {
      FullScreenLoader.openLoadingDialog("Updating you information");

      if (!updateUsernameFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> nameAndPhone = {
        'Username': userName.text.trim(),
        'Phone': phone.text.trim()
      };
      await userRepository.updateSingleField(nameAndPhone);

      userController.user.value.username = userName.text.trim();
      userController.user.value.phone = phone.text.trim();

      FullScreenLoader.stopLoading();

      Get.snackbar("Success", "Username and Phone updated successfully");

      Get.off(() => const BottomNavigationMenu());

    } catch (e) {
      FullScreenLoader.stopLoading();
      Get.snackbar("Error", "Something went wrong");
    }

  }
}