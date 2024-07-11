import 'package:n3imn_project_team/repositories/booking_repo/booking_repo.dart';
import 'package:n3imn_project_team/repositories/user_repo/feedback_repo.dart';

class BookingDashViewModel {
  final BookingRepository _bookingRepository = BookingRepository();
  final FeedbackRepository _feedback = FeedbackRepository();

  Future<int?> getUpcommingBookingsCountByBarberId(String barberId) async {
    try {
      return await _bookingRepository
          .getUpcommingBookingsCountByBarberId(barberId);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int?> getCancelledBookingsCountByBarberId(String barberId) async {
    try {
      return await _bookingRepository
          .getCancelledBookingsCountByBarberId(barberId);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int?> getCompletedBookingsCountByBarberId(String barberId) async {
    try {
      return await _bookingRepository
          .getCompletedBookingsCountByBarberId(barberId);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<double>>? getRatesByBarberId(String barberId) {
    try {
      return _feedback.getRatesByBarberId(barberId);
    } catch (e) {
      print(e);
      return null;
    }
  }

  double computeAverageRate(List<double> rates) {
    return _feedback.computeAverageRate(rates);
  }

  Future<int> getCustomersCountByBarberId(String brberId) async {
    return await _feedback.getCustomersCountByBarberId(brberId);
  }
}
