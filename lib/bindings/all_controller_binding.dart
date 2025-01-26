import 'package:get/get.dart';

import '../features/emergency_checklist/controllers/emergency_checklist_controller.dart';

class AllControllerBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(ChecklistController());
  }
}