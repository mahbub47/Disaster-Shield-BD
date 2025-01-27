import 'package:disaster_shield_bd/features/bottom_navigation/navigation_bar.dart';
import 'package:disaster_shield_bd/features/user_information/controllers/user_controller.dart';
import 'package:disaster_shield_bd/repository/user/user_repository.dart';
import 'package:disaster_shield_bd/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VolunteerRegistrationController extends GetxController {
  static VolunteerRegistrationController get instance => Get.find();

  final userNID = TextEditingController();
  final organization = TextEditingController();
  final userController = UserController.instance;
  final userRepository = UserRepository.instance;
  final volunteerRegistrationFormKey = GlobalKey<FormState>();
  final isVolunteer = false.obs;

  @override
  void onInit() {
    initializeTextFields();
    super.onInit();
  }

  Future<void> initializeTextFields() async{
    if(userController.user.value.role == "Volunteer") {
      userNID.text = userController.user.value.nid;
      organization.text = userController.user.value.organization;
      isVolunteer.value = true;
    }
  }

  Future<void> volunteerRegistration() async{
    try {
      FullScreenLoader.openLoadingDialog("Loading");

      if (!volunteerRegistrationFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> valunteerRegistration = {
        "Role": "Volunteer",
        'NID': userNID.text.trim(),
        'Organization': organization.text.trim()
      };
      await userRepository.updateSingleField(valunteerRegistration);

      userController.user.value.nid = userNID.text.trim();
      userController.user.value.organization = organization.text.trim();
      userController.user.value.role = "Volunteer";

      FullScreenLoader.stopLoading();

      Get.snackbar("Success", "we will confirm you soon about your registration");

      Get.off(() => const BottomNavigationMenu());

    } catch (e) {
      FullScreenLoader.stopLoading();
      Get.snackbar("Error", "Something went wrong");
    }

  }
}