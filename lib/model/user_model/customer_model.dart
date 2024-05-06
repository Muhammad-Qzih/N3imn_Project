class Customer {
  String username;
  String email;
  String password;
  String phoneNumber;
  int userType;
  Customer(
      {required this.username,
      required this.email,
      required this.password,
      required this.phoneNumber,
      required this.userType});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      userType: json['userType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      "userType": userType
    };
  }
}
