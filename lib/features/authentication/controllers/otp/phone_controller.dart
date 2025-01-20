import 'package:disaster_shield_bd/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneController extends GetxController {
  static PhoneController get instance => Get.find();

  final phone = TextEditingController();

  void phoneAuthentication(String phone){
    AthenticationRepository.instance.phonenumberAuthentication(phone);
  }
}