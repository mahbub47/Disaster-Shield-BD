import 'package:disaster_shield_bd/features/nearby_volunteers/controllers/nearby_volunteer_controller.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NearbyVolunteersScreen extends StatelessWidget {
  const NearbyVolunteersScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(NearbyVolunteerController());
    final userDistrict = controller.userDistrict;

    return Scaffold(
      appBar: AppBar(
        title: Text("Volunteers in $userDistrict"),
        backgroundColor: DColors.primary,
      ),
      body: Obx(() {
        // If volunteers list is empty
        if (controller.volunteers.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: DColors.primary,)
          );
        }

        // Show list of volunteers
        return ListView.builder(
          itemCount: controller.volunteers.length,
          itemBuilder: (context, index) {
            final volunteer = controller.volunteers[index];
            return Card(
              color: DColors.light,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 3,
              child: ListTile(
                leading: const Icon(Iconsax.personalcard, size: 30, color: DColors.greenAlert),
                title: Text(
                  volunteer['Username'] ?? 'No Name',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5,),
                    Text("Phone: ${volunteer['Phone'] ?? 'N/A'}"),
                    Text("${volunteer['Organization'] ?? 'N/A'}"),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.call, color: DColors.greenAlert),
                  onPressed: () {
                    controller.callVolunteer(volunteer['Phone']);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
