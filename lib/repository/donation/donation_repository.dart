import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disaster_shield_bd/features/donation/models/donation_model.dart';
import 'package:disaster_shield_bd/repository/authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DonationRepository extends GetxController {
  static DonationRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Save user data to firestore
  Future<void> saveUserReuest(DonationModel donation) async {
    try {
      await _db.collection("Donations").doc(donation.id).set(donation.toJson());
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

  Future<List<Map<String, dynamic>>> fetchRequestsByDistrict() async {
    final firestoreRef = FirebaseFirestore.instance.collection("Donations");
    try {
      final snapshot = await firestoreRef.get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw Exception("Error fetching requests by district: $e");
    }
  }

  Future<DonationModel> fetchDonationRequest() async {
    try {
      final documentSnapshot = await _db
          .collection("Donations")
          .doc(AthenticationRepository.instance.authUser?.uid)
          .get();

      if (documentSnapshot.exists) {
        return DonationModel.fromSnapshot(documentSnapshot);
      } else {
        return DonationModel.empty();
      }
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

  Future<void> deleteDonationRequest(String userId) async {
    try {
      await _db.collection("Donations").doc(userId).delete();
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
