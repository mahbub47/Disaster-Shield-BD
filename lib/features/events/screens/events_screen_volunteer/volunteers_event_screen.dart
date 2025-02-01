import 'package:disaster_shield_bd/features/events/controllers/event_list_controller.dart';
import 'package:disaster_shield_bd/features/events/screens/events_screen_volunteer/add_event_screen.dart';
import 'package:disaster_shield_bd/features/events/screens/events_screen_volunteer/edit_event_screen.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VolunteersEventScreen extends StatelessWidget {
  const VolunteersEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eventsListController = Get.put(EventListController());
    eventsListController.fetchRole();
    eventsListController.fetchMyEvents();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DColors.primary,
        title: const Text('My events'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: eventsListController.myEvents.length,
          itemBuilder: (context, index) {
            var event = eventsListController.myEvents[index];
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                tileColor: DColors.accent.withOpacity(0.5),
                title: Text(event['Event name']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(event['Event description']),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(event['Event location']),
                    Text(event['Event date']),
                    Text(event['Event time'])
                  ],
                ),
                onTap: () {
                  Get.to(() => EditEventScreen(
                        eventID: event['id'],
                        eventName: event['Event name'],
                        eventDescription: event['Event description'],
                        eventLocation: event['Event location'],
                        eventDate: event['Event date'],
                        eventTime: event['Event time'],
                      ));
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => AddEventScreen());
        },
        backgroundColor: DColors.primary,
        label: const Text(
          "Create event",
          style: TextStyle(
              color: DColors.lightText,
              fontWeight: FontWeight.w500,
              fontSize: DSizes.fontMd),
        ),
      ),
    );
  }
}
