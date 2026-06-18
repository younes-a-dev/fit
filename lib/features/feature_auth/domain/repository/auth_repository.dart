import 'package:dartz/dartz.dart';

import '../../../../common/params/change_pass_params.dart';
import '../../../../common/params/reset_password_params.dart';
import '../../../../common/params/sign_in_params.dart';
import '../../../../common/params/sign_up_params.dart';
import '../../../../common/params/verify_email_params.dart';
import '../../../../common/params/verify_reset_code_params.dart';
import '../../../../core/error/failures.dart';
import '../entity/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure,AuthEntity>> signUpWithEmail(SignUpWithEmailParams params);
  Future<Either<Failure,AuthEntity>> verifyEmail(VerifyEmailParams param);
  Future<Either<Failure,AuthEntity>> signInWithEmail(SignInWithEmailParams params);
  Future<Either<Failure,Unit>> changePassword(ChangePassParams params);
  // these 3 api is for forgot password
  Future<Either<Failure,Unit>> requestResetCode(String email);
  Future<Either<Failure,String>> verifyResetCode(VerifyResetCodeParams params);
  Future<Either<Failure,Unit>> resetPassword(ResetPasswordParams params);
  Future<Either<Failure,bool>> isLoggedIn();
  Future<Either<Failure,Unit>> logout();
}
