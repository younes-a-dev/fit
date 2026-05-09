import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
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
