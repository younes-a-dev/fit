import '../provider/plan.dart';
import 'session_model.dart';

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
