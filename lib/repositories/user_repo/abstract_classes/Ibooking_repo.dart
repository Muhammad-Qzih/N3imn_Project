// ignore_for_file: file_names

import 'package:n3imn_project_team/model/bookings_model.dart/booking_model.dart';

abstract class IBookingRepository {
  Future<List<Booking>> getBookingsByCustomerId(String customerId);
}
