import 'package:disaster_shield_bd/features/authentication/controllers/otp/phone_controller.dart';
import 'package:disaster_shield_bd/features/authentication/screens/otp/second_otp_screen.dart';
import 'package:disaster_shield_bd/features/authentication/screens/otp/widgets/otp_phone_label.dart';
import 'package:disaster_shield_bd/utils/constants/images.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstOtpScreen extends StatelessWidget {
  const FirstOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhoneController());
    final formkey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Form(
          key: formkey,
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
            bottom: DDeviceUtils.getBottomNavigationBarHeight() + 10,
            child: SizedBox(
                width: DDeviceUtils.getScreenWidth(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56),
                  child: ElevatedButton(
                      onPressed: () {
                        if(formkey.currentState!.validate()){
                          PhoneController.instance.phoneAuthentication(controller.phone.text.trim());
                          Get.to(() => const SecondOtpScreen());
                        }
                      },
                      child: const Text("Get OTP")),
                )))
      ]),
    );
  }
}
