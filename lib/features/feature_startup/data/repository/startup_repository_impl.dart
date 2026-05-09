import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entity/app_state_entity.dart';
import '../../domain/repository/startup_repository.dart';
import '../data_source/startup_local_data_source.dart';
import '../data_source/startup_remote_data_source.dart';

class StartupRepositoryImpl implements StartupRepository {
  final StartupRemoteDataSource _dataSource;
  final StartupLocalDataSource _localDataSource;

  StartupRepositoryImpl(this._dataSource, this._localDataSource);

  @override
  Future<Either<Failure, bool>> checkInternet() async {
    try {
      final result = await _dataSource.checkInternetConnection();
      return Right(result);
    } on CustomException catch (e) {
      if (e is NetworkException) {
        return Left(NetworkFailure(e.message));
      } else {
        return Left(ServerFailure(e.message));
      }
    } catch (_) {
      return Left(ServerFailure('Unexpected Error'));
    }
  }

  @override
  Future<Either<Failure, AppStateEntity>> checkAppState() async {
    try {
      final appState = await _dataSource.getAppState();
      return Right(appState);
    } on CustomException catch (e) {
      if (e is NetworkException) return Left(NetworkFailure(e.message));
      if (e is BusinessException) return Left(BusinessFailure(e.message));
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('Unexpected Error'));
    }
  }

  @override
  Future<Either<Failure, bool>> checkFirstTime() async {
    try {
      final result = await _localDataSource.checkFirstTime();
      return Right(result);
    } catch (e) {
      return Left(LocalFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setFirstTime() async {
    try {
      await _localDataSource.setFirstTime();
      return const Right(null);
    } catch (e) {
      return Left(LocalFailure(e.toString()));
    }
  }
}
