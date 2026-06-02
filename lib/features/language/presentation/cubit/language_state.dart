part of 'language_cubit.dart';

class LanguageState extends Equatable {
  final Language currentLanguage;
  final GetLanguageStatus getLanguageStatus;
  final SaveLanguageStatus saveLanguageStatus;

  const LanguageState({
    required this.getLanguageStatus,
    required this.saveLanguageStatus,
    required this.currentLanguage,
  });

  LanguageState copyWith({
    Language? currentLanguage,
    GetLanguageStatus? newGetLanguageStatus,
    SaveLanguageStatus? newSaveLanguageStatus,
  }) {
    return LanguageState(
      currentLanguage: currentLanguage ?? this.currentLanguage,
      getLanguageStatus: newGetLanguageStatus ?? getLanguageStatus,
      saveLanguageStatus: newSaveLanguageStatus ?? saveLanguageStatus,
    );
  }

  @override
  List<Object?> get props => [
        currentLanguage,
        getLanguageStatus,
        saveLanguageStatus,
      ];
}
