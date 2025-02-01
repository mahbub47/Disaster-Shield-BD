import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disaster_shield_bd/features/user_information/controllers/user_controller.dart';
import 'package:disaster_shield_bd/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class EventListController extends GetxController {
  static EventListController get instance => Get.find();

  final userController = UserController.instance;
  var role = ''.obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxList<Map<String, dynamic>> events = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> myEvents = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllEvents();
    fetchMyEvents();
  }

  // Fetch the volunteers based on the user's district
  Future<void> fetchAllEvents() async {
    try {
      final QuerySnapshot querySnapshot = await firestore
          .collection('Events')
          .get();

      // Map query results to a list
      events.value = querySnapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch requests: $e');
    }
  }

  Future<void> fetchMyEvents() async {
    try {
      final QuerySnapshot querySnapshot = await firestore
          .collection('Events')
      .where('Created by', isEqualTo: AthenticationRepository.instance.authUser?.uid.toString())
          .get();

      // Map query results to a list
      myEvents.value = querySnapshot.docs.map((doc) {
        return {
          'id': doc.id,
          ...doc.data() as Map<String, dynamic>,
        };
      }).toList();

    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch requests: $e');
    }
  }

  fetchRole() {
    role.value = userController.user.value.role;
  }

}