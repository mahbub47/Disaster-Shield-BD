import 'package:disaster_shield_bd/features/authentication/controllers/user_details/user_details_controller.dart';
import 'package:disaster_shield_bd/features/authentication/screens/user_details/widgets/user_details_submit_button.dart';
import 'package:disaster_shield_bd/features/authentication/screens/user_details/widgets/user_information_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserDetailsController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const UserInformationFormWidget(),
          UserDetailsSubmitButton(),
        ],
      ),
    );
  }
}

