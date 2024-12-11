import 'package:dartz/dartz.dart';

import '../../../../common/params/sign_in_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../locator.dart';
import '../repository/auth_repository.dart';

class SigninUsecase extends UseCase<Either, SignInParams> {
  @override
  Future<Either> call({SignInParams? param}) async {
    return await sl<AuthRepository>().signin(param!);
  }
}
