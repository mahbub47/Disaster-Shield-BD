import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disaster_shield_bd/features/user_information/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class NearbyVolunteerController extends GetxController {
  static NearbyVolunteerController get instance => Get.find();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxList<Map<String, dynamic>> volunteers = <Map<String, dynamic>>[].obs;
  final userDistrict = UserController.instance.userDistrict;

  @override
  void onInit() {
    super.onInit();
    fetchVolunteers(userDistrict);
  }

  // Fetch the volunteers based on the user's district
  Future<void> fetchVolunteers(String userDistrict) async {
    try {
      final QuerySnapshot querySnapshot = await firestore
          .collection('Users')
          .where('Role', isEqualTo: 'Volunteer')
          .where('District', isEqualTo: userDistrict)
          .get();

      // Map query results to a list
      volunteers.value = querySnapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch volunteers: $e');
    }
  }

  void callVolunteer(String? phone) async {
    if (phone != null && phone.isNotEmpty) {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phone,
      );
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      } else {
        Get.snackbar('Error', 'Could not launch phone call');
      }
    } else {
      Get.snackbar('Error', 'Invalid phone number');
    }
  }
}
