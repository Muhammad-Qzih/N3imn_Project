import 'package:cloud_firestore/cloud_firestore.dart';

class BarberSalon {
  String? id;
  String shopName;
  String email;
  String phoneNumber;
  String? passwrod;
  String location;
  int userType;

  BarberSalon(
      { this.id,
        this.passwrod,
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

  factory BarberSalon.fromFirestore(DocumentSnapshot doc) {
    return BarberSalon(
      id: doc.id,
      shopName: doc['shopName'],
      email: doc['email'],
      location: doc['location'],
      phoneNumber: doc['phoneNumber'],
      userType: doc["userType"],
    );
  }
}
