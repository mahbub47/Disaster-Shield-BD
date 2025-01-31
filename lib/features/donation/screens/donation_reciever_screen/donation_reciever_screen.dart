import 'package:disaster_shield_bd/features/donation/controllers/donation_receiver_controller.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationRecieverScreen extends StatelessWidget {
  const DonationRecieverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DonationReceiverController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: DColors.primary,
        title: const Text("Request Donation"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: DDeviceUtils.getScreenHeight() - DDeviceUtils.getBottomNavigationBarHeight()*4,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: DSizes.defaultSpace),
                  child: Form(
                    key: controller.receiverFormkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: DSizes.defaultSpace,
                        ),
                        const Text(
                          "Reciever Name",
                          style: TextStyle(
                              fontSize: 14,
                              color: DColors.darkText,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) => DValidator.validateEmptiTextField("Receiver name", value),
                          keyboardType: TextInputType.name,
                          controller: controller.receiverName,
                          decoration: const InputDecoration(
                            hintText: "Enter Reciever name",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Incident type",
                          style: TextStyle(
                              fontSize: 14,
                              color: DColors.darkText,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) => DValidator.validateEmptiTextField("Incident type", value),
                          keyboardType: TextInputType.name,
                          controller: controller.incidentType,
                          decoration: const InputDecoration(
                            hintText: "Enter incident type",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Receiver's NID",
                          style: TextStyle(
                              fontSize: 14,
                              color: DColors.darkText,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (value) => DValidator.validateNID(value),
                          controller: controller.receiverNid,
                          decoration: const InputDecoration(
                            hintText: "Enter Receiver's NID ",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Incident date",
                          style: TextStyle(
                              fontSize: 14,
                              color: DColors.darkText,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) => DValidator.validateEmptiTextField("Incident date", value),
                          controller: controller.incidentDate,
                          decoration: const InputDecoration(
                            hintText: "Select date",
                            prefixIcon: Icon(Icons.calendar_month_outlined),
                          ),
                          readOnly: true,
                          onTap: () {
                            controller.selectDate(context);
                          },
                        ),
                        Obx(() {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Upload Pictures (Max: 5)",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: DColors.darkText,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton.icon(
                                      onPressed: () async {
                                        controller.addPicture();
                                      },
                                      icon: const Icon(Icons.add_photo_alternate),
                                      label: const Text("Add Picture"),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Text("${controller.imageFiles.length}/5"),
                                ],
                              ),
                              const SizedBox(height: 16),
            
                              // Show Uploaded Images
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: controller.imageFiles.map((file) {
                                  return Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Image.file(
                                        file,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                        top: -10,
                                        right: -10,
                                        child: IconButton(
                                          icon: const Icon(Icons.cancel,
                                              color: DColors.redAlert),
                                          onPressed: () {
                                            controller.imageFiles.remove(file);
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ],
                          );
                        }),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Center(
                          child: Text(
                            "Bank details",
                            style: TextStyle(
                                fontSize: 18,
                                color: DColors.darkText,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Text(
                          "Bank name",
                          style: TextStyle(
                              fontSize: 14,
                              color: DColors.darkText,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) => DValidator.validateEmptiTextField("Bank name", value),
                          keyboardType: TextInputType.name,
                          controller: controller.bankName,
                          decoration: const InputDecoration(
                            hintText: "Enter Bank name ",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Account name",
                          style: TextStyle(
                              fontSize: 14,
                              color: DColors.darkText,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) => DValidator.validateEmptiTextField("Account name", value),
                          controller: controller.accountName,
                          decoration: const InputDecoration(
                            hintText: "Enter account name ",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Account number",
                          style: TextStyle(
                              fontSize: 14,
                              color: DColors.darkText,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) => DValidator.validateEmptiTextField("Account number", value),
                          keyboardType: TextInputType.number,
                          controller: controller.accountNumber,
                          decoration: const InputDecoration(
                            hintText: "Enter account number ",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Center(
                          child: Text(
                            "Mobile Banking",
                            style: TextStyle(
                                fontSize: 18,
                                color: DColors.darkText,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          "Service provider",
                          style: TextStyle(
                              fontSize: 14,
                              color: DColors.darkText,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) => DValidator.validateEmptiTextField("Mobile banking service", value),
                          keyboardType: TextInputType.name,
                          controller: controller.mobileBanking,
                          decoration: const InputDecoration(
                            hintText: "Enter marchent name ",
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          "Phone",
                          style: TextStyle(
                              fontSize: 14,
                              color: DColors.darkText,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) => DValidator.validatePhoneNumber(value),
                          keyboardType: TextInputType.phone,
                          controller: controller.mobileBankingPhone,
                          decoration: const InputDecoration(
                            hintText: "Enter phone number",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: DDeviceUtils.getScreenWidth(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56),
                  child: ElevatedButton(onPressed: () {
                    controller.donationRequest();
                  }, child: const Text("Request")),
                ))
          ],
        ),
      ),
    );
  }
}
