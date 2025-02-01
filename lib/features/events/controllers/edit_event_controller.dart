import 'package:disaster_shield_bd/features/events/screens/events_screen_volunteer/volunteers_event_screen.dart';
import 'package:disaster_shield_bd/repository/event/event_repository.dart';
import 'package:disaster_shield_bd/utils/popups/confirm_popup.dart';
import 'package:disaster_shield_bd/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditEventController extends GetxController {
  static EditEventController get instance => Get.find();

  final eventName = TextEditingController();
  final eventDescription = TextEditingController();
  final eventDate = TextEditingController();
  final eventTime = TextEditingController();
  final eventLoaction = TextEditingController();
  final eventUpdateFormKey = GlobalKey<FormState>();
  final eventRepository = Get.put(EventRepository());

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

  Future<void> updateEvent(String docId) async{
    try {
      FullScreenLoader.openLoadingDialog("Updating your information");

      if (!eventUpdateFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> updatedEvent = {
        "Event name": eventName.text.trim(),
        "Event description": eventDescription.text.trim(),
        "Event date": eventDate.text.trim(),
        "Event time": eventTime.text.trim(),
        "Event location": eventLoaction.text.trim(),
      };
      await eventRepository.updateEventtoDB(docId, updatedEvent);

      FullScreenLoader.stopLoading();

      Get.snackbar("Success", "Event updated successfully");

      Get.off(() => const VolunteersEventScreen());

    } catch (e) {
      FullScreenLoader.stopLoading();
      Get.snackbar("Error", "Something went wrong");
    }

  }

  Future<void> deletEvent(String docId) async {
    try {
      ConfirmPopup.showConfirmPopup(
          "Warning",
          "This will permanently delete the event",
              () async {FullScreenLoader.openLoadingDialog("Deleting event");
          await eventRepository.deleteEventFromDB(docId);
          FullScreenLoader.stopLoading();
          Get.off(() => const VolunteersEventScreen());
          },
              () {Navigator.of(Get.overlayContext!).pop();
          return;});
    } catch (e) {
      FullScreenLoader.stopLoading();
      Get.snackbar("Error", "Something went wrong");
    }
  }
}
