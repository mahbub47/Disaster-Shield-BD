class UserModel {
  final id;
  String username;
  String district;
  String division;
  final email;
  final password;
  String phone;

  UserModel({
    required this.id,
    required this.username,
    required this.division,
    required this.district,
    required this.email,
    required this.password,
    required this.phone
  });

  static UserModel empty() =>
      UserModel(id: '',
          username: '',
          division: '',
          district: '',
          email: '',
          password: '',
          phone: '');

  Map<String, dynamic> toJson() {
    return {
      "Username": username,
      "Division": division,
      "District": district,
      "Email": email,
      "password": password,
      "Phone": phone
    };
  }

}