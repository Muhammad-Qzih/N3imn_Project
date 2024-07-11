import 'package:flutter/material.dart';
import 'package:n3imn_project_team/services/feedback_service.dart';

class FeedbackViewModel extends ChangeNotifier {
  final FeedbackService _service = FeedbackService();

  int _rate = 0;
  String? _feedback;
  bool _isLoading = false;

  int get rate => _rate;
  String? get feedback => _feedback;
  bool get isLoading => _isLoading;

  void setRate(int rate) {
    _rate = rate;
    notifyListeners();
  }

  void setFeedback(String feedback) {
    _feedback = feedback;
    notifyListeners();
  }

  Future<void> submitFeedback(String salonId, String userId) async {
    if (_rate == 0) {
      // Rate is required
      return;
    }
    _isLoading = true;
    notifyListeners();
    await _service.submitFeedback(salonId, _rate, _feedback, userId);
    _isLoading = false;
    notifyListeners();
  }
}