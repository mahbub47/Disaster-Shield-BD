import 'package:disaster_shield_bd/features/user_information/controllers/user_controller.dart';
import 'package:disaster_shield_bd/repository/donation/donation_repository.dart';
import 'package:disaster_shield_bd/repository/user/user_repository.dart';
import 'package:get/get.dart';

import '../features/emergency_checklist/controllers/emergency_checklist_controller.dart';

class AllControllerBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(ChecklistController());
  }
}