import 'package:disaster_shield_bd/features/authentication/models/user_model.dart';
import 'package:disaster_shield_bd/features/donation/models/donation_model.dart';
import 'package:disaster_shield_bd/repository/donation/donation_repository.dart';
import 'package:disaster_shield_bd/repository/user/user_repository.dart';
import 'package:get/get.dart';

class DonationController extends GetxController {
  static DonationController get instance => Get.find();
  Rx<DonationModel> myReq = DonationModel.empty().obs;
  final donationRepository = DonationRepository.instance;
  String get reqStatus => myReq.value.reqStatus;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecords();
  }

  Future<void> fetchUserRecords() async{
    try {
      final myRequest = await donationRepository.fetchDonationRequest();
      this.myReq(myRequest);
    } catch(e) {
      this.myReq(DonationModel.empty());
    }
  }
}
