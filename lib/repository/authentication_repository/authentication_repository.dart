import 'package:disaster_shield_bd/features/authentication/screens/login_with_email/login_with_email_screen.dart';
import 'package:disaster_shield_bd/features/authentication/screens/onboarding/welcome_screen.dart';
import 'package:disaster_shield_bd/features/bottom_navigation/navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AthenticationRepository extends GetxController {
  static AthenticationRepository get instance => Get.find();

  //Local storage initialization
  final deviceStorage = GetStorage();

  //Firebase instance initialization
  final _auth = FirebaseAuth.instance;
  RxString verificationid = ''.obs;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    setScreen();
  }


  //Screen redirect method
  setScreen() {
    deviceStorage.writeIfNull('isFirstTime', true);
    final user = _auth.currentUser;

    if (user != null) {
      Get.offAll(() => const BottomNavigationMenu());
    } else {
      deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginWithEmailScreen())
        : Get.offAll(() => const WelcomeScreen());
    }
  }


  //Phone number authetication method
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


  //OTP varification method
  Future<bool> verifyOtp(String otp) async {
    var credential = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationid.value, smsCode: otp));

    return credential.user != null ? true : false;
  }

  //Phone authentication logout
  Future<void> logout() async {
    await _auth.signOut();
  }


  //Register with Email and Password
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(_) {
      throw "Firebase Auth Exception";
    } on FirebaseException catch(_) {
      throw "Firebase Exception";
    } on FormatException catch(_){
      throw "Format Exception";
    } on PlatformException catch (_){
      throw "Platform Exception";
    } catch (_){
      throw "Something went wrong";
    }
  }

  //Login with email and password
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(_) {
      throw "Firebase Auth Exception";
    } on FirebaseException catch(_) {
      throw "Firebase Exception";
    } on FormatException catch(_){
      throw "Format Exception";
    } on PlatformException catch(_) {
      throw "Platform Exception";
    } catch (_) {
      throw "Something went wrong";
    }
  }
}
