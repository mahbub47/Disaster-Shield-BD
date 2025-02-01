import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class EventModel {
  final id;
  String eventName;
  String eventDescription;
  String eventDate;
  String eventTime;
  String eventLocation;
  int interestCount;
  int goingCount;

  EventModel(
      {required this.id,
        required this.eventName,
        required this.eventDescription,
        required this.eventDate,
        required this.eventTime,
        required this.eventLocation,
        required this.interestCount,
        required this.goingCount});

  static EventModel empty() => EventModel(
    id: '',
    eventName: '',
    eventDescription: '',
    eventDate: '',
    eventTime: '',
    eventLocation: '',
    interestCount: 0,
    goingCount: 0,
  );

  Map<String, dynamic> toJson() {
    return {
      "Created by": id,
      "Event name": eventName,
      "Event description": eventDescription,
      "Event date": eventDate,
      "Event time": eventTime,
      "Event location": eventLocation,
      "Interested": interestCount,
      "Going": goingCount,
    };
  }

  factory EventModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return EventModel(
        id: data['Created by'] ?? '',
        eventName: data['Event name'] ?? '',
        eventDescription: data['Event description'] ?? '',
        eventDate: data['Event date'] ?? '',
        eventTime: data['Event time'] ?? '',
        eventLocation: data['Event location'] ?? '',
        interestCount: data['Interested'] ?? 0,
        goingCount: data['Going'] ?? 0,
      );
    } else {
      return EventModel.empty();
    }
  }
}
