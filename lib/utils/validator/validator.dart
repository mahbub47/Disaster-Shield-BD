class DValidator {
  
  static String? validateEmptiTextField(String textField, String? value) {
    
    if (value == null || value.isEmpty) {
      return 'please enter $textField';
    }  
    
    return null;
  }

  static String? validatePhoneNumber(String? value){
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }

    final phoneRegex = RegExp(r'^\+8801([37956])\d{8}$');
    
    if (!phoneRegex.hasMatch(value)) {
      return "Enter a valid number";
    }

    return null;
  }

  static String? validateEmail(String? value){
    if (value == null || value.isEmpty) {
      return 'Please enter a email address';
    }

    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email";
    }

    return null;
  }

  static String? validatePassword(String? value){
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }

    if (value.length < 8) {
      return 'password must be at least 8 character long';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain an uppercase letter";
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return "Password must contain an lowecase letter";
    }

    if (!value.contains(RegExp(r'\d'))) {
      return "Password must contain numbers";
    }

    if (!value.contains(RegExp(r'[!@#$%^&*()]'))) {
      return "Password must contain special character";
    }

    return null;
  }
}