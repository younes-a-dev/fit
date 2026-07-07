import 'package:dartz/dartz.dart';

import '../../../../common/params/exercise_query.dart';
import '../../../../core/error/failures.dart';
import '../entity/exercise_entity.dart';

abstract class ExerciseRepository {
  Future<Either<Failure, List<ExerciseEntity>>> getExercises({ExerciseQuery? query});
  Future<Either<Failure, ExerciseEntity>> getExerciseDetails(String exerciseId);
}