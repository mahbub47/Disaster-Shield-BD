import 'package:disaster_shield_bd/features/medical_support/controllers/medical_support_controller.dart';
import 'package:disaster_shield_bd/features/user_information/controllers/user_controller.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShelterLocationScreen extends StatelessWidget {

  const ShelterLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final hospitalController = Get.put(MedicalSupportController());
    final userDistrict = hospitalController.userDistrict;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: DColors.primary,
        title: Text("Shelters in $userDistrict"),
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
                trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.flag,color: DColors.greenAlert,)),
              ),
            );
          },
        );
      }),
    );
  }
}

