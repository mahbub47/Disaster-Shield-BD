import 'package:disaster_shield_bd/features/donation/controllers/payment_controller.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SslcommerzPayInfoScreen extends StatelessWidget {
  const SslcommerzPayInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: DColors.primary,
        title: const Text("SSL Payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.network("https://apps.odoo.com/web/image/loempia.module/193670/icon_image?unique=c301a64", height: 100),
                  const SizedBox(height: 10),
                  const Text(
                    "SSL Payment Gateway",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Why SSL?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "SSL is a secure and trusted payment gateway in Bangladesh. It allows you to make payments easily and safely for various purposes.",
            ),
            const SizedBox(height: 20),
            const Text(
              "How it Works:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "1. Click on 'Pay Now' to start the payment process.\n"
                  "2. Enter your payment details in the secure SSL portal.\n"
                  "3. Complete the transaction and return to the app for confirmation.",
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                width: DDeviceUtils.getScreenWidth(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 54),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.sslCommerz();
                    },
                    child: const Text("Pay Now"),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24,),
          ],
        ),
      ),
    );
  }
}