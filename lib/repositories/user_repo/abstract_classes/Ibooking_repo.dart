// ignore_for_file: file_names

import 'package:n3imn_project_team/model/bookings_model.dart/booking_add_model.dart';
import 'package:n3imn_project_team/model/bookings_model.dart/booking_model.dart';

abstract class IBookingRepository {
  Future<List<Booking>> getBookingsByCustomerId(String customerId);

  Future<List<BookingModel>> getCompletedBookingsByCustomerId(
      String customerId);
  Future<List<BookingModel>> getCancelledBookingsByCustomerId(
      String customerId);
  Future<List<BookingModel>> getUpcomingBookingsByCustomerId(String customerId);
  Future<bool> updateBookingStatus(String barberId, int status);
  Future<void> addCustomerBooking(BookingModel bookingModel);
  Future<List<BookingModel>> getUpcomingToAccepctBookingsByBarberId(
      String barberId);
  Future<List<BookingModel>> getUpcomingBookingsByBarberId(String barberId);
  Future<void> accepctBooking(String barberId, String customerId, String date,
      String startBookingTime, String endBookingTime);
  Future<void> rejectBooking(String barberId, String custmoerId, String date,
      String startBookingTime, String endBookingTime);
  Future<void> cancelBooking(String? bookingId);
}
