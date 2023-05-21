import 'package:workout/model/session_model.dart';

import '../provider/plan.dart';

class WorkoutHistoryModel {
  final String id;
  final DateTime workoutDate;
  final SessionModel session;
  final Plan plan;

  WorkoutHistoryModel({
    required this.id,
    required this.workoutDate,
    required this.session,
    required this.plan,
  });
}
