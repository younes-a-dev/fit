import 'package:dartz/dartz.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../locator.dart';
import '../repository/auth_repository.dart';

class SendEmailUsecase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? param}) async {
    return await sl<AuthRepository>().sendEmail(param!);
  }
}
