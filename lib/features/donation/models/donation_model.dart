import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class DonationModel {
  final id;
  String receiverName;
  String incidentType;
  String receiverNID;
  String incidentDate;
  String bankName;
  String bankAccountName;
  String bankAccountNo;
  String mobileBankingName;
  String mobileBankingPhone;
  String userDistrict;
  String userDivision;
  String reqStatus;
  List<String> images;

  DonationModel(
      {required this.id,
      required this.receiverName,
      required this.incidentType,
      required this.receiverNID,
      required this.incidentDate,
      required this.bankName,
      required this.bankAccountName,
      required this.bankAccountNo,
      required this.mobileBankingName,
      required this.mobileBankingPhone,
      required this.userDistrict,
      required this.userDivision,
      required this.reqStatus,
      required this.images});

  static DonationModel empty() => DonationModel(
        id: '',
        receiverName: '',
        incidentType: '',
        receiverNID: '',
        incidentDate: '',
        bankName: '',
        bankAccountName: '',
        bankAccountNo: '',
        mobileBankingName: '',
        mobileBankingPhone: '',
        userDistrict: '',
        userDivision: '',
        reqStatus: '',
        images: RxList(),
      );

  Map<String, dynamic> toJson() {
    return {
      "Unique id": id,
      "Receiver name": receiverName,
      "Incident type": incidentType,
      "Receiver NID": receiverNID,
      "Incident date": incidentDate,
      "Bank name": bankName,
      "Account name": bankAccountName,
      "Account no": bankAccountNo,
      "Mobile banking": mobileBankingName,
      "Mobile banking phone": mobileBankingPhone,
      "User district": userDistrict,
      "User division": userDivision,
      "Request status": reqStatus,
      "Images": images
    };
  }

  factory DonationModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return DonationModel(
        id: document.id,
        receiverName: data['Receiver name'] ?? '',
        incidentType: data['Incident type'] ?? '',
        receiverNID: data['Receiver NID'] ?? '',
        incidentDate: data['Incident date'] ?? '',
        bankName: data['Bank name'] ?? '',
        bankAccountName: data['Account name'] ?? '',
        bankAccountNo: data['Account no'] ?? '',
        mobileBankingName: data['Mobile banking'] ?? '',
        mobileBankingPhone: data['Mobile banking phone'] ?? '',
        userDistrict: data[''] ?? '',
        userDivision: data[''] ?? '',
        reqStatus: data[''] ?? '',
        images: RxList(),
      );
    } else {
      return DonationModel.empty();
    }
  }
}
