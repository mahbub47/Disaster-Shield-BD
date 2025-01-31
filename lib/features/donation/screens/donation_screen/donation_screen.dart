import 'package:disaster_shield_bd/features/donation/screens/donation_screen/donation_payment_screen.dart';
import 'package:disaster_shield_bd/features/donation/screens/donation_screen/widgets/info_item.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationScreen extends StatelessWidget {
  final String receiverName;
  final String incidentType;
  final String incidentDate;
  final String districtName;
  final String divisionName;
  final String bankName;
  final String bankAccountName;
  final String accountNumber;
  final String mobileBankingProvider;
  final String mobileBankingNumber;

  const DonationScreen({
    super.key,
    required this.receiverName,
    required this.incidentType,
    required this.incidentDate,
    // required this.imageList,
    required this.districtName,
    required this.divisionName,
    required this.bankName,
    required this.bankAccountName,
    required this.accountNumber,
    required this.mobileBankingProvider,
    required this.mobileBankingNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DColors.primary,
        title: const Text("Donation Details"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            // Receiver Details
            Card(
              color: DColors.light,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Receiver's Information",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    InfoItem(title: "Name",value:  receiverName),
                    InfoItem(title: "Incident Type",value: incidentType),
                    InfoItem(title: "Incident Date", value: incidentDate),
                    InfoItem( title: "District", value: districtName),
                    InfoItem( title: "Division",value: divisionName),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16.0),

            // Payment Details
            Card(
              color: DColors.light,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Payment Details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      "Bank Information",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4.0),
                    InfoItem(title:"Bank Name",value: bankName),
                    InfoItem(title:"Account Name",value: bankAccountName),
                    InfoItem(title:"Account Number",value: accountNumber),
                    const Divider(),
                    const Text(
                      "Mobile Banking",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4.0),
                    InfoItem(title: "Provider",value: mobileBankingProvider),
                    InfoItem(title: "Number", value: mobileBankingNumber),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: DDeviceUtils.getScreenWidth(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 56),
                child: ElevatedButton(onPressed: () {Get.to(() => DonationPaymentScreen());}, child: const Text("Donate")),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

}
