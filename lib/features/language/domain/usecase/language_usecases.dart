import 'package:dartz/dartz.dart';
import 'package:workout/features/language/domain/entity/language_entity.dart';
import 'package:workout/features/language/domain/repository/language_repository.dart';

import '../../../../core/error/failures.dart';

// Get Language
class GetSavedLanguageUseCase {
  final LanguageRepository _repository;

  GetSavedLanguageUseCase(this._repository);

  Future<Either<Failure, LanguageEntity>> call() async {
    return await _repository.getSavedLanguage();
  }
}

// Save Language
class SaveLanguageUseCase {
  final LanguageRepository _repository;

  SaveLanguageUseCase(this._repository);

  Future<Either<Failure, void>> call(LanguageEntity language) async {
    return await _repository.saveLanguage(language);
  }
}