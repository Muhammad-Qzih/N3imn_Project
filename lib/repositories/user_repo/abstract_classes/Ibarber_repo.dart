// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:n3imn_project_team/model/user_model/barber_model.dart';
import 'package:n3imn_project_team/model/user_model/services_model.dart';

abstract class IBarberRepository {
  Future<void> addBarber(String userId, BarberSalon barberSalon);
  Future<DocumentSnapshot?> getBarberDocumentByID(String barberId);
  Future<List<BarberSalon>> getBarbers();
  Future<List<BarberSalon>> getTopBarbers();
  Future<void> updateBarberProfileById(
      String user,
      String shopNameController,
      String emailController,
      String phoneController,
      String locationController);
  Future<BarberSalon?> fetchBarberProfile(String barberSalonId);
  Future<List<BarberSalon>> getReommendedBarbers();
  Future<void> updateServices(String barberId, List<String> services);
  Future<BarberService?> getBarberServices(String barberId);
}
