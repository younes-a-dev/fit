import 'package:equatable/equatable.dart';

import '../../../../core/status/base_status.dart';
import '../../domain/entity/exercise_entity.dart';

class ExerciseState extends Equatable {
  final BaseStatus<List<ExerciseEntity>> exercisesStatus;
  final BaseStatus<ExerciseEntity> exerciseDetailStatus;

  const ExerciseState({
    this.exercisesStatus = const Initial(),
    this.exerciseDetailStatus = const Initial(),
  });

  ExerciseState copyWith({
    BaseStatus<List<ExerciseEntity>>? newExercisesStatus,
    BaseStatus<ExerciseEntity>? newExerciseDetailStatus,
  }) {
    return ExerciseState(
      exercisesStatus: newExercisesStatus ?? exercisesStatus,
      exerciseDetailStatus: newExerciseDetailStatus ?? exerciseDetailStatus,
    );
  }

  @override
  List<Object?> get props => [
        exercisesStatus,
        exerciseDetailStatus,
      ];
}
