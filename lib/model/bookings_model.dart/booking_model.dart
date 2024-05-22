import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  String barberSalonName;
  String location;
  String id;
  String customerId;
  String barberId;
  Timestamp startBookingTime;
  Timestamp endBookingTime;
  List<String> services;
  int status;

  Booking({
    required this.location,
    required this.barberSalonName,
    required this.id,
    required this.customerId,
    required this.barberId,
    required this.startBookingTime,
    required this.endBookingTime,
    required this.services,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'customerId': customerId,
      'barberId': barberId,
      'startBookingTime': startBookingTime,
      'endBookingTime': endBookingTime,
      'services': services,
      'status': status,
    };
  }

  factory Booking.fromFirestore(DocumentSnapshot doc) {
    return Booking(
      id: doc.id,
      location: doc["location"],
      barberSalonName: doc["barberSalonName"],
      customerId: doc['customerId'],
      barberId: doc['barberId'],
      startBookingTime: doc['startBookingTime'],
      endBookingTime: doc['endBookingTime'],
      services: List<String>.from(doc['services']),
      status: doc['status'],
    );
  }
}
