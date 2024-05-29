import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:n3imn_project_team/model/bookings_model.dart/booking_model.dart';
import 'package:n3imn_project_team/model/bookings_model.dart/booking_status.dart';

import 'package:n3imn_project_team/repositories/user_repo/abstract_classes/Ibooking_repo.dart';

class BookingRepository implements IBookingRepository {
  final CollectionReference _bookingCollection =
      FirebaseFirestore.instance.collection('bookings');

  @override
  Future<List<Booking>> getBookingsByCustomerId(String customerId) async {
    QuerySnapshot querySnapshot = await _bookingCollection
        .where('customerId', isEqualTo: customerId)
        .get();

    return querySnapshot.docs.map((doc) => Booking.fromFirestore(doc)).toList();
  }

  Future<List<Booking>> getCompletedBookingsByCustomerId(
      String customerId) async {
    QuerySnapshot querySnapshot = await _bookingCollection
        .where('customerId', isEqualTo: customerId)
        .where('status', isEqualTo: 1)
        .get();
  
    return querySnapshot.docs.map((doc) => Booking.fromFirestore(doc)).toList();
  }
    Future<List<Booking>> getCancelledBookingsByCustomerId(
      String customerId) async {
    QuerySnapshot querySnapshot = await _bookingCollection
        .where('customerId', isEqualTo: customerId)
        .where('status', isEqualTo: 2)
        .get();

    return querySnapshot.docs.map((doc) => Booking.fromFirestore(doc)).toList();
  }
  Future<List<Booking>> getUpcomingBookingsByCustomerId(
      String customerId) async {
    QuerySnapshot querySnapshot = await _bookingCollection
        .where('customerId', isEqualTo: customerId)
        .where('status', isEqualTo: 0)
        .get();

    return querySnapshot.docs.map((doc) => Booking.fromFirestore(doc)).toList();
  }

  Future<List<Booking>> getUpcomingBookingsByBarberId(
      String barberId) async {
    QuerySnapshot querySnapshot = await _bookingCollection
        .where('barberId', isEqualTo: barberId)
        .where('status', isEqualTo: 0)
        .get();

    return querySnapshot.docs.map((doc) => Booking.fromFirestore(doc)).toList();
  }
}
