import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disaster_shield_bd/features/bottom_navigation/navigation_bar.dart';
import 'package:disaster_shield_bd/features/donation/models/donation_model.dart';
import 'package:disaster_shield_bd/features/donation/screens/donation_main_screen.dart';
import 'package:disaster_shield_bd/features/user_information/controllers/user_controller.dart';
import 'package:disaster_shield_bd/repository/authentication_repository/authentication_repository.dart';
import 'package:disaster_shield_bd/repository/donation/donation_repository.dart';
import 'package:disaster_shield_bd/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DonationReceiverController extends GetxController {
  static DonationReceiverController get instance => Get.find();

  final receiverName = TextEditingController();
  final incidentType = TextEditingController();
  final receiverNid = TextEditingController();
  final incidentDate = TextEditingController();
  final bankName = TextEditingController();
  final accountName = TextEditingController();
  final accountNumber = TextEditingController();
  final mobileBanking = TextEditingController();
  final mobileBankingPhone = TextEditingController();
  final receiverFormkey = GlobalKey<FormState>();
  final RxList<File> imageFiles = RxList<File>();
  final ImagePicker imagePicker = ImagePicker();
  final donationRepository = Get.put(DonationRepository());
  final userController = UserController.instance;

  Future<void> donationRequest() async {
    try {
      FullScreenLoader.openLoadingDialog("Loading");

      if (!receiverFormkey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      if(imageFiles.isEmpty) {
        FullScreenLoader.stopLoading();
        Get.snackbar("Warning", "Please enter at least one image");
        return;
      }

      final userId = AthenticationRepository.instance.authUser!.uid;

      final newReq = DonationModel(
          id: userId,
          receiverName: receiverName.text,
          incidentType: incidentType.text,
          receiverNID: receiverNid.text,
          incidentDate: incidentDate.text,
          bankName: bankName.text,
          bankAccountName: accountName.text,
          bankAccountNo: accountNumber.text,
          mobileBankingName: mobileBanking.text,
          mobileBankingPhone: mobileBankingPhone.text,
          userDistrict: userController.user.value.district,
          userDivision: userController.user.value.division,
          reqStatus: 'Requested',
          images: imageFiles.value.map((file) => file.path).toList());

      await donationRepository.saveUserReuest(newReq);


      FullScreenLoader.stopLoading();

      Get.snackbar("Success", "Your request will be reviewed shortly");

      Get.off(() => const BottomNavigationMenu());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Get.snackbar("Something went wrong", e.toString());
    }
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        firstDate: DateTime(2000), lastDate: DateTime(2100), context: context);
    if (pickedDate != null) {
      incidentDate.text = pickedDate.toString().split(" ")[0];
    }
  }

  Future<void> addPicture() async {
    if (imageFiles.length < 5) {
      final XFile? pickedImage = await imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedImage != null) {
        imageFiles.add(File(pickedImage.path));
      }
    } else {
      Get.snackbar(
        "Limit Reached",
        "You can only upload a maximum of 5 images.",
      );
    }
  }
}
