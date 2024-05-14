import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  String? id;
  String username;
  String email;
  String? password;
  String phoneNumber;
  int userType;
  Customer(
      {required this.username,
      this.id,
      required this.email,
       this.password,
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
      'phoneNumber': phoneNumber,
      "userType": userType
    };
  }
    factory Customer.fromFirestore(DocumentSnapshot doc) {
    return Customer(
      id: doc.id,
      username: doc['username'],
      email: doc['email'],
      phoneNumber: doc['phoneNumber'],
      userType: doc["userType"],
    );
  }
}
