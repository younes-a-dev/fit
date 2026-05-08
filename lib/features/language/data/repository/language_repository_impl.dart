import 'package:dartz/dartz.dart';
import 'package:workout/core/constants/enums.dart';
import 'package:workout/core/error/failures.dart';
import 'package:workout/features/language/domain/entity/language_entity.dart';

import '../../domain/repository/language_repository.dart';
import '../data_source/language_local_data_source.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  final LanguageLocalDataSource localDatasource;

  LanguageRepositoryImpl(this.localDatasource);

  @override
  Future<Either<Failure, LanguageEntity>> getSavedLanguage() async {
    try {
      final languageCode = await localDatasource.getLanguage();
      final language = LanguageExtension.fromCode(languageCode);
      return Right(LanguageEntity(language: language));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveLanguage(LanguageEntity language) async {
    try {
      await localDatasource.saveLanguage(language.language.code);
      return Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}