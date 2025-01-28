import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class MedicalSupportController extends GetxController {
  final DatabaseReference _hospitalsRef = FirebaseDatabase.instance.ref('hospitals');
  RxList<Map<String, dynamic>> hospitalList = <Map<String, dynamic>>[].obs;

  // Fetch hospitals based on the user's district
  Future<void> fetchHospitalsByDistrict(String userDistrict) async {
    try {
      // Fetch data from Firebase
      final snapshot = await _hospitalsRef.get();
      final data = snapshot.value;

      // Clear the previous list
      // hospitalList.clear();

      if (data != null) {
        if (data is List) {
          // If the data is a List
          final filteredHospitals = data
              .where((item) =>
          item != null &&
              item['District'] == userDistrict) // Match user district
              .map((item) => Map<String, dynamic>.from(item))
              .toList();

          hospitalList.addAll(filteredHospitals);
        } else if (data is Map) {
          // If the data is a Map
          final filteredHospitals = data.values
              .where((item) =>
          item != null &&
              item['District'] == userDistrict) // Match user district
              .map((item) => Map<String, dynamic>.from(item))
              .toList();

          hospitalList.addAll(filteredHospitals);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching hospitals: $e');
      }
    }
  }
}
