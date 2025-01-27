import 'package:disaster_shield_bd/features/bottom_navigation/navigation_bar.dart';
import 'package:disaster_shield_bd/features/user_information/controllers/user_controller.dart';
import 'package:disaster_shield_bd/repository/user/user_repository.dart';
import 'package:disaster_shield_bd/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateEmergencyContactController extends GetxController {
  static UpdateEmergencyContactController get instance => Get.find();

  final emergencyPhone = TextEditingController();
  final emergencyMessage = TextEditingController();
  final userController = UserController.instance;
  final userRepository = UserRepository.instance;
  final updateEmergencyContactFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeTextFields();
    super.onInit();
  }

  Future<void> initializeTextFields() async{
    emergencyPhone.text = userController.user.value.emergencyContact;
    emergencyMessage.text = userController.user.value.emergencyMessage;
  }

  Future<void> updateEmergencyContact() async{
    try {
      FullScreenLoader.openLoadingDialog("Updating your information");

      if (!updateEmergencyContactFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> emergencyContact = {
        'Emergency Contact': emergencyPhone.text.trim(),
        'Emergency Message': emergencyMessage.text.trim()
      };
      await userRepository.updateSingleField(emergencyContact);

      userController.user.value.emergencyContact = emergencyPhone.text.trim();
      userController.user.value.emergencyMessage = emergencyMessage.text.trim();

      FullScreenLoader.stopLoading();

      Get.snackbar("Success", "Emergency contact updated successfully");

      Get.off(() => const BottomNavigationMenu());

    } catch (e) {
      FullScreenLoader.stopLoading();
      Get.snackbar("Error", "Something went wrong");
    }

  }
}