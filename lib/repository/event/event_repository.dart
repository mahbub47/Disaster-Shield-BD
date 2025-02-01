import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disaster_shield_bd/features/events/models/event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EventRepository extends GetxController {
  static EventRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Save user data to firestore
  Future<void> addEventToDB(EventModel event) async {
    try {
      await _db.collection("Events").doc().set(event.toJson());
    } on FirebaseAuthException catch (_) {
      throw "Firebase Auth Exception";
    } on FirebaseException catch (_) {
      throw "Firebase Exception";
    } on FormatException catch (_) {
      throw "Format Exception";
    } on PlatformException catch (_) {
      throw "Platform Exception";
    } catch (e) {
      throw "Something went wrong";
    }
  }

  Future<void> updateEventtoDB(String docID,Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Events")
          .doc(docID)
          .update(json);
    } on FirebaseAuthException catch (_) {
      throw "Firebase Auth Exception";
    } on FirebaseException catch (_) {
      throw "Firebase Exception";
    } on FormatException catch (_) {
      throw "Format Exception";
    } on PlatformException catch (_) {
      throw "Platform Exception";
    } catch (e) {
      throw "Something went wrong";
    }
  }

  Future<void> deleteEventFromDB(String docId) async {
    try {
      await _db.collection("Events").doc(docId).delete();
    } on FirebaseAuthException catch (_) {
      throw "Firebase Auth Exception";
    } on FirebaseException catch (_) {
      throw "Firebase Exception";
    } on FormatException catch (_) {
      throw "Format Exception";
    } on PlatformException catch (_) {
      throw "Platform Exception";
    } catch (e) {
      throw "Something went wrong";
    }
  }
}