class AuthValidator {
  static String? isValidEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email  cannot be empty';
    }
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+$");
    if (emailRegExp.hasMatch(email!)) {
      return null;
    }
    return "Enter Valid Email";
  }

  static String? isValidName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name cannot be empty';
    }
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    if (nameRegExp.hasMatch(name!)) {
      return null;
    }
    return "Enter Valid Name";
  }

  static String? isValidPassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password cannot be empty';
    }
    final passwordRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}$');
    if (passwordRegExp.hasMatch(password!)) {
      return null;
    }
    return "Enter Strong Password";
  }

  static String? validSalonName(String? city) {
    if (city == null || city.isEmpty) {
      return 'City cannot be empty';
    }
    if (city.length < 4) {
      return 'City name must be at least 4 letters long';
    }
    return null;
  }

  static String? validateCity(String? city) {
    if (city == null || city.isEmpty) {
      return 'City cannot be empty';
    }
    if (city.length < 4) {
      return 'City name must be at least 4 letters long';
    }
    return null;
  }

  static String? isValidPhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'Phone number cannot be empty';
    }
    if (!RegExp(r'^05\d{8,}$').hasMatch(phone)) {
      return 'Enter a valid phone number starting with 05 and at least 10 digits';
    }
    return null;
  }
}
