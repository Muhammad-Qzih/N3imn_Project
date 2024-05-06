class BarberSalon {
  String shopName;
  String email;
  String phoneNumber;
  String passwrod;
  String location;
  int userType;

  BarberSalon(
      {required this.passwrod,
      required this.email,
      required this.phoneNumber,
      required this.shopName,
      required this.location,
      required this.userType});

  factory BarberSalon.fromJson(Map<String, dynamic> json) {
    return BarberSalon(
        email: json['email'],
        passwrod: json['passwrod'],
        phoneNumber: json['phoneNumber'],
        shopName: json['shopName'],
        location: json['location'],
        userType: json['userType']);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phoneNumber': phoneNumber,
      'shopName': shopName,
      'location': location,
      "userType": userType
    };
  }
}
