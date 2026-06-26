import 'package:dartz/dartz.dart';

import '../../../../common/params/complete_initial_setup_params.dart';
import '../../../../core/error/failures.dart';
import '../entity/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure,UserEntity>> getCurrentUser();
  Future<Either<Failure,UserEntity>> completeInitialSetup(CompleteInitialSetupParams params);
  Future<Either<Failure,Unit>> clearUserCache();
  Future<Either<Failure,UserEntity>> getCachedUser();
}