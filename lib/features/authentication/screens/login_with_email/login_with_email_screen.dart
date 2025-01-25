import 'package:disaster_shield_bd/features/authentication/controllers/login/login_controller.dart';
import 'package:disaster_shield_bd/features/authentication/screens/user_details/user_details_screen.dart';
import 'package:disaster_shield_bd/utils/constants/images.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:disaster_shield_bd/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginWithEmailScreen extends StatelessWidget {
  const LoginWithEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Form(
          key: controller.loginFormKey,
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
                padding:
                    EdgeInsets.symmetric(horizontal: DSizes.spaceBtwSection),
                child: Text("Email"),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: DSizes.spaceBtwSection),
                  child: TextFormField(
                    controller: controller.email,
                    validator: (value) => DValidator.validateEmail(value),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: "Enter email",
                    ),
                  )),
              const SizedBox(
                height: DSizes.spaceBtwItems,
              ),
              const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: DSizes.spaceBtwSection),
                child: Text("Password"),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: DSizes.spaceBtwSection),
                  child: Obx(
                    () => TextFormField(
                      obscureText: controller.hidePass.value,
                      controller: controller.password,
                      validator: (value) =>
                          DValidator.validateEmptiTextField("Password", value),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                            onPressed: () => controller.hidePass.value =
                                !controller.hidePass.value,
                            icon: Icon(controller.hidePass.value ? Iconsax.eye_slash : Iconsax.eye)),
                        hintText: "Enter password",
                      ),
                    ),
                  )),
              const SizedBox(
                height: DSizes.spaceBtwItems,
              ),
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
                      onPressed: () => controller.login(), child: const Text("Login")),
                ))),
        Positioned(
            bottom: DDeviceUtils.getBottomNavigationBarHeight() - 20,
            child: SizedBox(
              width: DDeviceUtils.getScreenWidth(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextButton(
                    onPressed: () { Get.to(() => const UserDetailsScreen());},
                    child: Text(
                      "Do not have an account?Register",
                      style: DTextTheme.lightTextTheme.labelSmall,
                    )),
              ),
            ))
      ]),
    );
  }
}
