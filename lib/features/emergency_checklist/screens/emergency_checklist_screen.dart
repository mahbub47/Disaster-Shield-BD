import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/emergency_checklist_controller.dart';

class EmergencyChecklistScreen extends StatelessWidget {
  const EmergencyChecklistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChecklistController controller = ChecklistController.instance;
    final TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: DColors.primary,
        title: const Text('Emergency Checklist', style: TextStyle(color: DColors.lightText)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      hintText: 'Add an item',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (textController.text.isNotEmpty) {
                      controller
                          .addChecklistItem(textController.text); // Add item
                      textController.clear(); // Clear input
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              // Observe changes in the checklist
              return ListView.builder(
                itemCount: controller.checklist.length,
                itemBuilder: (context, index) {
                  final item = controller.checklist[index];
                  return ListTile(
                    leading: Checkbox(
                      value: item['isChecked'],
                      onChanged: (value) {
                        controller.toggleChecklistItem(index); // Toggle status
                      },
                    ),
                    title: Text(
                      item['title'],
                      style: TextStyle(
                        decoration: item['isChecked']
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline_outlined, color: DColors.redAlert),
                      onPressed: () {
                        controller.removeChecklistItem(index); // Remove item
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
