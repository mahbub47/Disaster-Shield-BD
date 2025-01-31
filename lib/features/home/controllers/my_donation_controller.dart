import 'package:disaster_shield_bd/features/donation/controllers/donation_controller.dart';
import 'package:get/get.dart';

class MyDonationController extends GetxController {
  static MyDonationController get instance => Get.find();

  final donationController = Get.put(DonationController());

}