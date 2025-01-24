import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disaster_shield_bd/features/authentication/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;


  Future<void> saveUserRecords(UserModel user) async {
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch(e) {
      throw "Firebase Auth Exception";
    } on FirebaseException catch(e) {
      throw "Firebase Exception";
    } on FormatException catch(_){
      throw "Format Exception";
    } on PlatformException catch(e) {
      throw "Platform Exception";
    } catch (e) {
      throw "Something went wrong";
    }
  }
}