import 'package:disaster_shield_bd/features/authentication/screens/user_details/widgets/user_details_submit_button.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:disaster_shield_bd/utils/constants/text_string.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: DSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: Text(
                    DText.userDetailsScreenTitle,
                    style: DTextTheme.lightTextTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Full name",
                  style: DTextTheme.lightTextTheme.labelMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                const TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: "Full name",
                        hintStyle:
                            TextStyle(fontSize: 12, color: DColors.gray))),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Location",
                  style: DTextTheme.lightTextTheme.labelMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                const TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: "Select Division",
                        hintStyle:
                            TextStyle(fontSize: 12, color: DColors.gray))),
                const SizedBox(
                  height: 15,
                ),
                const TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: "Select District",
                        hintStyle:
                            TextStyle(fontSize: 12, color: DColors.gray))),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Address",
                  style: DTextTheme.lightTextTheme.labelMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                const TextField(
                    maxLines: 3,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                        hintText: "Enter address",
                        hintStyle:
                            TextStyle(fontSize: 12, color: DColors.gray))),
              ],
            ),
          ),
          const UserDetailsSubmitButton()
        ],
      ),
    );
  }
}

