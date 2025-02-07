import 'package:disaster_shield_bd/features/donation/screens/donor/donor_screen.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  static PaymentController get instance => Get.find();
  final amount = 100.00.obs;
  void sslCommerz() async {

    Sslcommerz sslcommerz = Sslcommerz(
        initializer: SSLCommerzInitialization(
            multi_card_name: "visa,master,bkash",
            currency: SSLCurrencyType.BDT,
            product_category: "Charity",
            sdkType: SSLCSdkType.TESTBOX,
            store_id: "disas67a5387c7dac8",
            store_passwd: "disas67a5387c7dac8@ssl",
            total_amount: amount.value,
            tran_id: "testTRX001"));

    final response = await sslcommerz.payNow();
    try {

      if (response.status == 'VALID') {
        Get.snackbar("Success", "Thank you for your contribution");
        Get.off(() => const DonorScreen());
      }

      if (response.status == 'Closed') {
        Get.snackbar("Closed", "Please continue further to confirm your contribution");
        Get.off(() => const DonorScreen());
      }

      if (response.status == 'FAILED') {
        Get.snackbar("Failed", "Something went wrong");
        Get.off(() => const DonorScreen());
      }

    } catch (e) {
      Get.snackbar("Oops", "Server busy");
      Get.off(() => const DonorScreen());
    }

  }
}
