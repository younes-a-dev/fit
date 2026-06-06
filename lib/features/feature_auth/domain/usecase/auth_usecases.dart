import 'package:dartz/dartz.dart';

import '../../../../common/params/change_pass_params.dart';
import '../../../../common/params/reset_password_params.dart';
import '../../../../common/params/sign_in_params.dart';
import '../../../../common/params/sign_up_params.dart';
import '../../../../common/params/verify_email_params.dart';
import '../../../../common/params/verify_reset_code_params.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/auth_entity.dart';
import '../repository/auth_repository.dart';

// Check Logged In
class CheckLoggedInUseCase implements UseCase<Either<Failure, bool>, NoParams> {
  final AuthRepository _authRepository;
  CheckLoggedInUseCase(this._authRepository);

  @override
  Future<Either<Failure, bool>> call({NoParams? param}) {
    return _authRepository.isLoggedIn();
  }
}

// SignUp - Email
class SignUpWithEmailUseCase
    implements UseCase<Either<Failure, AuthEntity>, SignUpWithEmailParams> {
  final AuthRepository _authRepository;
  SignUpWithEmailUseCase(this._authRepository);

  @override
  Future<Either<Failure, AuthEntity>> call({SignUpWithEmailParams? param}) {
    return _authRepository.signUpWithEmail(param!);
  }
}

// Verify Email
class VerifyEmailUseCase implements UseCase<Either<Failure,Unit>,VerifyEmailParams>{
  final AuthRepository _authRepository;
  VerifyEmailUseCase(this._authRepository);

  @override
  Future<Either<Failure,Unit>> call({VerifyEmailParams? param}){
    return _authRepository.verifyEmail(param!);
  }

}

// SignIn - Email
class SignInWithEmailUseCase
    implements UseCase<Either<Failure, Unit>, SignInWithEmailParams> {
  final AuthRepository _authRepository;
  SignInWithEmailUseCase(this._authRepository);

  @override
  Future<Either<Failure, Unit>> call({SignInWithEmailParams? param}) {
    return _authRepository.signInWithEmail(param!);
  }
}

// Change Password
class ChangePasswordUseCase implements UseCase<Either<Failure,Unit>,ChangePassParams>{
  final AuthRepository _authRepository;
  ChangePasswordUseCase(this._authRepository);

  @override
  Future<Either<Failure,Unit>> call({ChangePassParams? param}){
    return _authRepository.changePassword(param!);
  }
}

// Request Reset Code
class RequestResetCodeUseCase implements UseCase<Either<Failure,Unit>,String>{
  final AuthRepository _authRepository;
  RequestResetCodeUseCase(this._authRepository);

  @override
  Future<Either<Failure,Unit>> call({String? param}){
    return _authRepository.requestResetCode(param!);
  }
}

// Verify Reset Code
class VerifyResetCodeUseCase implements UseCase<Either<Failure,String>,VerifyResetCodeParams>{
  final AuthRepository _authRepository;
  VerifyResetCodeUseCase(this._authRepository);

  @override
  Future<Either<Failure,String>> call({VerifyResetCodeParams? param}){
    return _authRepository.verifyResetCode(param!);
  }
}

// Reset Password
class ResetPasswordUseCase implements UseCase<Either<Failure,Unit>,ResetPasswordParams>{
  final AuthRepository _authRepository;
  ResetPasswordUseCase(this._authRepository);

  @override
  Future<Either<Failure,Unit>> call ({ResetPasswordParams? param}){
    return _authRepository.resetPassword(param!);
  }
}

// Logout
class LogoutUseCase implements UseCase<Either<Failure,Unit>,NoParams>{
  final AuthRepository _authRepository;
  LogoutUseCase(this._authRepository);

  @override
  Future<Either<Failure,Unit>> call({NoParams? param}){
    return _authRepository.logout();
  }
}