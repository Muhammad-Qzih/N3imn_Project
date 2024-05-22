import '../model/feedback_model.dart';
import 'package:n3imn_project_team/repositories/feedback_repo.dart';

import '../repositories/user_repo/feedback_repo.dart';

class FeedbackService {
  final FeedbackRepository _repository = FeedbackRepository();

  Future<void> submitFeedback(String salonId, int rate, String? feedback, String userId) {
    final feedbackModel = FeedbackModel(
      salonId: salonId,
      rate: rate,
      feedback: feedback,
      userId: userId,
    );
    return _repository.submitFeedback(feedbackModel);
  }
}