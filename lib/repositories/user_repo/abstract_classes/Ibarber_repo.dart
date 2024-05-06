// ignore_for_file: file_names

import 'package:n3imn_project_team/model/user_model/barber_model.dart';

abstract class IBarberRepository {
  Future<void> addBarber(String userId, BarberSalon barberSalon);
}
