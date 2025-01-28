import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/evacuation_guide_controller.dart';

class EvacuationGuideScreen extends StatelessWidget {
  const EvacuationGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EvacuationGuideController controller = Get.put(EvacuationGuideController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency Evacuation Guide"),
        backgroundColor: DColors.primary,
      ),
      body: Obx(() {
        // Check if data is empty
        if (controller.evacuationGuide.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Display the evacuation guide
        return ListView.builder(
          itemCount: controller.evacuationGuide.length,
          itemBuilder: (context, index) {
            final item = controller.evacuationGuide[index];
            return Card(
              color: DColors.light,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Step ${item['step'].toString()}: ${item['title'].toString()}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['description'].toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: DColors.darkText,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
