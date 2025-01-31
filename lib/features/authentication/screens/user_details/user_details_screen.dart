import 'package:disaster_shield_bd/features/authentication/controllers/user_details/user_details_controller.dart';
import 'package:disaster_shield_bd/features/authentication/screens/user_details/widgets/user_details_submit_button.dart';
import 'package:disaster_shield_bd/features/authentication/screens/user_details/widgets/user_information_form.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserDetailsController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: DDeviceUtils.getScreenHeight() - DDeviceUtils.getScreenHeight() * 0.12,
              child: const SingleChildScrollView(
                child: UserInformationFormWidget(),
              ),
            ),
            UserDetailsSubmitButton(),
          ],
        )
      ),
    );
  }
}

