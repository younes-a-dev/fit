import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/constants/enums.dart';
import '../../domain/entity/language_entity.dart';
import '../../domain/usecase/language_usecases.dart';

part 'language_state.dart';
part 'save_language_status.dart';
part 'get_language_status.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final GetSavedLanguageUseCase _getSavedLanguageUseCase;
  final SaveLanguageUseCase _saveLanguageUseCase;

  LanguageCubit(this._getSavedLanguageUseCase, this._saveLanguageUseCase)
      : super(LanguageState(
            currentLanguage: Language.english,
            getLanguageStatus: GetLanguageInitial(),
            saveLanguageStatus: SaveLanguageInitial()));

  Future<void> getLanguageEvent() async {
    emit(state.copyWith(newGetLanguageStatus: GetLanguageLoading()));

    final result = await _getSavedLanguageUseCase();

    result.fold(
      (failure) => emit(state.copyWith(
        newGetLanguageStatus: GetLanguageError(failure.message),
      )),
      (languageEntity) => emit(state.copyWith(
        currentLanguage: languageEntity.language,
        newGetLanguageStatus: GetLanguageCompleted(),
      )),
    );
  }

  Future<void> saveLanguageEvent(Language language) async {
    emit(state.copyWith(newSaveLanguageStatus: SaveLanguageLoading()));

    final result = await _saveLanguageUseCase(LanguageEntity(language: language));

    result.fold(
      (failure) => emit(state.copyWith(
          newSaveLanguageStatus: SaveLanguageError(failure.message))),
      (_) => emit(state.copyWith(
        currentLanguage: language,
        newSaveLanguageStatus: SaveLanguageCompleted(),
      )),
    );
  }

  // void resetLanguageStatus() {
  //   emit(LanguageState(
  //
  //     saveLanguageStatus: SaveLanguageInitial(),
  //     getLanguageStatus: GetLanguageInitial(),
  //   ));
  // }
}
