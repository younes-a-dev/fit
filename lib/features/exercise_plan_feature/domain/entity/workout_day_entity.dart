import 'package:equatable/equatable.dart';

import 'workout_exercise_entity.dart';

class WorkoutDayEntity extends Equatable {
  final String id;
  final String title;
  final int order;
  final int dayNumber;
  final List<WorkoutExerciseEntity> exercises;

  const WorkoutDayEntity({
    required this.id,
    required this.title,
    required this.order,
    required this.dayNumber,
    required this.exercises,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        order,
        dayNumber,
        exercises,
      ];
}
