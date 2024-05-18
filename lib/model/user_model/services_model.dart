import 'package:cloud_firestore/cloud_firestore.dart';

class BarberService {

  final List<String> services;

  BarberService({

    required this.services,
  });

  factory BarberService.fromJson(Map<String, dynamic> json) {
    return BarberService(
      services: List<String>.from(json['services'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'barberServices': services,
    };
  }

  factory BarberService.fromFirestore(DocumentSnapshot doc) {
    return BarberService(
      services: List<String>.from(doc["barberServices"] ?? []),
    );
  }

  Object? size() {}
}
