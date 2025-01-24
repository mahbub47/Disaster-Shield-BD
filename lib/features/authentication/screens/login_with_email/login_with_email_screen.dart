import 'package:disaster_shield_bd/utils/constants/images.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/validator/validator.dart';
import 'package:flutter/material.dart';

class LoginWithEmailScreen extends StatelessWidget {
  const LoginWithEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: DDeviceUtils.getAppBarHeight() + 10),
                child: Center(
                  child: Image(
                      width: DDeviceUtils.getScreenWidth() * 0.65,
                      image: const AssetImage(Dimages.loginScreenImage)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: DSizes.spaceBtwSection),
                child: Text("Email"),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: DSizes.spaceBtwSection),
                  child: TextFormField(
                    validator: (value) => DValidator.validatePhoneNumber(value),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Enter email",
                    ),
                  )),
              const SizedBox(
                height: DSizes.spaceBtwItems,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: DSizes.spaceBtwSection),
                child: Text("Password"),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: DSizes.spaceBtwSection),
                  child: TextFormField(
                    validator: (value) => DValidator.validatePhoneNumber(value),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Enter password",
                    ),
                  )),
              const SizedBox(
                height: DSizes.spaceBtwItems,
              ),
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
                      onPressed: () {},
                      child: const Text("Login")),
                ))),
      ]),
    );;
  }
}
