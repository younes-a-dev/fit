import 'package:dartz/dartz.dart';

import '../../../../common/params/exercise_plan_query.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/exercise_plan_entity.dart';
import '../repository/exercise_plan_repository.dart';


// Get Plans
class GetPlansUseCase implements UseCase<Either<Failure, List<ExercisePlanEntity>>, ExercisePlanQuery> {
  final ExercisePlanRepository repository;

  GetPlansUseCase(this.repository);

  @override
  Future<Either<Failure, List<ExercisePlanEntity>>> call({ExercisePlanQuery? param}) {
    return repository.getPlans(query: param);
  }
}

// Get Plan Detail
class GetPlanDetailsUseCase implements UseCase<Either<Failure, ExercisePlanEntity>, String> {
  final ExercisePlanRepository repository;

  GetPlanDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, ExercisePlanEntity>> call({String? param}) {
    return repository.getPlanDetails(param!);
  }
}

// Bookmark Plan
class BookmarkPlanUseCase implements UseCase<Either<Failure, Unit>, String> {
  final ExercisePlanRepository repository;

  BookmarkPlanUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call({String? param}) {
    return repository.bookmarkPlan(param!);
  }
}

// Remove Bookmark
class RemoveBookmarkUseCase implements UseCase<Either<Failure, Unit>, String> {
  final ExercisePlanRepository repository;

  RemoveBookmarkUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call({String? param}) {
    return repository.removeBookmark(param!);
  }
}


// Set current Plan
class SetCurrentPlanUseCase implements UseCase<Either<Failure, Unit>, String> {
  final ExercisePlanRepository repository;

  SetCurrentPlanUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call({String? param}) {
    return repository.setCurrentPlan(param!);
  }
}