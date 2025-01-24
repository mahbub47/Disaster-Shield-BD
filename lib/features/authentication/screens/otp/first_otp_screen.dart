import 'package:disaster_shield_bd/features/authentication/controllers/otp/phone_controller.dart';
import 'package:disaster_shield_bd/features/authentication/screens/login_with_email/login_with_email_screen.dart';
import 'package:disaster_shield_bd/features/authentication/screens/otp/widgets/otp_phone_label.dart';
import 'package:disaster_shield_bd/features/authentication/screens/user_details/user_details_screen.dart';
import 'package:disaster_shield_bd/utils/constants/images.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:disaster_shield_bd/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstOtpScreen extends StatelessWidget {
  const FirstOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhoneController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Form(
          key: controller.phoneAuthFormKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: DDeviceUtils.getAppBarHeight() + 10),
                child: Image(
                    width: DDeviceUtils.getScreenWidth() * 0.65,
                    image: const AssetImage(Dimages.phoneNumberScreenImage)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: DSizes.spaceBtwSection),
                child: TextFormField(
                  validator: (value) => DValidator.validatePhoneNumber(value),
                  controller: controller.phone,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Enter phone number",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      child: Text(
                        "+880",
                        style: DTextTheme.lightTextTheme.labelLarge,
                      ),
                    ),
                  ),
                )),
              const SizedBox(
                height: DSizes.spaceBtwItems,
              ),
              const OTPPhoneLabel(),
            ],
          ),
        ),
        Positioned(
          bottom: DDeviceUtils.getBottomNavigationBarHeight() + 30,
          child: SizedBox(
            width: DDeviceUtils.getScreenWidth(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 56),
              child: ElevatedButton(
                onPressed: () {
                  String phoneN = controller.phone.text.trim();
                  PhoneController.instance.phoneAuthentication('+880$phoneN');
                },
                  child: const Text("Get OTP")),
            ))),
        Positioned(
            bottom: DDeviceUtils.getBottomNavigationBarHeight() - 20,
            child: SizedBox(
              width: DDeviceUtils.getScreenWidth(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextButton(
                    onPressed: () { Get.to(() => const LoginWithEmailScreen());},
                    child: Text(
                      "Login with email and password",
                      style: DTextTheme.lightTextTheme.labelSmall,
                    )),
              ),
            ))
      ]),
    );
  }
}
