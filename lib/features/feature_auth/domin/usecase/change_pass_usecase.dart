import 'package:dartz/dartz.dart';

import '../../../../common/params/change_pass_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../locator.dart';
import '../repository/auth_repository.dart';

class ChangePassUsecase extends UseCase<Either, ChangePassParams> {
  @override
  Future<Either> call({ChangePassParams? param}) async {
    return await sl<AuthRepository>().changePassword(param!);
  }
}
