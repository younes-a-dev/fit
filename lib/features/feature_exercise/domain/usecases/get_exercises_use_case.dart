import 'package:dartz/dartz.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../common/params/exercise_query.dart';
import '../../../../core/error/failures.dart';
import '../entity/exercise_entity.dart';
import '../repository/exercise_repository.dart';

class GetExercisesUseCase implements UseCase<Either<Failure,List<ExerciseEntity>>,ExerciseQuery> {
  final ExerciseRepository repository;

  GetExercisesUseCase(this.repository);

  @override
  Future<Either<Failure, List<ExerciseEntity>>> call({ExerciseQuery? param}) {
    return repository.getExercises(query: param);
  }
}
