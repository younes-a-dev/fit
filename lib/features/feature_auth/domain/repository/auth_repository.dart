import 'package:dartz/dartz.dart';

import '../../../../common/params/change_pass_params.dart';
import '../../../../common/params/sign_in_params.dart';
import '../../../../common/params/sign_up_params.dart';
import '../../../../core/error/failures.dart';

abstract class AuthRepository {
  Future<Either> signUp(SignUpParams params);
  // get code for register
  Future<Either> sendEmail(String param);
  Future<Either<Failure,bool>> isLoggedIn();
  Future logout();
  Future<Either> signin(SignInParams params);
  // get code for change pass
  Future<Either> passChangeCode(String param);
  Future<Either> changePassword(ChangePassParams params);
}
