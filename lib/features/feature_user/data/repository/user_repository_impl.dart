import 'package:dartz/dartz.dart';

import '../../../../common/params/complete_initial_setup_params.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repository/user_repository.dart';
import '../data_source/user_local_data_source.dart';
import '../data_source/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _dataSource;
  final UserLocalDataSource _localDataSource;

  UserRepositoryImpl(this._dataSource, this._localDataSource);



  @override
  Future<Either<Failure, UserEntity>> completeInitialSetup(
      CompleteInitialSetupParams params) async {
    try {
      final user = await _dataSource.completeInitialSetup(params);
      await _localDataSource.cacheUser(user);
      return Right(user);
    } on CustomException catch (e) {
      if (e is NetworkException) return Left(NetworkFailure(e.message));
      if (e is BusinessException) return Left(BusinessFailure(e.message));
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('Unhandled Exception...'));
    }
  }



  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final user = await _dataSource.getCurrentUser();
      await _localDataSource.cacheUser(user);
      return Right(user);
    } on CustomException catch (e) {
      final cachedUser = await _localDataSource.getCachedUser();
      if (cachedUser != null) {
        return Right(cachedUser);
      }
      if (e is NetworkException) return Left(NetworkFailure(e.message));
      if (e is BusinessException) return Left(BusinessFailure(e.message));
      return Left(ServerFailure(e.message));
    }
  }



  @override
  Future<Either<Failure, Unit>> clearUserCache() async {
    try {
      await _localDataSource.clearUser();
      return Right(unit);
    } catch (e) {
      return Left(LocalFailure(e.toString()));
    }
  }



  @override
  Future<Either<Failure, UserEntity>> getCachedUser() async {
    try {
      final user = await _localDataSource.getCachedUser();
      if (user == null) {
        return Left(
          LocalFailure('No cached user found'),
        );
      }
      return Right(user);
    } catch (e) {
      return Left(LocalFailure(e.toString()));
    }
  }
}
