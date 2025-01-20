import 'package:disaster_shield_bd/features/authentication/screens/user_details/user_details_screen.dart';
import 'package:disaster_shield_bd/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.find();

  Future<void> verifyOtp(String otp) async {
    var isVerified = await AthenticationRepository.instance.verifyOtp(otp);
    isVerified ? Get.offAll(() => const UserDetailsScreen()) : Get.back();
  }
}