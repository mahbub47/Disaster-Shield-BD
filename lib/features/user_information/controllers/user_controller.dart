import 'package:disaster_shield_bd/features/authentication/models/user_model.dart';
import 'package:disaster_shield_bd/repository/user/user_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = UserRepository.instance;
  String get userDistrict => user.value.district;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecords();
  }

  Future<void> fetchUserRecords() async{
    try {
      final user = await userRepository.fetchUserRecords();
      this.user(user);
    } catch(e) {
      this.user(UserModel.empty());
    }
  }
}
