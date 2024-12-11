import '../../../../core/usecase/usecase.dart';
import '../../../../locator.dart';
import '../repository/auth_repository.dart';

class IsLoggedInUsecase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({dynamic param}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
