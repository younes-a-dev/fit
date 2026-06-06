import 'package:dartz/dartz.dart';
import 'package:workout/common/params/reset_password_params.dart';
import 'package:workout/common/params/verify_reset_code_params.dart';

import '../../../../common/params/change_pass_params.dart';
import '../../../../common/params/sign_in_params.dart';
import '../../../../common/params/sign_up_params.dart';
import '../../../../common/params/verify_email_params.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entity/auth_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_local_data_source.dart';
import '../data_source/auth_remote_data_source.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalDataSource _authLocalService;
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authLocalService, this._authRemoteDataSource);

  @override
  Future<Either<Failure, AuthEntity>> signUpWithEmail(
      SignUpWithEmailParams params) async {
    try {
      AuthEntity authEntity =
          await _authRemoteDataSource.signUpWithEmail(params);
      return Right(authEntity);
    } on CustomException catch (e) {
      if (e is NetworkException) return Left(NetworkFailure(e.message));
      if (e is BusinessException) return Left(BusinessFailure(e.message));
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('Unexpected Error'));
    }
  }

  @override
  Future<Either<Failure, Unit>> verifyEmail(VerifyEmailParams param) async {
    try {
      final String token = await _authRemoteDataSource.verifyEmail(param);
      await _authLocalService.saveToken(token);
      return Right(unit);
    } on CustomException catch (e) {
      if (e is NetworkException) return Left(NetworkFailure(e.message));
      if (e is BusinessException) return Left(BusinessFailure(e.message));
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('Unexpected Error'));
    }
  }

  @override
  Future<Either<Failure, Unit>> signInWithEmail(
      SignInWithEmailParams params) async {
    try {
      final String token = await _authRemoteDataSource.signInWithEmail(params);
      await _authLocalService.saveToken(token);
      return Right(unit);
    } on CustomException catch (e) {
      if (e is NetworkException) return Left(NetworkFailure(e.message));
      if (e is BusinessException) return Left(BusinessFailure(e.message));
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('Unexpected Error'));
    }
  }

  @override
  Future<Either<Failure, Unit>> changePassword(ChangePassParams params) async {
    try {
      await _authRemoteDataSource.changePassword(params);
      return Right(unit);
    } on CustomException catch (e) {
      if (e is NetworkException) return Left(NetworkFailure(e.message));
      if (e is BusinessException) return Left(BusinessFailure(e.message));
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('Unexpected Error'));
    }
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      final result = await _authLocalService.isLoggedIn();
      return Right(result);
    } catch (e) {
      return Left(LocalFailure(e.toString()));
    }
  }


  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await _authLocalService.logout();
      return Right(unit);
    } catch (e) {
      return Left(LocalFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> requestResetCode(String email) async {
    try {
      await _authRemoteDataSource.requestResetCode(email);
      return Right(unit);
    } on CustomException catch (e) {
      if (e is NetworkException) return Left(NetworkFailure(e.message));
      if (e is BusinessException) return Left(BusinessFailure(e.message));
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('Unexpected Error'));
    }
  }

  @override
  Future<Either<Failure, String>> verifyResetCode(
      VerifyResetCodeParams params) async {
    try {
      final String resetToken =
          await _authRemoteDataSource.verifyResetCode(params);
      return Right(resetToken);
    } on CustomException catch (e) {
      if (e is NetworkException) return Left(NetworkFailure(e.message));
      if (e is BusinessException) return Left(BusinessFailure(e.message));
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('Unexpected Error'));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword(
      ResetPasswordParams params) async {
    try {
      await _authRemoteDataSource.resetPassword(params);
      return Right(unit);
    } on CustomException catch (e) {
      if (e is NetworkException) return Left(NetworkFailure(e.message));
      if (e is BusinessException) return Left(BusinessFailure(e.message));
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('Unexpected Error'));
    }
  }
}
