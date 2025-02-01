import 'dart:io';
import 'package:disaster_shield_bd/features/donation/controllers/donor_controller.dart';
import 'package:disaster_shield_bd/features/donation/screens/donation_screen/donation_screen.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonorScreen extends StatelessWidget {
  const DonorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DonorController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: DColors.primary,
          title: const Text("Donate"),
        ),
        body: Obx(() {
          if (controller.requests.isEmpty) {
            return const Center(
                child: CircularProgressIndicator(
                  color: DColors.primary,
                ));
          }
          return Padding(
            padding: const EdgeInsets.all(18),
            child: ListView.builder(
              itemCount: controller.requests.length,
              itemBuilder: (context, index) {
                final request = controller.requests[index];

                return Card(
                  elevation: 10,
                  color: DColors.light,
                  child: ListTile(
                    title: Text(
                      request["Receiver name"] ?? "",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: DColors.darkText),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Incident: ${request["Incident type"] ?? ""}"),
                        Text(
                            "Location: ${request["User district"] ??
                                ""}, ${request["User division"]}"),
                        Text("Date: ${request["Incident date"] ?? ""}"),
                        const SizedBox(height: 20,),
                        const Center(
                          child: Text(
                            "View details",
                            style: TextStyle(
                                color: DColors.primary,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(height: 10,),
                      ],
                    ),
                    onTap: () {
                      Get.to(() => DonationScreen(
                          receiverName: request['Receiver name'] ?? "",
                          incidentType: request['Incident type'] ?? "",
                          incidentDate: request['Incident date'] ?? "",
                          districtName: request['User district'] ?? "",
                          divisionName: request['User division'] ?? "",
                          bankName: request['Bank name'] ?? "",
                          bankAccountName: request['Account name'] ?? "",
                          accountNumber: request['Account no'] ?? "",
                          mobileBankingProvider: request['Mobile banking'] ?? "",
                          mobileBankingNumber: request['Mobile banking phone'] ?? ""));
                    },
                  ),
                );
              },
            ),
          );
        }));
  }
}
