import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/hotline_controller.dart';

class HotlineScreen extends StatelessWidget {

  const HotlineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HotlineController controller = Get.put(HotlineController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DColors.primary,
        title: const Text("Emergency Hotlines"),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: controller.hotlines.length,
          itemBuilder: (context, index) {
            final hotline = controller.hotlines[index];
            return Card(
              color: DColors.light,
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  hotline["Service"]!,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  hotline["Hotline"]!,
                  style: const TextStyle(fontSize: 14),
                ),
                trailing: IconButton(
                  onPressed: () => controller.callHotline(hotline["Hotline"]!),
                  icon: const Icon(Icons.call, color: DColors.redAlert,),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
