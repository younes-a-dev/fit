import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/params/exercise_query.dart';
import '../../../../core/status/base_status.dart';
import '../../domain/usecases/get_exercise_detail_use_case.dart';
import '../../domain/usecases/get_exercises_use_case.dart';
import 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  final GetExercisesUseCase _getExercisesUseCase;
  final GetExerciseDetailsUseCase _getExerciseDetailsUseCase;

  ExerciseCubit(this._getExercisesUseCase, this._getExerciseDetailsUseCase)
      : super(
          ExerciseState(),
        );

  // Get exercises list
  Future<void> getExercisesEvent({ExerciseQuery? query}) async {
    emit(state.copyWith(newExercisesStatus: Loading()));
    final result = await _getExercisesUseCase(param: query);

    result.fold((failure) {
      emit(state.copyWith(
          newExercisesStatus:
              ErrorStatus(error: failure, message: failure.message)));
    }, (exercises) {
      emit(state.copyWith(newExercisesStatus: Success(data: exercises)));
    });
  }

  // Get exercise details
  Future<void> getExerciseDetailEvent(String id) async {
    emit(state.copyWith(newExerciseDetailStatus: Loading()));

    final result = await _getExerciseDetailsUseCase(param: id);
    result.fold((failure) {
      emit(state.copyWith(
          newExerciseDetailStatus:
              ErrorStatus(message: failure.message, error: failure)));
    }, (exercise) {
      emit(state.copyWith(newExerciseDetailStatus: Success(data: exercise)));
    });
  }

  void resetExercisesStatus() {
    emit(state.copyWith(
      newExercisesStatus: const Initial(),
    ));
  }

  void resetExerciseDetailsStatus() {
    emit(state.copyWith(
      newExerciseDetailStatus: const Initial(),
    ));
  }

  void resetAllStatuses() {
    emit(const ExerciseState());
  }
}
