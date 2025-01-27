import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disaster_shield_bd/features/authentication/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../authentication_repository/authentication_repository.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Save user data to firestore
  Future<void> saveUserRecords(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
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

  //feth user data from firestore
  Future<UserModel> fetchUserRecords() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AthenticationRepository.instance.authUser?.uid)
          .get();

      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
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

  //update user data in firestore
  Future<void> updateUserRecords(UserModel updatedUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
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

  //update any fields in user collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AthenticationRepository.instance.authUser?.uid)
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

  //delete user record from firestore
  Future<void> deleteUserRecords(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
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
