import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmPopup {
  static showConfirmPopup(String title, String content, VoidCallback confirm, VoidCallback cancel) {
    showDialog(
      barrierDismissible: false,
        context: Get.overlayContext!,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Text(content),
          actions: [
            TextButton(onPressed: confirm, child: const Text("Confirm")),
            TextButton(onPressed: cancel, child: const Text("Cancel"))
          ],
            ));
  }
}
