import 'package:dartz/dartz.dart';

import '../../../../common/params/exercise_query.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entity/exercise_entity.dart';
import '../../domain/repository/exercise_repository.dart';
import '../data_source/exercise_local_data_source.dart';
import '../data_source/exercise_remote_data_source.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseRemoteDataSource _remote;
  final ExerciseLocalDataSource _local;

  ExerciseRepositoryImpl(this._remote, this._local);

  @override
  Future<Either<Failure, List<ExerciseEntity>>> getExercises(
      {ExerciseQuery? query}) async {
    try {
      final exercises = await _remote.getExercises(query: query);
      // Only cache if no filters are applied (full list)
      if (query == null || _isFiltered(query) == false) {
        await _local.cacheExercises(exercises);
      }
      return Right(exercises);
    } on CustomException catch (e) {
      // Always return cached full list, regardless of query
      final cached = await _local.getCachedExercises();
      if (cached.isNotEmpty&& (query == null || !_isFiltered(query))) {
        return Right(cached);
      }
      if (e is NetworkException) return Left(NetworkFailure(e.message));
      if (e is BusinessException) return Left(BusinessFailure(e.message));
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('Unhandled Exception'));
    }
  }

  bool _isFiltered(ExerciseQuery query) {
    return query.search != null ||
        query.muscle != null ||
        query.equipment != null ||
        query.difficulty != null ||
        query.needEquipment != null;
  }

  @override
  Future<Either<Failure,ExerciseEntity>> getExerciseDetails(String exerciseId) async{
    try{
      final exercise = await _remote.getExerciseDetails(exerciseId);
      return Right(exercise);
    } on CustomException catch(e){
      final cached = await _local.getCachedExercises();
      try{
        final exercise = cached.firstWhere((e)=> e.id == exerciseId);
        return Right(exercise);
      }catch(_){}
      if (e is NetworkException) return Left(NetworkFailure(e.message));
      if (e is BusinessException) return Left(BusinessFailure(e.message));
      return Left(ServerFailure(e.message));
    }catch(_){
      return Left(ServerFailure('Unhandled Exception'));
    }
  }
}
