import 'package:cloud_firestore/cloud_firestore.dart';

class BarberSalon {
  String? id;
  String shopName;
  String email;
  String phoneNumber;
  String? passwrod;
  String location;
  int userType;
  int rating;
  int? status;
  String? pictureUrl;
  BarberSalon(
      {this.id,
      this.passwrod,
      required this.email,
      required this.phoneNumber,
      required this.shopName,
      required this.location,
      required this.userType,
      required this.rating,
      this.status,
       this.pictureUrl
      });

  factory BarberSalon.fromJson(Map<String, dynamic> json) {
    return BarberSalon(
      email: json['email'],
      passwrod: json['passwrod'],
      phoneNumber: json['phoneNumber'],
      shopName: json['shopName'],
      location: json['location'],
      userType: json['userType'],
      rating: json['rating'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phoneNumber': phoneNumber,
      'shopName': shopName,
      'location': location,
      "userType": userType,
      "rating": rating,
      "status": status
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
        rating: doc["rating"],
        status: doc["status"]);
  }
}
