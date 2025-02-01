import 'package:disaster_shield_bd/features/events/controllers/add_event_controller.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEventScreen extends StatelessWidget {

  AddEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddEventController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DColors.primary,
        title: const Text('Create Event'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: DDeviceUtils.getScreenHeight() - 200,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: controller.eventAddFormKey,
                    child: Column(
                      children: [
                        // Event Name
                        TextFormField(
                          controller: controller.eventName,
                          decoration: const InputDecoration(
                            hintText: 'Enter the event name',
                          ),
                          validator: (value) => DValidator.validateEmptiTextField("Event name", value),
                        ),
                        const SizedBox(height: 16),
                
                        // Event Description
                        TextFormField(
                          controller: controller.eventDescription,
                          maxLines: 4,
                          decoration: const InputDecoration(
                            hintText: 'Enter a brief description of the event',
                          ),
                          validator: (value) => DValidator.validateEmptiTextField("Event description", value),
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
                          validator: (value) => DValidator.validateEmptiTextField("Event date", value),
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
                          validator: (value) => DValidator.validateEmptiTextField("Event time", value),
                        ),
                        const SizedBox(height: 16),
                
                        // Event Location
                        TextFormField(
                          controller: controller.eventLoaction,
                          decoration: const InputDecoration(
                            hintText: 'Enter the event location',
                          ),
                          validator: (value) => DValidator.validateEmptiTextField("Event location", value)
                        ),
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
                    controller.addEvent();
                  },
                  child: const Text('Create Event'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
