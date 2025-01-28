import 'package:disaster_shield_bd/features/bottom_navigation/navigation_bar.dart';
import 'package:disaster_shield_bd/features/user_information/controllers/user_controller.dart';
import 'package:disaster_shield_bd/repository/user/user_repository.dart';
import 'package:disaster_shield_bd/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateLocationController extends GetxController {
  static UpdateLocationController get instance => Get.find();

  final userDivision = TextEditingController();
  final userDistrict = TextEditingController();
  final userController = UserController.instance;
  final userRepository = UserRepository.instance;
  final updateLocationFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeTextFields();
    super.onInit();
  }

  Future<void> initializeTextFields() async{
    userDivision.text = userController.user.value.division;
    userDistrict.text = userController.user.value.district;
  }

  Future<void> updateUserLocation() async{
    try {
      FullScreenLoader.openLoadingDialog("Updating your information");

      if (!updateLocationFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> location = {
        'Division': userDivision.text.trim(),
        'District': userDistrict.text.trim()
      };
      await userRepository.updateSingleField(location);

      userController.user.value.division = userDivision.text.trim();
      userController.user.value.district = userDistrict.text.trim();

      FullScreenLoader.stopLoading();

      Get.snackbar("Success", "Your location updated successfully");

      Get.off(() => const BottomNavigationMenu());

    } catch (e) {
      FullScreenLoader.stopLoading();
      Get.snackbar("Error", "Something went wrong");
    }

  }
}