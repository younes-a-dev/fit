import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/exercise_entity.dart';
import '../repository/exercise_repository.dart';

class GetExerciseDetailsUseCase
    implements UseCase<Either<Failure, ExerciseEntity>, String> {
  final ExerciseRepository repository;

  GetExerciseDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, ExerciseEntity>> call({String? param}) {
    return repository.getExerciseDetails(param!);
  }
}
