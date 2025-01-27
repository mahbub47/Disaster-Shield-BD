import 'package:disaster_shield_bd/features/medical_support/controllers/medical_support_controller.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalSupportScreen extends StatelessWidget {
  final String userDistrict;

  const MedicalSupportScreen({super.key, required this.userDistrict});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final hospitalController = Get.put(MedicalSupportController());
    hospitalController.fetchHospitalsByDistrict(userDistrict);

    // Fetch hospitals when the widget is built
    // hospitalController.fetchHospitals().then((_) {
    //   // Filter hospitals by user's district
    //   hospitalController.filterHospitalsByDistrict(userDistrict);
    // });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: DColors.primary,
        title: Text("Hospitals in $userDistrict"),
      ),
      body: Obx(() {
        // Display a loading indicator if data is being fetched
        if (hospitalController.hospitalList.isEmpty) {
          return const Center(child: CircularProgressIndicator(color: DColors.primary,));
        }

        // Display the filtered hospitals in a list
        return ListView.builder(
          itemCount: hospitalController.hospitalList.length,
          itemBuilder: (context, index) {
            var hospital = hospitalController.hospitalList[index];
            return Card(
              color: DColors.light,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(

                title: Text(hospital['Organization Name'] ?? "Unknown"),
                subtitle: Text(
                  "${hospital['Upazila']}, ${hospital['District']}",
                ),
                trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.call,color: DColors.primary,)),
              ),
            );
          },
        );
      }),
    );
  }
}

