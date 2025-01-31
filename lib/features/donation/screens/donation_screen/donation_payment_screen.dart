import 'package:disaster_shield_bd/features/donation/controllers/donation_payment_controller.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationPaymentScreen extends StatelessWidget {

  DonationPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DonationPaymentController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DColors.primary,
        title: const Text("Donate"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter Donation Amount",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: controller.amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter amount",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: Icon(Icons.payment)
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String amount = controller.amountController.text.trim();
                  if (amount.isNotEmpty) {
                    controller.showConfirmationDialog(amount);
                  } else {
                    Get.snackbar("Error", "please enter amount");
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 12.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text("Confirm Donation"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
