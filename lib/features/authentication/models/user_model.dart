import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final id;
  String username;
  String district;
  String division;
  final email;
  final password;
  String phone;
  String role;
  String nid;
  String organization;
  String emergencyMessage;
  String emergencyContact;

  UserModel({
    required this.id,
    required this.username,
    required this.division,
    required this.district,
    required this.email,
    required this.password,
    required this.phone,
    required this.role,
    required this.nid,
    required this.organization,
    required this.emergencyContact,
    required this.emergencyMessage
  });

  static UserModel empty() =>
      UserModel(
        id: '',
        username: '',
        division: '',
        district: '',
        email: '',
        password: '',
        phone: '',
        role: '',
        nid: '',
        organization: '',
        emergencyContact: '',
        emergencyMessage: '',
      );

  Map<String, dynamic> toJson() {
    return {
      "Username": username,
      "Division": division,
      "District": district,
      "Email": email,
      "password": password,
      "Phone": phone,
      "Role": role,
      "NID": nid,
      "Organization": organization,
      "Emergency Contact": emergencyContact,
      "Emergency Message": emergencyMessage
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(id: document.id,
          username: data['Username'] ?? '',
          division: data['Division'] ?? '',
          district: data['District'] ?? '',
          email: data['Email'] ?? '',
          password: data['password'] ?? '',
          phone: data['Phone'] ?? '',
          role: data['Role'] ?? '',
          nid: data['NID'] ?? '',
          organization: data['Organization'] ?? '',
          emergencyContact: data['Emergency Contact'] ?? '',
          emergencyMessage: data['Emergency Message'] ?? '');
    } else {
      return UserModel.empty();
    }
  }

}