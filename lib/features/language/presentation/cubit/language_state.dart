part of 'language_cubit.dart';

class LanguageState {
  final GetLanguageStatus? getLanguageStatus;
  final SaveLanguageStatus? saveLanguageStatus;

  LanguageState({this.getLanguageStatus, this.saveLanguageStatus});

  LanguageState copyWith({
    GetLanguageStatus? newGetLanguageStatus,
    SaveLanguageStatus? newSaveLanguageStatus,
  }) {
    return LanguageState(
      getLanguageStatus: newGetLanguageStatus ?? getLanguageStatus,
      saveLanguageStatus: newSaveLanguageStatus ?? saveLanguageStatus,
    );
  }
}
