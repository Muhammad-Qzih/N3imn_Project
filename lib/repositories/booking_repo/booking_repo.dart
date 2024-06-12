import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:n3imn_project_team/model/bookings_model.dart/booking_add_model.dart';
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

  @override
  Future<List<BookingModel>> getCompletedBookingsByCustomerId(
      String customerId) async {
    QuerySnapshot querySnapshot = await _bookingCollection
        .where('customerId', isEqualTo: customerId)
        .where('status', isEqualTo: 1)
        .get();

    return querySnapshot.docs
        .map((doc) => BookingModel.fromFirestore(doc))
        .toList();
  }

  @override
  Future<List<BookingModel>> getCancelledBookingsByCustomerId(
      String customerId) async {
    QuerySnapshot querySnapshot = await _bookingCollection
        .where('customerId', isEqualTo: customerId)
        .where('status', isEqualTo: 2)
        .get();

    return querySnapshot.docs
        .map((doc) => BookingModel.fromFirestore(doc))
        .toList();
  }

  @override
  Future<List<BookingModel>> getUpcomingBookingsByCustomerId(
      String customerId) async {
    QuerySnapshot querySnapshot = await _bookingCollection
        .where('customerId', isEqualTo: customerId)
        .where('status', isEqualTo: 0)
        .get();

    return querySnapshot.docs
        .map((doc) => BookingModel.fromFirestore(doc))
        .toList();
  }

  @override
  Future<bool> updateBookingStatus(String barberId, int status) async {
    return _bookingCollection.doc(barberId).update({
      'status': status,
    }).then((_) {
      return true;
    }).catchError((error) {
      print('Error updating booking status: $error');
      return false;
    });
  }

  @override
  Future<void> addCustomerBooking(BookingModel bookingModel) async {
    await _bookingCollection.add(bookingModel.toMap());
  }

  @override
  Future<List<BookingModel>> getUpcomingToAccepctBookingsByBarberId(
      String barberId) async {
    QuerySnapshot querySnapshot = await _bookingCollection
        .where('barberId', isEqualTo: barberId)
        .where('status', isEqualTo: 5)
        .get();
    return querySnapshot.docs
        .map((doc) => BookingModel.fromFirestore(doc))
        .toList();
  }

  @override
  Future<List<BookingModel>> getUpcomingBookingsByBarberId(
      String barberId) async {
    QuerySnapshot querySnapshot = await _bookingCollection
        .where('barberId', isEqualTo: barberId)
        .where('status', isEqualTo: 0)
        .get();

    return querySnapshot.docs
        .map((doc) => BookingModel.fromFirestore(doc))
        .toList();
  }

  @override
  Future<void> accepctBooking(String barberId, String customerId, String date,
      String startBookingTime, String endBookingTime) async {
    QuerySnapshot querySnapshot = await _bookingCollection
        .where('barberId', isEqualTo: barberId)
        .where('customerId', isEqualTo: customerId)
        .where('date', isEqualTo: date)
        .where('startBookingTime', isEqualTo: startBookingTime)
        .where('endBookingTime', isEqualTo: endBookingTime)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot document = querySnapshot.docs.first;
      await document.reference.update({'status': 0});
    } else {
      print('No matching booking found.');
    }
  }

  @override
  Future<void> rejectBooking(String barberId, String custmoerId, String date,
      String startBookingTime, String endBookingTime) async {
    QuerySnapshot querySnapshot = await _bookingCollection
        .where('barberId', isEqualTo: barberId)
        .where('customerId', isEqualTo: custmoerId)
        .where('date', isEqualTo: date)
        .where('startBookingTime', isEqualTo: startBookingTime)
        .where('endBookingTime', isEqualTo: endBookingTime)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot document = querySnapshot.docs.first;
      await document.reference.update({'status': 3});
    } else {
      print('No matching booking found.');
    }
  }

  @override
  Future<void> cancelBooking(String? bookingId) async {
    if (bookingId == null) {
      print('Booking ID is null.');
      return;
    }
    DocumentSnapshot documentSnapshot =
        await _bookingCollection.doc(bookingId).get();

    if (documentSnapshot.exists) {
      await documentSnapshot.reference.update({'status': 3});
      print('Booking status updated to 3.');
    } else {
      print('No matching booking found.');
    }
  }

  Future<int> getCancelledBookingsCountByBarberId(String barberId) async {
    QuerySnapshot querySnapshot = await _bookingCollection
        .where('barberId', isEqualTo: barberId)
        .where('status', isEqualTo: 2)
        .get();

    return querySnapshot.size;
  }

  Future<int> getCompletedBookingsCountByBarberId(String barberId) async {
    QuerySnapshot querySnapshot = await _bookingCollection
        .where('barberId', isEqualTo: barberId)
        .where('status', isEqualTo: 1)
        .get();

    return querySnapshot.size;
  }

  Future<int> getUpcommingBookingsCountByBarberId(String barberId) async {
    QuerySnapshot querySnapshot = await _bookingCollection
        .where('barberId', isEqualTo: barberId)
        .where('status', isEqualTo: 0)
        .get();

    return querySnapshot.size;
  }
}
