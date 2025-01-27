import 'package:disaster_shield_bd/features/bottom_navigation/navigation_bar.dart';
import 'package:disaster_shield_bd/repository/user/user_repository.dart';
import 'package:disaster_shield_bd/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddEmergencyContactController extends GetxController {
  static AddEmergencyContactController get instance => Get.find();

  final userPhone = TextEditingController();
  final emergencyPhone = TextEditingController();
  final emergencyMessage = TextEditingController();
  final addEmergencyContactFormKey = GlobalKey<FormState>();
  final userRepository = UserRepository.instance;

  Future<void> addEmergencyContact() async{
    try {
      FullScreenLoader.openLoadingDialog("Updating user information");

      if(!addEmergencyContactFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> emergencyContact = {
        'Phone': userPhone.text.trim(),
        'Emergency Contact': emergencyPhone.text.trim(),
        'Emergency Message': emergencyMessage.text.trim(),
      };

      userRepository.updateSingleField(emergencyContact);

      FullScreenLoader.stopLoading();

      Get.snackbar("Success", "Emergency contact updated successfully");

      Get.offAll(() => const BottomNavigationMenu());

    } catch (e) {
      FullScreenLoader.stopLoading();
      Get.snackbar("Error", "Something went wrong");
    }
  }
}