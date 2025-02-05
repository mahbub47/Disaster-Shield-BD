import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SendSmsController extends GetxController {
  static SendSmsController get instance => Get.find();

  Future<void> sendSMS(String phoneNumber, String message) async {
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: {'body': message},
    );

    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    } else {
      throw 'Could not launch SMS';
    }
  }
}
