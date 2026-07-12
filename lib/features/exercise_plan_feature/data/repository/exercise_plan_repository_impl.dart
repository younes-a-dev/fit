import 'package:dartz/dartz.dart';

import '../../../../common/params/create_custom_plan_params.dart';
import '../../../../common/params/exercise_plan_query.dart';
import '../../../../common/params/generate_ai_plan_params.dart';
import '../../../../common/params/generate_plan_params.dart';
import '../../../../common/params/update_plan_params.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entity/exercise_plan_entity.dart';
import '../../domain/repository/exercise_plan_repository.dart';
import '../data_source/exercise_plan_local_data_source.dart';
import '../data_source/exercise_plan_remote_data_source.dart';
import '../model/exercise_plan_model.dart';

class ExercisePlanRepositoryImpl implements ExercisePlanRepository {
  final ExercisePlanRemoteDataSource _remote;
  final ExercisePlanLocalDataSource _local;

  ExercisePlanRepositoryImpl(this._remote, this._local);

  @override
  Future<Either<Failure, List<ExercisePlanEntity>>> getPlans({
    ExercisePlanQuery? query,
  }) async {
    try {
      final plans = await _remote.getPlans(query: query);
      // Only cache if no filters are applied (full list)
      if (query == null || !_isFiltered(query)) {
        await _local.cachePlans(plans);
      }
      return Right(plans);
    } on CustomException catch (e) {
      // Always return cached full list, regardless of query
      final cached = await _local.getCachedPlans();
      if (cached.isNotEmpty && (query == null || !_isFiltered(query))) {
        return Right(cached);
      }
      if (e is NetworkException) return Left(NetworkFailure(e.message));
      if (e is BusinessException) return Left(BusinessFailure(e.message));
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('Unhandled Exception'));
    }
  }

  @override
  Future<Either<Failure, ExercisePlanEntity>> getPlanDetails(String id) async {
    try {
      final plan = await _remote.getPlanDetails(id);
      return Right(plan);
    } on CustomException catch (e) {
      final cached = await _local.getCachedPlans();
      try {
        final plan = cached.firstWhere((p) => p.id == id);
        return Right(plan);
      } catch (_) {}
      if (e is NetworkException) return Left(NetworkFailure(e.message));
      if (e is BusinessException) return Left(BusinessFailure(e.message));
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('Unhandled Exception'));
    }
  }

  @override
  Future<Either<Failure, Unit>> bookmarkPlan(String id) async {
    try {
      await _remote.bookmarkPlan(id);
      // Update local cache if available
      await _updateCachedPlanBookmark(id, true);
      return const Right(unit);
    } on CustomException catch (e) {
      if (e is NetworkException) return Left(NetworkFailure(e.message));
      if (e is BusinessException) return Left(BusinessFailure(e.message));
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('Unhandled Exception'));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeBookmark(String id) async {
    try {
      await _remote.removeBookmark(id);
      // Update local cache if available
      await _updateCachedPlanBookmark(id, false);
      return const Right(unit);
    } on CustomException catch (e) {
      if (e is NetworkException) return Left(NetworkFailure(e.message));
      if (e is BusinessException) return Left(BusinessFailure(e.message));
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('Unhandled Exception'));
    }
  }

  @override
  Future<Either<Failure, Unit>> setCurrentPlan(String id) async {
    try {
      await _remote.setCurrentPlan(id);
      // Update local cache
      await _updateCachedPlanCurrent(id);
      return const Right(unit);
    } on CustomException catch (e) {
      if (e is NetworkException) return Left(NetworkFailure(e.message));
      if (e is BusinessException) return Left(BusinessFailure(e.message));
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('Unhandled Exception'));
    }
  }

  // Helper methods for cache management
  bool _isFiltered(ExercisePlanQuery query) {
    return query.search != null ||
        query.category != null ||
        query.difficulty != null ||
        query.location != null ||
        query.targetMuscles != null ||
        query.source != null;
  }

  Future<void> _updateCachedPlanBookmark(String id, bool isBookmarked) async {
    final cached = await _local.getCachedPlans();
    if (cached.isNotEmpty) {
      final updated = cached.map((plan) {
        if (plan.id == id) {
          return plan.copyWith(isBookmarked : isBookmarked);
        }
        return plan;
      }).toList();
      await _local.cachePlans(updated.cast<ExercisePlanModel>());
    }
  }

  Future<void> _updateCachedPlanCurrent(String id) async {
    final cached = await _local.getCachedPlans();
    if (cached.isNotEmpty) {
      final updated = cached.map((plan) {
        return plan.copyWith(isCurrentPlan: plan.id == id);
      }).toList();
      await _local.cachePlans(updated.cast<ExercisePlanModel>());
    }
  }

  @override
  Future<Either<Failure, ExercisePlanEntity>> createCustomPlan(CreateCustomPlanParams prarams) {
    // TODO: implement createCustomPlan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePlan(String id) {
    // TODO: implement deletePlan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ExercisePlanEntity>> generateAiPlan(GenerateAiPlanParams params) {
    // TODO: implement generateAiPlan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ExercisePlanEntity>> generatePlan(GeneratePlanParams params) {
    // TODO: implement generatePlan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ExercisePlanEntity>> updatePlan(UpdatePlanParams params) {
    // TODO: implement updatePlan
    throw UnimplementedError();
  }

}