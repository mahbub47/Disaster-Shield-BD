import 'package:disaster_shield_bd/features/events/controllers/event_list_controller.dart';
import 'package:disaster_shield_bd/features/events/screens/events_screen_volunteer/volunteers_event_screen.dart';
import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eventsListController = Get.put(EventListController());
    eventsListController.fetchAllEvents();

    eventsListController.fetchRole();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DColors.primary,
        title: const Text('Events'),
        actions: [
          Obx(() {
            return eventsListController.role.value == 'Volunteer'
                ? IconButton(
                    icon: const Icon(Icons.list),
                    onPressed: () {
                      Get.to(() => const VolunteersEventScreen());
                    },
                  )
                : const SizedBox.shrink();
          })
        ],
      ),
      body: Obx(() {
        if (eventsListController.events.isEmpty) {
          return const Center(
              child: CircularProgressIndicator(
            color: DColors.primary,
          ));
        }
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: eventsListController.events.length,
            itemBuilder: (context, index) {
              final event = eventsListController.events[index];
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListTile(
                  tileColor: DColors.accent.withOpacity(0.5),
                  title: Text(event['Event name'] ?? ""),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(event['Event description'] ?? ""),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(event['Event location'] ?? ""),
                      Text(event['Event date'] ?? ""),
                      Text(event['Event time'] ?? ""),
                    ],
                  ),
                  onTap: () {
                    // Open event details or manage if the user is a volunteer
                  },
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
