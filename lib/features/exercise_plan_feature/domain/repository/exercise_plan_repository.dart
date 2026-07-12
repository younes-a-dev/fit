import 'package:dartz/dartz.dart';

import '../../../../common/params/create_custom_plan_params.dart';
import '../../../../common/params/exercise_plan_query.dart';
import '../../../../common/params/generate_ai_plan_params.dart';
import '../../../../common/params/generate_plan_params.dart';
import '../../../../common/params/update_plan_params.dart';
import '../../../../core/error/failures.dart';
import '../entity/exercise_plan_entity.dart';

abstract class ExercisePlanRepository {
  Future<Either<Failure, List<ExercisePlanEntity>>> getPlans({
    ExercisePlanQuery? query,
  });
  Future<Either<Failure, ExercisePlanEntity>> getPlanDetails(String id);
  Future<Either<Failure, Unit>> bookmarkPlan(String id);
  Future<Either<Failure, Unit>> removeBookmark(String id);
  Future<Either<Failure, Unit>> setCurrentPlan(String id);
  Future<Either<Failure, ExercisePlanEntity>> createCustomPlan(CreateCustomPlanParams prarams);
  Future<Either<Failure, ExercisePlanEntity>> updatePlan(UpdatePlanParams params);
  Future<Either<Failure,Unit>> deletePlan(String id);
  Future<Either<Failure,ExercisePlanEntity>> generateAiPlan(GenerateAiPlanParams params);
  Future<Either<Failure,ExercisePlanEntity>> generatePlan(GeneratePlanParams params);
}