import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/status/base_status.dart';
import '../../domain/entity/exercise_plan_entity.dart';

class ExercisePlanState extends Equatable {
  final BaseStatus<List<ExercisePlanEntity>> getPlansStatus;
  final BaseStatus<ExercisePlanEntity> getPlanDetailStatus;
  final BaseStatus<Unit> bookmarkStatus;
  final BaseStatus<Unit> setCurrentPlanStatus;

  const ExercisePlanState({
    this.getPlansStatus = const Initial(),
    this.getPlanDetailStatus = const Initial(),
    this.bookmarkStatus = const Initial(),
    this.setCurrentPlanStatus = const Initial(),
  });

  ExercisePlanState copyWith({
    BaseStatus<List<ExercisePlanEntity>>? newPlansStatus,
    BaseStatus<ExercisePlanEntity>? newPlanDetailStatus,
    BaseStatus<Unit>? newBookmarkStatus,
    BaseStatus<Unit>? newSetCurrentPlanStatus,
  }) {
    return ExercisePlanState(
      getPlansStatus: newPlansStatus ?? getPlansStatus,
      getPlanDetailStatus: newPlanDetailStatus ?? getPlanDetailStatus,
      bookmarkStatus: newBookmarkStatus ?? bookmarkStatus,
      setCurrentPlanStatus: newSetCurrentPlanStatus ?? setCurrentPlanStatus,
    );
  }

  @override
  List<Object?> get props => [
    getPlansStatus,
    getPlanDetailStatus,
    bookmarkStatus,
    setCurrentPlanStatus,
  ];
}