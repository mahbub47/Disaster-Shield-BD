import 'package:disaster_shield_bd/features/donation/screens/donor/donor_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationPaymentController extends GetxController {
  static DonationPaymentController get instance => Get.find();

  final TextEditingController amountController = TextEditingController();

  void showConfirmationDialog(String amount) {
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Donation"),
        content: Text("Are you sure you want to donate ${amount}?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.snackbar("Donated", "Thank you for your contribution");
              Navigator.of(context).pop();
              Get.off(() => const DonorScreen());
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }
}