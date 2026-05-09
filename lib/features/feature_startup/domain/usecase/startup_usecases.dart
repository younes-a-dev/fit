import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/app_state_entity.dart';
import '../repository/startup_repository.dart';

// Check App State
class CheckAppStateUseCase implements UseCase<Either<Failure,AppStateEntity>,NoParams>{
  final StartupRepository _splashRepository;
  CheckAppStateUseCase(this._splashRepository);
  @override
  Future<Either<Failure, AppStateEntity>> call({NoParams? param}) {
    return _splashRepository.checkAppState();
  }
}

// Check FirstTime
class CheckFirstTimeUseCase implements UseCase<Either<Failure,bool>,NoParams>{
  final StartupRepository _splashRepository;
  CheckFirstTimeUseCase(this._splashRepository);
  @override
  Future<Either<Failure, bool>> call({NoParams? param}) {
    return _splashRepository.checkFirstTime();
  }
}

// Check Connection
class CheckInternetUseCase implements UseCase<Either<Failure,bool>,NoParams>{
  final StartupRepository _splashRepository;
  CheckInternetUseCase(this._splashRepository);
  @override
  Future<Either<Failure, bool>> call({NoParams? param}) {
    return _splashRepository.checkInternet();
  }
}

// Set First Time to true
class SetFirstTimeUseCase implements UseCase<Either<Failure,void>,NoParams>{
  final StartupRepository _splashRepository;
  SetFirstTimeUseCase(this._splashRepository);

  @override
  Future<Either<Failure,void>> call ({NoParams? param}){
    return _splashRepository.setFirstTime();
  }
}