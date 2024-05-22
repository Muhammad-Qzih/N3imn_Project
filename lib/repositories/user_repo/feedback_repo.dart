import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:n3imn_project_team/model/feedback_model.dart';

class FeedbackRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> submitFeedback(FeedbackModel feedback) async {
    await _firestore.collection('feedback').add(feedback.toMap());
  }
}