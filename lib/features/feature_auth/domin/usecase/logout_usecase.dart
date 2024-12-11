import '../../../../core/usecase/usecase.dart';
import '../../../../locator.dart';
import '../repository/auth_repository.dart';

class LogoutUsecase extends UseCase<dynamic, dynamic> {
  @override
  Future call({dynamic param}) async {
    return await sl<AuthRepository>().logout();
  }
}
