import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  String barberSalonName;
  String location;
  String? id;
  String customerId;
  String barberId;
  String startBookingTime;
  String endBookingTime;
  Set<String> services;
  int status;
  String date;
  BookingModel(
      {required this.location,
      required this.barberSalonName,
      this.id,
      required this.customerId,
      required this.barberId,
      required this.startBookingTime,
      required this.endBookingTime,
      required this.services,
      required this.status,
      required this.date});

  Map<String, dynamic> toMap() {
    return {
      "barberSalonName": barberSalonName,
      'customerId': customerId,
      'barberId': barberId,
      'startBookingTime': startBookingTime,
      'endBookingTime': endBookingTime,
      'services': services,
      'status': status,
      "date": date,
      "location": location
    };
  }

  factory BookingModel.fromFirestore(DocumentSnapshot doc) {
    return BookingModel(
      id: doc.id,
      location: doc["location"],
      barberSalonName: doc["barberSalonName"],
      customerId: doc['customerId'],
      barberId: doc['barberId'],
      startBookingTime: doc['startBookingTime'],
      endBookingTime: doc['endBookingTime'],
      services: Set<String>.from(doc['services']),
      status: doc['status'],
      date: doc['date'],
    );
  }
}
