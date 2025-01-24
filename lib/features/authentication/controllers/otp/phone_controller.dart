import 'package:disaster_shield_bd/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/otp/second_otp_screen.dart';

class PhoneController extends GetxController {
  static PhoneController get instance => Get.find();

  final phone = TextEditingController();
  final phoneAuthFormKey = GlobalKey<FormState>();

  void phoneAuthentication(String phone){
    if(!phoneAuthFormKey.currentState!.validate()){
      return;
    }
    AthenticationRepository.instance.phonenumberAuthentication(phone);

    Get.to(() => const SecondOtpScreen());
  }
}