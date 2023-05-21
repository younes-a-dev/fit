import '../provider/exercise.dart';

class SessionModel{
  final String? id;
  final String? sessionName;
  late final List<Exercise>? sessionExercises;

  SessionModel({
    this.id,
    this.sessionName,
    this.sessionExercises,
});
}