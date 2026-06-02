part of 'language_cubit.dart';

@immutable
abstract class SaveLanguageStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

class SaveLanguageInitial extends SaveLanguageStatus {}

class SaveLanguageLoading extends SaveLanguageStatus {}

class SaveLanguageCompleted extends SaveLanguageStatus {}

class SaveLanguageError extends SaveLanguageStatus {
  final String message;
  SaveLanguageError(this.message);

  @override
  List<Object?> get props => [message];
}