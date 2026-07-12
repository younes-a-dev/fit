import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/params/exercise_plan_query.dart';
import '../../../../core/status/base_status.dart';
import '../../domain/usecases/exercise_plan_usecases.dart';
import 'exercise_plan_state.dart';

class ExercisePlanCubit extends Cubit<ExercisePlanState> {
  final GetPlansUseCase _getPlansUseCase;
  final GetPlanDetailsUseCase _getPlanDetailsUseCase;
  final BookmarkPlanUseCase _bookmarkPlanUseCase;
  final RemoveBookmarkUseCase _removeBookmarkUseCase;
  final SetCurrentPlanUseCase _setCurrentPlanUseCase;

  ExercisePlanCubit(
      this._getPlansUseCase,
      this._getPlanDetailsUseCase,
      this._bookmarkPlanUseCase,
      this._removeBookmarkUseCase,
      this._setCurrentPlanUseCase,
      ) : super(const ExercisePlanState());

  // Get plans list
  Future<void> getPlansEvent({ExercisePlanQuery? query}) async {
    emit(state.copyWith(newPlansStatus: const Loading()));
    final result = await _getPlansUseCase(param: query);

    result.fold(
          (failure) {
        emit(state.copyWith(
          newPlansStatus:
          ErrorStatus(error: failure, message: failure.message),
        ));
      },
          (plans) {
        emit(state.copyWith(
          newPlansStatus: Success(data: plans),
        ));
      },
    );
  }

  // Get plan details
  Future<void> getPlanDetailEvent(String id) async {
    emit(state.copyWith(newPlanDetailStatus: const Loading()));

    final result = await _getPlanDetailsUseCase(param: id);
    result.fold(
          (failure) {
        emit(state.copyWith(
          newPlanDetailStatus:
          ErrorStatus(message: failure.message, error: failure),
        ));
      },
          (plan) {
        emit(state.copyWith(
          newPlanDetailStatus: Success(data: plan),
        ));
      },
    );
  }

  // Bookmark plan
  Future<void> bookmarkPlanEvent(String id) async {
    emit(state.copyWith(newBookmarkStatus: const Loading()));

    final result = await _bookmarkPlanUseCase(param: id);
    result.fold(
          (failure) {
        emit(state.copyWith(
          newBookmarkStatus:
          ErrorStatus(message: failure.message, error: failure),
        ));
      },
          (_) {
        emit(state.copyWith(
          newBookmarkStatus: const Success(),
        ));
        // Refresh plans to update bookmark status
        getPlansEvent();
      },
    );
  }

  // Remove bookmark
  Future<void> removeBookmarkEvent(String id) async {
    emit(state.copyWith(newBookmarkStatus: const Loading()));

    final result = await _removeBookmarkUseCase(param: id);
    result.fold(
          (failure) {
        emit(state.copyWith(
          newBookmarkStatus:
          ErrorStatus(message: failure.message, error: failure),
        ));
      },
          (_) {
        emit(state.copyWith(
          newBookmarkStatus: const Success(),
        ));
        // Refresh plans to update bookmark status
        getPlansEvent();
      },
    );
  }

  // Set current plan
  Future<void> setCurrentPlanEvent(String id) async {
    emit(state.copyWith(newSetCurrentPlanStatus: const Loading()));

    final result = await _setCurrentPlanUseCase(param: id);
    result.fold(
          (failure) {
        emit(state.copyWith(
          newSetCurrentPlanStatus:
          ErrorStatus(message: failure.message, error: failure),
        ));
      },
          (_) {
        emit(state.copyWith(
          newSetCurrentPlanStatus: const Success(),
        ));
        // Refresh plans to update current plan status
        getPlansEvent();
      },
    );
  }

  // Reset statuses
  void resetPlansStatus() {
    emit(state.copyWith(
      newPlansStatus: const Initial(),
    ));
  }

  void resetPlanDetailStatus() {
    emit(state.copyWith(
      newPlanDetailStatus: const Initial(),
    ));
  }

  void resetBookmarkStatus() {
    emit(state.copyWith(
      newBookmarkStatus: const Initial(),
    ));
  }

  void resetSetCurrentPlanStatus() {
    emit(state.copyWith(
      newSetCurrentPlanStatus: const Initial(),
    ));
  }

  void resetAllStatuses() {
    emit(const ExercisePlanState());
  }
}