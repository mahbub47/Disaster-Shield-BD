import 'package:disaster_shield_bd/features/authentication/screens/onboarding/welcome_screen.dart';
import 'package:disaster_shield_bd/features/authentication/screens/otp/first_otp_screen.dart';
import 'package:disaster_shield_bd/features/bottom_navigation/navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AthenticationRepository extends GetxController {
  static AthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  RxString verificationid = ''.obs;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setScreen);
  }

  _setScreen(User? user) {
    deviceStorage.writeIfNull('isFirstTime', true);
    user == null
        ? deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const FirstOtpScreen())
        : Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const BottomNavigationMenu());
  }

  Future<void> phonenumberAuthentication(String phone) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verficationid, resendToken) {
        verificationid.value = verficationid;
      },
      codeAutoRetrievalTimeout: (verificationid) {
        this.verificationid.value = verificationid;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'invalid phone number');
        } else {
          Get.snackbar('Error', 'Something went wrong');
        }
      },
    );
  }

  Future<bool> verifyOtp(String otp) async {
    var credential = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationid.value, smsCode: otp));

    return credential.user != null ? true : false;
  }

  Future<void> logout() async {
    deviceStorage.write('isFirstTime', true);
    await _auth.signOut();
  }
}
