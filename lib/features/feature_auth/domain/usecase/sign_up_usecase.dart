import 'package:dartz/dartz.dart';

import '../../../../common/params/sign_up_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../locator.dart';
import '../repository/auth_repository.dart';

class SignUpUsecase extends UseCase<Either, SignUpParams> {
  @override
  Future<Either> call({SignUpParams? param}) async {
    return await sl<AuthRepository>().signUp(param!);
  }
}
