import 'package:disaster_shield_bd/features/disaster_training/controllers/training_controller.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DisasterController controller = Get.put(DisasterController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: DColors.primary,
          title: const Text("Disaster Training Guide")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.disasters.isEmpty) {
          return Center(child: Text(controller.disasters.length.toString()));
        }

        return ListView.builder(
          itemCount: controller.disasters.length,
          itemBuilder: (context, index) {
            final disaster = controller.disasters[index];
            return Card(
              color: DColors.accent,
              margin: const EdgeInsets.all(10),
              child: ExpansionTile(
                backgroundColor: DColors.light,
                title: Text(disaster.name),
                children: [
                  _buildGuideSection(
                      "Before", disaster.trainingGuide["before"] ?? []),
                  const SizedBox(height: 20),
                  _buildGuideSection(
                      "During", disaster.trainingGuide["during"] ?? []),
                  const SizedBox(height: 20),
                  _buildGuideSection(
                      "After", disaster.trainingGuide["after"] ?? []),
                ],
              ),
            );
          },
        );
      }),
    );
  }

  Widget _buildGuideSection(String title, List<String> guide) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: DColors.darkText),
          ),
          const SizedBox(height: 10),
          ...guide.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text("- $item", style: const TextStyle(fontSize: 14)),
            );
          }),
        ],
      ),
    );
  }
}
