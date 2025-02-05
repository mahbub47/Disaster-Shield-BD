import 'package:disaster_shield_bd/common/widgets/common_bg_shape.dart';
import 'package:disaster_shield_bd/features/authentication/screens/login_with_email/login_with_email_screen.dart';
import 'package:disaster_shield_bd/features/donation/controllers/donation_controller.dart';
import 'package:disaster_shield_bd/features/emergency_checklist/controllers/emergency_checklist_controller.dart';
import 'package:disaster_shield_bd/features/home/controllers/delete_user_controller.dart';
import 'package:disaster_shield_bd/features/home/screens/my_donation_request.dart';
import 'package:disaster_shield_bd/features/home/screens/update_emergency_contact_screen.dart';
import 'package:disaster_shield_bd/features/home/screens/update_location_screen.dart';
import 'package:disaster_shield_bd/features/home/screens/volunteer_registration_screen.dart';
import 'package:disaster_shield_bd/features/home/screens/widgets/drawer_item_widget.dart';
import 'package:disaster_shield_bd/features/home/screens/widgets/drawer_profile_widget.dart';
import 'package:disaster_shield_bd/features/home/screens/widgets/home_screen_features_box.dart';
import 'package:disaster_shield_bd/features/home/screens/widgets/home_screen_main_image.dart';
import 'package:disaster_shield_bd/features/home/screens/widgets/home_screen_temp_widget.dart';
import 'package:disaster_shield_bd/repository/authentication_repository/authentication_repository.dart';
import 'package:disaster_shield_bd/repository/donation/donation_repository.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../user_information/controllers/user_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    final checklistController = ChecklistController.instance;
    Get.put(DonationRepository());
    final deleteUserController = Get.put(DeleteUserController());
    final donationController = Get.put(DonationController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: DColors.primary,
        title: Text(
          "D S B D",
          style: DTextTheme.lightTextTheme.headlineLarge!
              .apply(color: DColors.lightText),
        ),
      ),
      body: SizedBox(
        height: DDeviceUtils.getScreenHeight(),
        width: DDeviceUtils.getScreenWidth(),
        child:  const Stack(
          children: [
            CommonBGShape(),
            HomeScreenTempWidget(),
            HomeScreenFeaturesBox(),
            HomeScreenMainImage()
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: DColors.light,
        shape: const BeveledRectangleBorder(),
        child: Padding(
          padding: EdgeInsets.only(top: DDeviceUtils.getAppBarHeight()),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const DrawerProfileWidget(),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      DrawerItemWidget(
                        icon: Iconsax.call,
                        label: "Emergency contact",
                        ontap: () {
                          Get.to(() => const UpdateEmergencyContactScreen());
                        },
                      ),
                      DrawerItemWidget(
                        icon: Iconsax.location,
                        label: "Location",
                        ontap: () {
                          Get.to(() => const UpdateLocationScreen());
                        },
                      ),
                      DrawerItemWidget(
                        icon: Icons.handshake_outlined,
                        label: "Become a volunteer",
                        ontap: () {
                          Get.to(() => const VolunteerRegistrationScreen());
                        },
                      ),
                      DrawerItemWidget(
                        color: DColors.redAlert,
                        icon: Iconsax.card,
                        label: "My Donation Request",
                        ontap: () {
                          Get.to(() =>
                              MyDonationRequest(
                                  receiverName: donationController.myReq.value
                                      .receiverName,
                                  incidentType: donationController.myReq.value
                                      .incidentType,
                                  incidentDate: donationController.myReq.value
                                      .incidentDate,
                                  districtName: donationController.myReq.value
                                      .userDistrict,
                                  divisionName: donationController.myReq.value
                                      .userDivision,
                                  bankName: donationController.myReq.value
                                      .bankName,
                                  bankAccountName: donationController.myReq.value
                                      .bankAccountName,
                                  accountNumber: donationController.myReq.value
                                      .bankAccountNo,
                                  mobileBankingProvider: donationController.myReq.value
                                      .mobileBankingName,
                                  mobileBankingNumber: donationController.myReq.value
                                      .mobileBankingPhone));
                        },
                      ),
                      const Divider(),
                      DrawerItemWidget(
                        icon: Iconsax.logout,
                        label: "Logout",
                        ontap: () {
                          AthenticationRepository.instance.logout();
                          checklistController.resetChecklistToDefault();
                          Get.offAll(() => const LoginWithEmailScreen());
                        },
                      ),
                      DrawerItemWidget(
                        color: DColors.redAlert,
                        icon: Iconsax.profile_delete,
                        label: "Delete account",
                        ontap: () {
                          deleteUserController.deletUser();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
