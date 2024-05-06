// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:n3imn_project_team/model/user_model/barber_model.dart';
import 'package:n3imn_project_team/repositories/user_repo/abstract_classes/Ibarber_repo.dart';

class BarberRepository implements IBarberRepository {
  final CollectionReference _barbersCollection =
      FirebaseFirestore.instance.collection('barbers');

  @override
  Future<void> addBarber(String userId, BarberSalon barberSalon) async {
    await _barbersCollection.doc(userId).set(
      barberSalon.toJson(),
    );
  }
}
