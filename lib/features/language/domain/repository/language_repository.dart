import 'package:dartz/dartz.dart';
import 'package:workout/features/language/domain/entity/language_entity.dart';

import '../../../../core/error/failures.dart';

abstract class LanguageRepository {
  Future<Either<Failure,LanguageEntity>> getSavedLanguage();
  Future<Either<Failure,void>> saveLanguage(LanguageEntity language);
}