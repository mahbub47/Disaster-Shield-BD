import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DonorController extends GetxController {
  static DonorController get instance => Get.find();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxList<Map<String, dynamic>> requests = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDonationRequest();
  }

  // Fetch the volunteers based on the user's district
  Future<void> fetchDonationRequest() async {
    try {
      final QuerySnapshot querySnapshot = await firestore
          .collection('Donations')
          .get();

      // Map query results to a list
      requests.value = querySnapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch requests: $e');
    }
  }

}
