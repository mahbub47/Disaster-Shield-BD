import 'package:disaster_shield_bd/features/authentication/screens/onboarding/welcome_screen.dart';
import 'package:disaster_shield_bd/features/authentication/screens/user_details/user_details_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AthenticationRepository extends GetxController {
  static AthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setScreen);
  }

  _setScreen(User? user) {
    user == null ? Get.offAll(() => const WelcomeScreen()) : Get.offAll(() => const UserDetailsScreen());
  }
}