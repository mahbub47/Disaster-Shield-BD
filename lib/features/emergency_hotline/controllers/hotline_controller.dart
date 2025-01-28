import 'package:disaster_shield_bd/features/emergency_hotline/models/emergency_hotlines.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HotlineController extends GetxController {
  // List of emergency hotlines
  final hotlines = EmergencyHotlines.emergencyHotlines.obs;


  // Function to call a hotline
  void callHotline(String number) async {
    final Uri url = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      Get.snackbar("Error", "Unable to make the call.");
    }
  }
}
