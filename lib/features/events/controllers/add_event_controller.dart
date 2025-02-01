import 'package:disaster_shield_bd/features/bottom_navigation/navigation_bar.dart';
import 'package:disaster_shield_bd/features/events/models/event_model.dart';
import 'package:disaster_shield_bd/repository/authentication_repository/authentication_repository.dart';
import 'package:disaster_shield_bd/repository/event/event_repository.dart';
import 'package:disaster_shield_bd/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEventController extends GetxController {
  static AddEventController get instance => Get.find();

  final eventName = TextEditingController();
  final eventDescription = TextEditingController();
  final eventDate = TextEditingController();
  final eventTime = TextEditingController();
  final eventLoaction = TextEditingController();
  final eventAddFormKey = GlobalKey<FormState>();
  final eventRepository = Get.put(EventRepository());

  Future<void> addEvent() async {
    try {
      FullScreenLoader.openLoadingDialog("Loading");

      if (!eventAddFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      final userId = AthenticationRepository.instance.authUser!.uid;

      final newEvent = EventModel(id: userId,
          eventName: eventName.text.trim(),
          eventDescription: eventDescription.text.trim(),
          eventDate: eventDate.text.trim(),
          eventTime: eventTime.text.trim(),
          eventLocation: eventLoaction.text.trim(),
          interestCount: 0,
          goingCount: 0);

      await eventRepository.addEventToDB(newEvent);


      FullScreenLoader.stopLoading();

      Get.snackbar("Success", "Your request will be reviewed shortly");

      Get.off(() => const BottomNavigationMenu());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Get.snackbar("Something went wrong", e.toString());
    }
  }

  Future<void> selectEventDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      eventDate.text = pickedDate.toString().split(' ')[0];
    }
  }

  Future<void> selectEventTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      eventTime.text = pickedTime.format(context);
    }
  }
}
