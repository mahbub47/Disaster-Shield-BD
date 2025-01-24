import 'package:disaster_shield_bd/features/authentication/controllers/user_details/user_details_controller.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:disaster_shield_bd/utils/constants/text_string.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:disaster_shield_bd/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserInformationFormWidget extends StatelessWidget {
  const UserInformationFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserDetailsController.instance;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DSizes.defaultSpace),
      child: Form(
        key: controller.userDetailsFormkey,
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
            TextFormField(
                validator: (value) =>
                    DValidator.validateEmptiTextField("Full name", value),
                controller: controller.username,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.user,
                      color: DColors.gray,
                    ),
                    hintText: "Full name",
                    hintStyle: TextStyle(fontSize: 12, color: DColors.gray))),
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
            TextFormField(
                validator: (value) =>
                    DValidator.validateEmptiTextField("Division", value),
                controller: controller.division,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.map,
                      color: DColors.gray,
                    ),
                    hintText: "Select Division",
                    hintStyle: TextStyle(fontSize: 12, color: DColors.gray))),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                validator: (value) =>
                    DValidator.validateEmptiTextField("District", value),
                controller: controller.district,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.location),
                    hintText: "Select District",
                    hintStyle: TextStyle(fontSize: 12, color: DColors.gray))),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Email",
              style: DTextTheme.lightTextTheme.labelMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
                validator: (value) => DValidator.validateEmail(value),
                controller: controller.email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: DColors.gray,
                    ),
                    hintText: "Enter email",
                    hintStyle: TextStyle(fontSize: 12, color: DColors.gray))),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Password",
              style: DTextTheme.lightTextTheme.labelMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            Obx(
                () => TextFormField(
                  obscureText: controller.hidePass.value,
                  validator: (value) => DValidator.validatePassword(value),
                  controller: controller.password,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePass.value = !controller.hidePass.value,
                        icon: Icon(controller.hidePass.value ? Iconsax.eye_slash : Iconsax.eye),
                      ),
                      prefixIcon: const Icon(
                        Iconsax.password_check,
                        color: DColors.gray,
                      ),
                      hintText: "Enter password",
                      hintStyle: const TextStyle(fontSize: 12, color: DColors.gray))),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
