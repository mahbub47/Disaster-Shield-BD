import 'package:disaster_shield_bd/features/donation/screens/donation_reciever_screen/donation_reciever_screen.dart';
import 'package:disaster_shield_bd/features/donation/screens/donor/donor_screen.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationMainScreen extends StatelessWidget {
  const DonationMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DColors.primary,
        title: const Text("Donation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 260,
                child: Card(
                  color: DColors.light,
                  elevation: 5,
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      const Image(
                        image: AssetImage(Dimages.recieverImage),
                        width: 160,
                      ),
                      ElevatedButton(
                          onPressed: () {Get.to(() => const DonationRecieverScreen());},
                          style: const ButtonStyle(
                              padding: WidgetStatePropertyAll(
                                  EdgeInsets.symmetric(horizontal: 40))),
                          child: const Text("Receiver")),
                      const SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 260,
                child: Card(
                  color: DColors.light,
                  elevation: 5,
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      const Image(
                        image: AssetImage(Dimages.donorImage),
                        width: 160,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Get.to(() => const DonorScreen());
                          },
                          style: const ButtonStyle(
                              padding: WidgetStatePropertyAll(
                                  EdgeInsets.symmetric(horizontal: 40))),
                          child: const Text("Donor")),
                      const SizedBox(height: 20,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
