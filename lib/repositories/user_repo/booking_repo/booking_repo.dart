import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:n3imn_project_team/model/bookings_model.dart/booking_model.dart';

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
}
