
import '../../domain/entity/workout_day_entity.dart';
import 'workout_exercise_model.dart';

class WorkoutDayModel extends WorkoutDayEntity {
  const WorkoutDayModel({
    required super.id,
    required super.title,
    required super.order,
    required super.dayNumber,
    required super.exercises,
  });

  factory WorkoutDayModel.fromJson(Map<String, dynamic> json) {
    return WorkoutDayModel(
      id: json['id'],
      title: json['title'] ?? 'Day ${json['day_number']}',
      order: json['order'] ?? 0,
      dayNumber: json['day_number'] ?? 1,
      exercises: (json['exercises'] as List? ?? [])
          .map((e) => WorkoutExerciseModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'order': order,
      'day_number': dayNumber,
      'exercises': exercises.map((e) => (e as WorkoutExerciseModel).toJson()).toList(),
    };
  }
}