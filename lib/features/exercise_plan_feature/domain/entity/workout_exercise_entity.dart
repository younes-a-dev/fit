import 'package:equatable/equatable.dart';

import '../../../feature_exercise/domain/entity/exercise_entity.dart';

class WorkoutExerciseEntity extends Equatable {
  final String id;
  final ExerciseEntity exercise;
  final int sets;
  final int reps;
  final int? restSeconds;
  final double? weight;
  final String? note;
  final int order;

  const WorkoutExerciseEntity({
    required this.id,
    required this.exercise,
    required this.sets,
    required this.reps,
    this.restSeconds,
    this.weight,
    this.note,
    required this.order,
  });

  @override
  List<Object?> get props => [
        id,
        exercise,
        sets,
        reps,
        restSeconds,
        weight,
        note,
        order,
      ];
}
