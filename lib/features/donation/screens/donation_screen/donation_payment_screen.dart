import 'package:disaster_shield_bd/features/donation/controllers/payment_controller.dart';
import 'package:disaster_shield_bd/features/donation/screens/donation_screen/sslcommerz_pay_info_screen.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationPaymentScreen extends StatelessWidget {

  const DonationPaymentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final amountController = TextEditingController();
    final paymentFormKey = GlobalKey<FormState>();
    final paymentController = Get.put(PaymentController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: DColors.primary,
        title: const Text("Donate"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Expanded(
              child: Form(
                key: paymentFormKey,
                child: Column(
                  children: [
                    const Text(
                      "Enter Donation Amount",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (value) => DValidator.validateEmptiTextField("amount", value),
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter amount (e.g., 500 BDT)",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: DDeviceUtils.getScreenWidth(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 54),
                  child: ElevatedButton(
                    onPressed: () {
                      if (paymentFormKey.currentState!.validate()) {
                        paymentController.amount.value = double.parse(amountController.text.trim());
                        Get.to(() => const SslcommerzPayInfoScreen());
                      }
                      return;
                    },
                    child: const Text("Proceed to Payment"),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

