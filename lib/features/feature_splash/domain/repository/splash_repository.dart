import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/app_state_entity.dart';

abstract class SplashRepository {
  Future<Either<Failure, bool>> checkInternet();
  Future<Either<Failure, AppStateEntity>> checkAppState();
  Future<Either<Failure, bool>> checkFirstTime();
  Future<Either<Failure, bool>> checkLoggedIn();
  Future<Either<Failure,void>> setFirstTime();
}