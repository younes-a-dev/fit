import '../../../feature_exercise/data/model/exercise_model.dart';
import '../../domain/entity/workout_exercise_entity.dart';

class WorkoutExerciseModel extends WorkoutExerciseEntity {
  const WorkoutExerciseModel({
    required super.id,
    required super.exercise,
    required super.sets,
    required super.reps,
    super.restSeconds,
    super.weight,
    super.note,
    required super.order,
  });

  factory WorkoutExerciseModel.fromJson(Map<String, dynamic> json) {
    return WorkoutExerciseModel(
      id: json['id'],
      exercise: ExerciseModel.fromJson(json['exercise']),
      sets: json['sets'] ?? 3,
      reps: json['reps'] ?? 10,
      restSeconds: json['rest_seconds'],
      weight: json['weight']?.toDouble(),
      note: json['note'],
      order: json['order'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'exercise': (exercise as ExerciseModel).toJson(),
      'sets': sets,
      'reps': reps,
      'rest_seconds': restSeconds,
      'weight': weight,
      'note': note,
      'order': order,
    };
  }
}