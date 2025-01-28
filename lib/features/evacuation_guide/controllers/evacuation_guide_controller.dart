import 'package:disaster_shield_bd/features/evacuation_guide/models/evacuation_guide_list.dart';
import 'package:get/get.dart';

class EvacuationGuideController extends GetxController {
  // List to hold evacuation guide steps
  final evacuationGuide = EvacuationGuideList.evacuationGuide.obs;

}
