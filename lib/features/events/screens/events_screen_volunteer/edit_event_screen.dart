import 'package:disaster_shield_bd/features/events/controllers/edit_event_controller.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditEventScreen extends StatelessWidget {
  final eventID;
  String eventName;
  String eventDescription;
  String eventDate;
  String eventTime;
  String eventLocation;

  EditEventScreen(
      {super.key,
      required this.eventID,
      required this.eventName,
      required this.eventDescription,
      required this.eventLocation,
      required this.eventDate,
      required this.eventTime});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditEventController());
    controller.eventName.text = eventName;
    controller.eventDescription.text = eventDescription;
    controller.eventLoaction.text = eventLocation;
    controller.eventDate.text = eventDate;
    controller.eventTime.text = eventTime;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: DColors.primary,
        title: const Text('Create Event'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: DDeviceUtils.getScreenHeight() -
                  DDeviceUtils.getScreenHeight() * 0.25,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: controller.eventUpdateFormKey,
                    child: Column(
                      children: [
                        // Event Name
                        TextFormField(
                          controller: controller.eventName,
                          decoration: const InputDecoration(
                            hintText: 'Enter the event name',
                          ),
                          validator: (value) =>
                              DValidator.validateEmptiTextField(
                                  "Event name", value),
                        ),
                        const SizedBox(height: 16),

                        // Event Description
                        TextFormField(
                          controller: controller.eventDescription,
                          maxLines: 4,
                          decoration: const InputDecoration(
                            hintText: 'Enter a brief description of the event',
                          ),
                          validator: (value) =>
                              DValidator.validateEmptiTextField(
                                  "Event description", value),
                        ),
                        const SizedBox(height: 16),

                        // Event Date
                        TextFormField(
                          controller: controller.eventDate,
                          readOnly: true,
                          decoration: const InputDecoration(
                            hintText: 'Select the event date',
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                          onTap: () {
                            controller.selectEventDate(context);
                          },
                          validator: (value) =>
                              DValidator.validateEmptiTextField(
                                  "Event date", value),
                        ),
                        const SizedBox(height: 16),

                        // Event Time
                        TextFormField(
                          controller: controller.eventTime,
                          readOnly: true,
                          decoration: const InputDecoration(
                            hintText: 'Select the event time',
                            suffixIcon: Icon(Icons.access_time),
                          ),
                          onTap: () {
                            controller.selectEventTime(context);
                          },
                          validator: (value) =>
                              DValidator.validateEmptiTextField(
                                  "Event time", value),
                        ),
                        const SizedBox(height: 16),

                        // Event Location
                        TextFormField(
                            controller: controller.eventLoaction,
                            decoration: const InputDecoration(
                              hintText: 'Enter the event location',
                            ),
                            validator: (value) =>
                                DValidator.validateEmptiTextField(
                                    "Event location", value)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: DDeviceUtils.getScreenWidth(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 56),
                child: ElevatedButton(
                  onPressed: () {
                    controller.updateEvent(eventID);
                  },
                  child: const Text('Update'),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  controller.deletEvent(eventID);
                },
                child: const Text(
                  "Delete",
                  style: TextStyle(color: DColors.redAlert),
                ))
          ],
        ),
      ),
    );
  }
}
