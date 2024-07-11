class FeedbackModel {
  final String salonId;
  final int rate;
  final String? feedback;
  final String userId;

  FeedbackModel({
    required this.salonId,
    required this.rate,
    required this.userId,
    this.feedback,
  });

  Map<String, dynamic> toMap() {
    return {
      'salonId': salonId,
      'rate': rate,
      'feedback': feedback,
      'userId': userId,
    };
  }

  factory FeedbackModel.fromMap(Map<String, dynamic> map) {
    return FeedbackModel(
      salonId: map['salonId'],
      rate: map['rate'],
      feedback: map['feedback'],
      userId: map['userId'],
    );
  }
}