import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:n3imn_project_team/model/feedback_model.dart';

class FeedbackRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> submitFeedback(FeedbackModel feedback) async {
    await _firestore.collection('feedback').add(feedback.toMap());
  }

  Future<List<double>> getRatesByBarberId(String barberId) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('feedback')
        .where('salonId', isEqualTo: barberId)
        .get();

    if (querySnapshot.docs.isEmpty) {
      return [];
    }

    List<double> rates = [];

    for (var doc in querySnapshot.docs) {
      rates.add((doc['rate'] as num).toDouble());
    }

    return rates;
  }

  double computeAverageRate(List<double> rates) {
    if (rates.isEmpty) {
      return 0.0;
    }

    double totalRate = rates.fold(0, (sum, rate) => sum + rate);
    double avg = totalRate / rates.length;

    return double.parse(avg.toStringAsFixed(1));
  }

  Future<int> getCustomersCountByBarberId(String brberId) async {
    QuerySnapshot bookingSnapshot = await FirebaseFirestore.instance
        .collection('bookings')
        .where('barberId', isEqualTo: brberId)
        .get();

    Set<String> uniqueCustomerIds =
        bookingSnapshot.docs.map((doc) => doc['customerId'] as String).toSet();

    return uniqueCustomerIds.length;
  }
}
