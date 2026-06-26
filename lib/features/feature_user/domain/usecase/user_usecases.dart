import 'package:dartz/dartz.dart';

import '../../../../common/params/complete_initial_setup_params.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/user_entity.dart';
import '../repository/user_repository.dart';

class GetCurrentUserUseCase implements UseCase<Either<Failure,UserEntity>,NoParams>{
  final UserRepository _repository;
  GetCurrentUserUseCase(this._repository);

  @override
  Future<Either<Failure,UserEntity>> call({NoParams? param}){
    return _repository.getCurrentUser();
  }
}

class CompleteInitialSetupUseCase implements UseCase<Either<Failure,UserEntity>,CompleteInitialSetupParams>{
  final UserRepository _repository;
  CompleteInitialSetupUseCase(this._repository);
  
  @override
  Future<Either<Failure,UserEntity>> call({CompleteInitialSetupParams? param}){
    return _repository.completeInitialSetup(param!);
  }
}